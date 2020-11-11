package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.Honour;
import zy.news.web.service.IHonour;
import zy.news.web.zsys.bean.*;

import javax.servlet.http.HttpSession;

/**
 * @author maoko
 * @date 2020/3/7 17:51
 */
@RestController
@RequestMapping("/honour")
@ExcuteControllerDsrc("荣誉中亚")
public class HonourController {

    private final IHonour honourService;

    @Autowired
    public HonourController(IHonour regulationsService) {
        this.honourService = regulationsService;
    }

    @GetMapping("existTitle")
    @ExcuteInterfaceDsrc("标题是否重复")
    @ExcutePermission
    public boolean existTitle(@RequestParam String title, @RequestParam Long id) throws Exception {
        Honour record = new Honour();
        record.setTitle(title);
        record.setId(id);
        return honourService.exist(record,null);
    }

    @PostMapping("addHonour")
    @ExcuteInterfaceDsrc("添加")
    @ExcutePermission
    public void addHonour(HttpSession session, @RequestBody Honour record) throws Exception {
        honourService.add(session, record);
    }

    @PostMapping("updateHonour")
    @ExcuteInterfaceDsrc("更新")
    @ExcutePermission
    public void updateHonour(HttpSession session, @RequestBody Honour record) throws Exception {
        honourService.update(session, record);
    }

    @PostMapping("deleteHonour")
    @ExcuteInterfaceDsrc("删除")
    @ExcutePermission
    public void deleteHonour(HttpSession session, @RequestBody Honour record) throws Exception {
        honourService.delete(session, record);
    }


    @PostMapping("getHonours")
    @ExcuteInterfaceDsrc("获取文章列表")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public PageValuesResult<Honour> getHonours(@RequestBody Page page) throws Exception {
        return honourService.getHonours(page);
    }

    @GetMapping("getHonourDetail")
    @ExcuteInterfaceDsrc("获取详情")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public Honour getHonourDetail(@RequestParam Long articleid) throws Exception {
        return honourService.getRecordDetail(articleid);
    }
}
