/**
 *
 */
package zy.news.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import zy.news.web.ui.param.SafePass;
import zy.news.web.zsys.bean.*;
import zy.news.common.exception.LoginTimeOutException;
import zy.news.common.exception.WarningException;
import zy.news.web.bean.SysRole;
import zy.news.web.bean.SysUser;
import zy.news.web.service.IAuthUser;
import zy.news.web.ui.param.RoleUserBind;
import zy.news.web.service.IUserCache;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户验证控制器
 *
 * @author fanpei
 *
 */
@RestController
@RequestMapping("back/user")
@ExcuteControllerDsrc("用户管理")
public class SysUserController {

    @Autowired
    private IAuthUser service;

    @Autowired
    private IUserCache userCache;


    @PutMapping("add")
    @ExcuteInterfaceDsrc("添加记录")
    @ExcutePermission
    public void add(HttpSession session, @RequestBody SysUser record) throws Exception {
        record.validate();
        record.setPasswd(record.getAesPassWd());
        service.insert(record);
    }


    @ExcuteInterfaceDsrc("更新记录")
    @PostMapping("update")
    @ExcutePermission
    public void update(HttpSession session, @RequestBody SysUser record) throws Exception {
        service.updateByPrimaryKey(record);
    }


    @GetMapping("lists")
    @ExcuteInterfaceDsrc("获取列表")
    @ExcutePermission
    public ValuesPage getRecords(int current, int pageSize) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        return service.selectAllPage(page);
    }

    @GetMapping("listsSearch")
    @ExcuteInterfaceDsrc("获取列表")
    @ExcutePermission
    public PageValuesResult<SysUser> listsSearch(int current, int pageSize, String fastSearch) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        return service.selectAllPage(page, fastSearch);
    }

    /**
     * 用户登录
     *
     * @param session
     * @throws Exception
     */
    @PostMapping(value = "signin")
    @ExcuteInterfaceDsrc(value = "用户登录")
    @ExcutePermission
    public SysUser login(HttpSession session, @RequestBody SysUser luser) throws Exception {
        SysUser user = service.login(luser);
        session.setAttribute(SysUser.SESSION_USER, luser.getUsername());
        return user;
    }

    /**
     * 用户退出
     *
     * @param session
     * @return
     * @throws Exception
     */
    @ExcuteInterfaceDsrc(value = "用户退出")
    @GetMapping(value = "logout")
    @ExcutePermission
    public void logout(HttpSession session) {
        try {
            SysUser luser = userCache.getUserFromSession(session);
            userCache.remove(luser.getUsername());
        } catch (Exception e) {
        } finally {
            session.invalidate();
        }
    }

    @ExcuteInterfaceDsrc(value = "用户校验")
    @PostMapping(value = "validate")
    @ExcutePermission
    public boolean validate(HttpSession session, @RequestBody SafePass passwd) throws LoginTimeOutException, WarningException {
        SysUser luser = userCache.getUserFromSession(session);
        if (SysUser.ADMIN_ROLE.equals(luser.getUsername())) {
            throw new WarningException("禁止操作管理员账户");
        }
        luser.setPasswd(passwd.getPasswd());
        return service.selectUserByNamPasswd(luser) != null;
    }


    @ExcuteInterfaceDsrc(value = "密码修改")
    @PostMapping(value = "updatePasswd")
    @ExcutePermission
    public void updatePasswd(HttpSession session, @RequestBody SafePass passwd) throws LoginTimeOutException, WarningException {
        SysUser luser = userCache.getUserFromSession(session);
        luser.setPasswd(passwd.getPasswd());
        service.updatePasswd(luser);
    }

    @ExcuteInterfaceDsrc(value = "密码重置")
    @PostMapping(value = "resetPass")
    @ExcutePermission
    public void resetPass(@RequestBody SafePass passwd) throws LoginTimeOutException, WarningException {
        SysUser luser = new SysUser();
        luser.setId(passwd.getId());
        luser.setPasswd(passwd.getPasswd());
        service.updatePasswd(luser);
    }

    @GetMapping("specUserRoles")
    @ExcuteInterfaceDsrc("获取指定用户已绑定的角色列表")
    @ExcutePermission
    public List<SysRole> specUserRoles(@RequestParam Long userid) throws Exception {
        return service.specUserEnableRoles(userid);
    }

    @GetMapping("specUserUnEnableRoles")
    @ExcuteInterfaceDsrc("获取指定用户已绑定的角色列表")
    @ExcutePermission
    public List<SysRole> specUserUnEnableRoles(@RequestParam Long userid) throws Exception {
        return service.specUserUnEnableRoles(userid);
    }

    @PostMapping("bindSpecUserRole")
    @ExcuteInterfaceDsrc("给指定用户绑定角色")
    @ExcutePermission
    public void bindSpecUserRole(@RequestBody RoleUserBind userBind) throws Exception {
        service.bindSpecUserRole(userBind);
    }

    @PostMapping("unBindSpecUserRole")
    @ExcuteInterfaceDsrc("给指定用户解除绑定角色")
    @ExcutePermission
    public void unBindSpecUserRole(@RequestBody RoleUserBind userBind) throws Exception {
        service.unBindSpecUserRole(userBind);
    }
}
