package zy.news.web.service.impl;

import maoko.common.file.FileIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zy.news.web.bean.*;
import zy.news.web.zsys.bean.Page;
import zy.news.common.exception.WarningException;
import zy.news.web.mapper.HonourMapper;
import zy.news.web.service.IAnnex;
import zy.news.web.service.IFiles;
import zy.news.web.service.IHonour;
import zy.news.web.service.IUserCache;
import zy.news.web.zsys.bean.PageValuesParam;
import zy.news.web.zsys.bean.PageValuesResult;
import zy.news.web.zsys.utils.ServiceBase;
import zy.news.web.zsys.utils.ServiceUtil;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author maoko
 * @date 2020/3/7 17:40
 */
@Service
public class SvrImpHonour extends ServiceBase implements IHonour {
    private static final long IMG_DEFAULT_ID = 1L;
    private final HonourMapper mapper;
    private final IUserCache userCache;

    @Autowired
    public SvrImpHonour(HonourMapper mapper, IUserCache userCache, IAnnex annexService, IFiles filesService) {
        super(annexService, filesService);
        this.mapper = mapper;
        this.userCache = userCache;
    }

    @Override
    public boolean exist(Honour record,Honour tmpRecord) {
        if (null == tmpRecord &&null != record.getId() && record.getId() > 0) {
            tmpRecord = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        }
        if (tmpRecord == null) {
            return mapper.exist(record) > 0;
        } else {
            if (!record.getTitle().equals(tmpRecord.getTitle())) {
                return mapper.exist(record) > 0;
            }
            return false;
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(HttpSession session, Honour record) throws Exception {
        record.validate();

        if (exist(record,null)) {
            throw new Exception("名称已存在，请修改后再试一试！");
        }
        SysUser user = userCache.getUserFromSession(session);
        //赋值
        record.setId(new Long(FileIDUtil.getNextIdLong()));
        record.setAuthor(user.getRealname());
        record.setPublishdate(new Date());
        record.convertContent2Blob();
        record.setPageview(0L);

        //图片为空，设置默认图
        if (record.getImageid() == null || 0L >= record.getImageid().longValue()) {
            record.setImageid(IMG_DEFAULT_ID);
        }

        //插入news
        mapper.insert(record);

        //插入附件
        addAnnexs(record.getId(), record.getAnnexes());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(HttpSession session, Honour record) throws Exception {
        //验证
        if (null == record.getId()) {
            throw new Exception("id为空！");
        }
        Honour tmpRecord = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        if (null != tmpRecord) {
            mapper.deleteByPrimaryKey(record.getId());
            SysFile imgFile = null;
            if (IMG_DEFAULT_ID != tmpRecord.getImageid()) {
                imgFile = filesService.getFileInfo(tmpRecord.getImageid());
            }
            deleteAnnexs(record.getId(), imgFile);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(HttpSession session, Honour record) throws Exception {
        //验证
        record.validate();
        if (null == record.getId()) {
            throw new Exception("更新操作id不能为空！");
        }
        Honour tmpRecord = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        if (tmpRecord == null) {
            throw new Exception(record.getId() + "已不存在！");
        }
        if (exist(record,tmpRecord)) {
            throw new Exception(record.getTitle() + "名称已存在，请修改后再试一试！");
        }
        SysUser user = userCache.getUserFromSession(session);

        //赋值
        record.setAuthor(user.getRealname());
        record.setPublishdate(new Date());
        record.convertContent2Blob();

        //更新
        mapper.updateByPrimaryKey(record);

        //更新附件
        updateAnnexs(record.getId(), record.getAnnexes());
    }

    @Override
    public Honour getRecordDetail(Long id) throws Exception {
        Honour record = mapper.selectByPrimaryKey(id);
        if (null == record) {
            throw new WarningException("已不存在!");
        }
        ContentBase contentBase = mapper.selectContenBlobByPrimaryKey(id);
        mapper.countViewByPrimaryKey(id);
        record.setContent(contentBase.getContent());
        List<ArticlAnnex> annexes = annexService.getAnnexs(id);
        record.setAnnexes(annexes);
        return record;
    }

    @Override
    public PageValuesResult<Honour> getHonours(Page page) throws Exception {
        PageValuesParam<Honour> params = new PageValuesParam<>(mapper, "selectAll");
        return ServiceUtil.getValuePageResult(page, params);
    }
}
