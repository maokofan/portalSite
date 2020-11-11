package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.zsys.bean.Page;
import zy.news.web.bean.OrgTrain;
import zy.news.web.service.IOrgTrain;
import zy.news.web.zsys.bean.*;

import javax.servlet.http.HttpSession;

/**
 * 培训管理
 * 1：培训动态：类似于新闻类一些信息
 * 2：培训资料：一些培训文档，资料
 *
 * @author maoko
 * @date 2020/3/6 13:20
 */
@RestController
@RequestMapping("/train")
@ExcuteControllerDsrc("培训管理")
public class TrainController {
    private final IOrgTrain trainService;

    @Autowired
    public TrainController(IOrgTrain trainService) {
        this.trainService = trainService;
    }

    @GetMapping("existTitle")
    @ExcuteInterfaceDsrc("标题是否重复")
    @ExcutePermission
    public boolean existTitle(@RequestParam String title, @RequestParam Long id) throws Exception {
        OrgTrain record = new OrgTrain();
        record.setTitle(title);
        record.setId(id);
        return trainService.exist(record, null);
    }

    @PostMapping("addOrgTrain")
    @ExcuteInterfaceDsrc("添加")
    @ExcutePermission
    public void addOrgTrain(HttpSession session, @RequestBody OrgTrain record) throws Exception {
        trainService.add(session, record);
    }

    @PostMapping("updateOrgTrain")
    @ExcuteInterfaceDsrc("更新")
    @ExcutePermission
    public void updateOrgTrain(HttpSession session, @RequestBody OrgTrain record) throws Exception {
        trainService.update(session, record);
    }

    @PostMapping("deleteOrgTrain")
    @ExcuteInterfaceDsrc("删除")
    @ExcutePermission
    public void deleteOrgTrain(HttpSession session, @RequestBody OrgTrain record) throws Exception {
        trainService.delete(session, record);
    }


    @PostMapping("getOrgTrains")
    @ExcuteInterfaceDsrc("获取培训动态列表")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public PageValuesResult<OrgTrain> getOrgTrains(@RequestBody Page page) throws Exception {
        return trainService.getOrgTains(page);
    }

    @GetMapping("getOrgTrainDetail")
    @ExcuteInterfaceDsrc("获取详情")
    @ExcutePermission(userType = ExcuteUserType.游客)
    public OrgTrain getOrgTrainDetail(@RequestParam Long articleid) throws Exception {
        return trainService.getRecordDetail(articleid);
    }
}
