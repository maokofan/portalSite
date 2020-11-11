package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.ui.param.PageIdParam;
import zy.news.web.ui.param.PageReview;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.News;
import zy.news.web.bean.NewsSimple;
import zy.news.web.service.INews;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.ui.result.ReviewInfo;
import zy.news.web.zsys.bean.*;

import javax.servlet.http.HttpSession;

/**
 * 新闻管理
 *
 * @author maoko
 * @date 2020/2/18 23:14
 */
@RestController
@RequestMapping("/news")
@ExcuteControllerDsrc("新闻管理")
public class NewsController {

    private final INews newsService;

    @Autowired
    public NewsController(INews newsService) {
        this.newsService = newsService;
    }

    //region 新闻发布

    @GetMapping("existTitle")
    @ExcuteInterfaceDsrc("标题是否重复")
    @ExcutePermission
    public boolean existTitle(@RequestParam String title, @RequestParam Long id) throws Exception {
        News news = new News();
        news.setTitle(title);
        news.setId(id);
        return newsService.exist(news, null);
    }

    @PostMapping("addNews")
    @ExcuteInterfaceDsrc("添加新闻")
    @ExcutePermission
    public void addNews(HttpSession session, @RequestBody News news) throws Exception {
        newsService.add(session, news);
    }

    @PostMapping("updateNews")
    @ExcuteInterfaceDsrc("更新新闻")
    @ExcutePermission
    public void updateNews(HttpSession session, @RequestBody News news) throws Exception {
        newsService.update(session, news);
    }

    @GetMapping("getReviewInfo")
    @ExcuteInterfaceDsrc("获取审核详情")
    @ExcutePermission
    public ReviewInfo getReviewInfo(HttpSession session, @RequestParam Long newsid) throws Exception {
        return newsService.getReviewComment(newsid);
    }

    @PostMapping("deleteNews")
    @ExcuteInterfaceDsrc("删除新闻")
    @ExcutePermission
    public void deleteNews(HttpSession session, @RequestBody News news) throws Exception {
        newsService.delete(session, news);
    }

    @GetMapping("getNewsDetail")
    @ExcuteInterfaceDsrc("获取新闻详情")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public News getNewsDetail(@RequestParam Long newsid) throws Exception {
        return newsService.getRecordDetail(newsid);
    }


    //endregion

    //region 新闻审核

    @PostMapping("getNews")
    @ExcuteInterfaceDsrc("获取已审核新闻列表")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public PageValuesResult<NewsSimple> getNews(@RequestBody Page page) throws Exception {
        PageReview pageReview = new PageReview();
        pageReview.setCurrent(page.getCurrent());
        pageReview.setPageSize(page.getSize());
        pageReview.setStatus(ReviewStatus.已通过.getValue());
        return newsService.getNews(pageReview);
    }

    @PostMapping("getReviewRecords")
    @ExcuteInterfaceDsrc("获取已发布新闻列表")
    @ExcutePermission
    public PageValuesResult<NewsSimple> getReviewRecords(@RequestBody PageReview param) throws Exception {
        return newsService.getNews(param);
    }

    @PostMapping("reviewNews")
    @ExcuteInterfaceDsrc("审核指定新闻")
    @ExcutePermission
    public void reviewNews(HttpSession session, @RequestBody ReviewInfo reviewInfo) throws Exception {
        newsService.review(session, reviewInfo);
    }

    //endregion
}

