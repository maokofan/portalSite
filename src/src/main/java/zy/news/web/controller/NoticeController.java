package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.bean.NewsSimple;
import zy.news.web.ui.param.PageReview;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.Notice;
import zy.news.web.bean.NoticeSimple;
import zy.news.web.service.INotice;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.ui.result.ReviewInfo;
import zy.news.web.zsys.bean.*;

import javax.servlet.http.HttpSession;

/**
 * 通告管理
 *
 * @author maoko
 * @date 2020/3/2 10:56
 */
@RestController
@RequestMapping("/notice")
@ExcuteControllerDsrc("通告管理")
public class NoticeController {
    private final INotice noticeService;

    @Autowired
    public NoticeController(INotice noticeService) {
        this.noticeService = noticeService;
    }


    //region 通告发布

    @GetMapping("existTitle")
    @ExcuteInterfaceDsrc("标题是否重复")
    @ExcutePermission
    public boolean existTitle(@RequestParam String title, @RequestParam Long id) throws Exception {
        Notice notice = new Notice();
        notice.setTitle(title);
        notice.setId(id);
        return noticeService.exist(notice,null);
    }

    @PostMapping("addNotice")
    @ExcuteInterfaceDsrc("添加通告")
    @ExcutePermission
    public void addNotice(HttpSession session, @RequestBody Notice notice) throws Exception {
        noticeService.add(session, notice);
    }

    @PostMapping("updateNotice")
    @ExcuteInterfaceDsrc("更新通告")
    @ExcutePermission
    public void updateNotice(HttpSession session, @RequestBody Notice notice) throws Exception {
        noticeService.update(session, notice);
    }

    @GetMapping("getReviewInfo")
    @ExcuteInterfaceDsrc("获取审核详情")
    @ExcutePermission
    public ReviewInfo getReviewInfo(HttpSession session, @RequestParam Long noticeid) throws Exception {
        return noticeService.getReviewComment(noticeid);
    }

    @PostMapping("deleteNotice")
    @ExcuteInterfaceDsrc("删除通告")
    @ExcutePermission
    public void deleteNotice(HttpSession session, @RequestBody Notice notice) throws Exception {
        noticeService.delete(session, notice);
    }

    @PostMapping("getNotices")
    @ExcuteInterfaceDsrc("获取通告列表")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public PageValuesResult<NoticeSimple> getPublishNotice(@RequestBody Page page) throws Exception {
        PageReview pageReview = new PageReview();
        pageReview.setCurrent(page.getCurrent());
        pageReview.setPageSize(page.getSize());
        pageReview.setStatus(ReviewStatus.已通过.getValue());
        return noticeService.getNotice(pageReview);
    }

    @GetMapping("getNoticeDetail")
    @ExcuteInterfaceDsrc("获取通告详情")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public Notice getNoticeDetail(@RequestParam Long noticeid) throws Exception {
        return noticeService.getRecordDetail(noticeid);
    }


    //endregion

    //region 通告审核
    @PostMapping("getReviewRecords")
    @ExcuteInterfaceDsrc("获取已发布文章列表")
    @ExcutePermission
    public PageValuesResult<NoticeSimple> getReviewRecords(@RequestBody PageReview param) throws Exception {
        return noticeService.getNotice(param);
    }

    @PostMapping("reviewNotice")
    @ExcuteInterfaceDsrc("审核指定通告")
    @ExcutePermission
    public void reviewNotice(HttpSession session, @RequestBody ReviewInfo reviewInfo) throws Exception {
        noticeService.review(session, reviewInfo);
    }

    //endregion
}
