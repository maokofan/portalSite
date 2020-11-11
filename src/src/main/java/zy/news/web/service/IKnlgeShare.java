package zy.news.web.service;

import zy.news.web.ui.param.PageReview;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.KnlgeShare;
import zy.news.web.bean.KnlgeShareSimple;
import zy.news.web.ui.param.Opinion;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.zsys.bean.PageValuesResult;

import javax.servlet.http.HttpSession;

/**
 * @author maoko
 * @date 2020/3/4 13:13
 */
public interface IKnlgeShare extends IBaseService<KnlgeShare>, IReview {
    /**
     * 分页获取列表
     *
     * @param session
     * @param pageReview
     * @param isGood     是否更具点赞度排序
     * @return
     * @throws Exception
     */
    PageValuesResult<KnlgeShareSimple> getKnowledgeShares(HttpSession session, PageReview pageReview, boolean isGood) throws Exception;

    /**
     * 点赞
     *
     * @param opinion 观点
     */
    void giveOpinion(Opinion opinion) throws Exception;


    KnlgeShare getRecordDetail(Long id, Byte type) throws Exception;
}
