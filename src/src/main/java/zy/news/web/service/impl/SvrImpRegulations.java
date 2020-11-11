package zy.news.web.service.impl;

import maoko.common.file.FileIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zy.news.web.bean.*;
import zy.news.web.ui.param.PageDeptParam;
import zy.news.web.zsys.bean.Page;
import zy.news.common.exception.WarningException;
import zy.news.web.mapper.RegulationsMapper;
import zy.news.web.service.IAnnex;
import zy.news.web.service.IFiles;
import zy.news.web.service.IRegulations;
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
 * @date 2020/3/7 16:10
 */
@Service
public class SvrImpRegulations extends ServiceBase implements IRegulations {
    private final RegulationsMapper mapper;
    private final IUserCache userCache;

    @Autowired
    public SvrImpRegulations(RegulationsMapper mapper, IUserCache userCache, IAnnex annexService, IFiles filesService) {
        super(annexService, filesService);
        this.mapper = mapper;
        this.userCache = userCache;
    }

    @Override
    public boolean exist(Regulations record, Regulations tmpRecord) {
        if (null == tmpRecord && null != record.getId() && record.getId() > 0) {
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
    public void add(HttpSession session, Regulations record) throws Exception {
        record.validate();

        if (exist(record, null)) {
            throw new Exception("名称已存在，请修改后再试一试！");
        }
        SysUser user = userCache.getUserFromSession(session);
        //赋值
        record.setId(new Long(FileIDUtil.getNextIdLong()));
        record.setAuthor(user.getRealname());
        record.setPublishdate(new Date());
        record.convertContent2Blob();
        record.setPageview(0L);

        //插入news
        mapper.insert(record);

        //插入附件
        addAnnexs(record.getId(), record.getAnnexes());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(HttpSession session, Regulations record) throws Exception {
        //验证
        if (null == record.getId()) {
            throw new Exception("id为空！");
        }
        Regulations tmpRecord = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        if (null != tmpRecord) {
            mapper.deleteByPrimaryKey(record.getId());
            deleteAnnexs(record.getId());
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(HttpSession session, Regulations record) throws Exception {
        //验证
        record.validate();
        if (null == record.getId()) {
            throw new Exception("更新操作id不能为空！");
        }
        Regulations tmpRecord = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        if (tmpRecord == null) {
            throw new Exception(record.getId() + "已不存在！");
        }
        if (exist(record, tmpRecord)) {
            throw new Exception(record.getTitle() + "名称已存在，请修改后再试一试！");
        }
        SysUser user = userCache.getUserFromSession(session);

        //赋值
        record.setAuthor(user.getRealname());
        record.setPublishdate(new Date());
        record.convertContent2Blob();
        record.setPageview(0L);

        //更新
        mapper.updateByPrimaryKey(record);

        //更新附件
        updateAnnexs(record.getId(), record.getAnnexes());
    }

    @Override
    public Regulations getRecordDetail(Long id) throws Exception {
        Regulations record = mapper.selectByPrimaryKey(id);
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
    public PageValuesResult<Regulations> getRegulations(PageDeptParam param) throws Exception {
        PageValuesParam<Regulations> params = new PageValuesParam<>(mapper, "selectAll");
        params.addParam(param.getDeptid());
        return ServiceUtil.getValuePageResult(param.getPage(), params);
    }
}
