package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.bean.KnlgeShareSimple;
import zy.news.web.ui.param.PageReview;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.Comment;
import zy.news.web.bean.CommentSimple;
import zy.news.web.service.IComment;
import zy.news.web.ui.param.PageIdParam;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.ui.result.ReviewInfo;
import zy.news.web.zsys.bean.*;

import javax.servlet.http.HttpSession;

/**
 * 评论管理
 *
 * @author maoko
 * @date 2020/3/5 13:48
 */
@RestController
@RequestMapping("/comment")
@ExcuteControllerDsrc("评论管理")
public class CommentController {

    private final IComment service;

    @Autowired
    public CommentController(IComment service) {
        this.service = service;
    }

    @PostMapping("addComment")
    @ExcuteInterfaceDsrc("添加评论")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public void addComment(@RequestBody Comment record) throws Exception {
        service.add(null, record);
    }

    @PostMapping("getComments")
    @ExcuteInterfaceDsrc("获取指定文章评论列表")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public PageValuesResult<CommentSimple> getComments(@RequestBody PageIdParam param) throws Exception {
        param.validate();
        return service.getComments(param.getArticletype(), param.getArticleid(), param.getPage(), ReviewStatus.已通过);
    }

    //region 评论审核-后台审核
    @PostMapping("getReviewRecords")
    @ExcuteInterfaceDsrc("获取已发布评论列表")
    @ExcutePermission
    public PageValuesResult<CommentSimple> getReviewRecords(@RequestBody PageReview param) throws Exception {
        return service.getComments(param.getPage(), param.getStatus());
    }

    @PostMapping("deleteComment")
    @ExcuteInterfaceDsrc("删除评论")
    @ExcutePermission
    public void deleteComment(HttpSession session, @RequestBody Comment record) throws Exception {
        service.delete(session, record);
    }


    @GetMapping("getReviewInfo")
    @ExcuteInterfaceDsrc("获取审核详情")
    @ExcutePermission
    public ReviewInfo getReviewInfo(@RequestParam Long commentid) throws Exception {
        return service.getReviewComment(commentid);
    }


    @PostMapping("reviewComment")
    @ExcuteInterfaceDsrc("审核指定评论")
    @ExcutePermission
    public void reviewComment(HttpSession session, @RequestBody ReviewInfo reviewInfo) throws Exception {
        service.review(session, reviewInfo);
    }

    //endregion
}
