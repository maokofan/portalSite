package zy.news.web.service.impl;

import maoko.common.file.FileIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zy.news.web.bean.*;
import zy.news.web.ui.param.PageReview;
import zy.news.web.zsys.bean.Page;
import zy.news.common.exception.WarningException;
import zy.news.web.mapper.NoticeMapper;
import zy.news.web.service.IAnnex;
import zy.news.web.service.IFiles;
import zy.news.web.service.INotice;
import zy.news.web.service.IUserCache;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.ui.result.ReviewInfo;
import zy.news.web.zsys.bean.PageValuesParam;
import zy.news.web.zsys.bean.PageValuesResult;
import zy.news.web.zsys.utils.ServiceBase;
import zy.news.web.zsys.utils.ServiceUtil;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 通告管理
 *
 * @author maoko
 * @date 2020/3/3 10:41
 */
@Service
public class SvrImpNotice extends ServiceBase implements INotice {
    private final NoticeMapper mapper;
    private final IUserCache userCache;


    @Autowired
    public SvrImpNotice(NoticeMapper mapper, IUserCache userCache, IAnnex annexService, IFiles filesService) {
        super(annexService, filesService);
        this.mapper = mapper;
        this.userCache = userCache;
    }

    @Override
    public PageValuesResult<NoticeSimple> getNotice(PageReview pageReview) throws Exception {
        PageValuesParam<NoticeSimple> params = new PageValuesParam<>(mapper, "selectAllNoticeSimple");
        params.addParam(pageReview.getStatus().getValue());
        params.addParam(pageReview.getNotReview());
        return ServiceUtil.getValuePageResult(pageReview.getPage(), params);
    }

    @Override
    public boolean exist(Notice record, Notice tmpRecord) {
        if (null != record.getId() && record.getId() > 0) {
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
    public void add(HttpSession session, Notice record) throws Exception {
        record.validate();

        if (exist(record, null)) {
            throw new Exception("通告名称已存在，请修改后再试一试！");
        }
        SysUser user = userCache.getUserFromSession(session);
        //赋值
        record.setId(new Long(FileIDUtil.getNextIdLong()));
        record.setAuthor(user.getRealname());
        record.setPublishdate(new Date());
        record.convertContent2Blob();
        record.setReviewstatus((byte) 0);
        record.setPageview(0L);

        //插入news
        mapper.insert(record);

        //插入附件
        addAnnexs(record.getId(), record.getAnnexes());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(HttpSession session, Notice record) throws Exception {
        //验证
        if (null == record.getId()) {
            throw new Exception("id为空！");
        }
        Notice tmpNotice = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        if (null != tmpNotice) {
            mapper.deleteByPrimaryKey(record.getId());
            deleteAnnexs(record.getId());
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(HttpSession session, Notice record) throws Exception {
        //验证
        record.validate();
        if (null == record.getId()) {
            throw new Exception("更新通告操作id不能为空！");
        }
        Notice tmpRecord = mapper.selectRecordWithOutBlobByPrimaryKey(record.getId());
        if (tmpRecord == null) {
            throw new Exception(record.getId() + "通告已不存在！");
        }
        if (exist(record, tmpRecord)) {
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
    public Notice getRecordDetail(Long id) throws Exception {
        Notice record = mapper.selectDetailByPrimaryKey(id);
        if (null == record) {
            throw new WarningException(id.toString() + "通告已不存在!");
        }
        ContentBase contentBase = mapper.selectContenBlobByPrimaryKey(id);
        mapper.countViewByPrimaryKey(id);
        record.setContent(contentBase.getContent());
        List<ArticlAnnex> annexes = annexService.getAnnexs(id);
        record.setAnnexes(annexes);
        return record;
    }

    @Override
    public void review(HttpSession session, ReviewInfo info) throws Exception {
        SysUser user = userCache.getUserFromSession(session);
        info.setReviewer(user.getRealname());
        info.setReviewdate(new Date());
        info.validate();
        mapper.updateReviewInfo(info);
    }

    @Override
    public ReviewInfo getReviewComment(Long id) throws Exception {
        ReviewInfo reviewInfo = mapper.selectReviewInfoByPrimaryKey(id);
        if (reviewInfo == null) {
            throw new Exception(id.toString() + "通告已不存在！");
        }
        return reviewInfo;
    }
}
