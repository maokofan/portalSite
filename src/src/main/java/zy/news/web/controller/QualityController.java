package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.Quality;
import zy.news.web.service.IQuality;
import zy.news.web.zsys.bean.*;

import javax.servlet.http.HttpSession;

/**
 * @author maoko
 * @date 2020/3/7 14:30
 */
@RestController
@RequestMapping("/quality")
@ExcuteControllerDsrc("质量专栏")
public class QualityController {

    private final IQuality qualityService;

    @Autowired
    public QualityController(IQuality qualityService) {
        this.qualityService = qualityService;
    }

    @GetMapping("existTitle")
    @ExcuteInterfaceDsrc("标题是否重复")
    @ExcutePermission
    public boolean existTitle(@RequestParam String title, @RequestParam Long id) throws Exception {
        Quality record = new Quality();
        record.setTitle(title);
        record.setId(id);
        return qualityService.exist(record, null);
    }

    @PostMapping("addQuality")
    @ExcuteInterfaceDsrc("添加")
    @ExcutePermission
    public void addQuality(HttpSession session, @RequestBody Quality record) throws Exception {
        qualityService.add(session, record);
    }

    @PostMapping("updateQuality")
    @ExcuteInterfaceDsrc("更新")
    @ExcutePermission
    public void updateQuality(HttpSession session, @RequestBody Quality record) throws Exception {
        qualityService.update(session, record);
    }

    @PostMapping("deleteQuality")
    @ExcuteInterfaceDsrc("删除")
    @ExcutePermission
    public void deleteQuality(HttpSession session, @RequestBody Quality record) throws Exception {
        qualityService.delete(session, record);
    }


    @PostMapping("getQualitys")
    @ExcuteInterfaceDsrc("获取质量文章列表")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public PageValuesResult<Quality> getQualitys(@RequestBody Page page) throws Exception {
        return qualityService.getQualitys(page);
    }

    @GetMapping("getQualityDetail")
    @ExcuteInterfaceDsrc("获取详情")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public Quality getQualityDetail(@RequestParam Long articleid) throws Exception {
        return qualityService.getRecordDetail(articleid);
    }
}
