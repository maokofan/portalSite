package zy.news.web.service.impl;

import maoko.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zy.news.web.zsys.bean.Page;
import zy.news.common.exception.WarningException;
import zy.news.web.bean.*;
import zy.news.web.mapper.CommentMapper;
import zy.news.web.service.IComment;
import zy.news.web.service.IUserCache;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.ui.result.ReviewInfo;
import zy.news.web.zsys.bean.PageValuesParam;
import zy.news.web.zsys.bean.PageValuesResult;
import zy.news.web.zsys.utils.ServiceUtil;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author maoko
 * @date 2020/3/5 13:50
 */
@Service
public class SvrImpComment implements IComment {
    private final CommentMapper mapper;
    private final IUserCache userCache;

    @Autowired
    public SvrImpComment(CommentMapper mapper, IUserCache userCache) {
        this.mapper = mapper;
        this.userCache = userCache;
    }

    @Deprecated
    @Override
    public boolean exist(Comment record,Comment tmprecord) {
        return false;
    }

    @Override
    public void add(HttpSession session, Comment record) throws Exception {
        record.validate();

        if (StringUtil.isStrNullOrWhiteSpace(record.getAuthor())) {
            record.setAuthor(Comment.匿名);
        }
        record.setPublishdate(new Date());
        record.setReviewstatus((byte) 0);

        //插入news
        mapper.insert(record);
    }

    @Override
    public void delete(HttpSession session, Comment record) throws Exception {
        //验证
        if (null == record.getId()) {
            throw new Exception("id为空！");
        }
        mapper.deleteByPrimaryKey(record.getId());
    }

    @Deprecated
    @Override
    public void update(HttpSession session, Comment record) throws Exception {

    }

    @Override
    public Comment getRecordDetail(Long id) throws Exception {
        Comment tmpRecord = mapper.selectByPrimaryKey(id);
        if (null == tmpRecord) {
            throw new WarningException(id.toString() + "已不存在!");
        }
        return tmpRecord;
    }


    @Override
    public PageValuesResult<CommentSimple> getComments(Byte articletype, Long articleid, Page page, ReviewStatus reviewStatus) throws Exception {
        PageValuesParam<CommentSimple> params = new PageValuesParam<>(mapper, "selectAllSimple");
        params.addParam(articletype);
        params.addParam(articleid);
        params.addParam(reviewStatus.getValue());
        return ServiceUtil.getValuePageResult(page, params);
    }

    @Override
    public PageValuesResult<CommentSimple> getComments(Page page, ReviewStatus reviewStatus) throws Exception {
        PageValuesParam<CommentSimple> params = new PageValuesParam<>(mapper, "selectAllComments");
        params.addParam(reviewStatus.getValue());
        return ServiceUtil.getValuePageResult(page, params);
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
            throw new Exception(id.toString() + "评论已不存在！");
        }
        return reviewInfo;
    }
}
