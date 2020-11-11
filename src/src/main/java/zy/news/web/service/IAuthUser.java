package zy.news.web.service;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import zy.news.common.exception.WarningException;
import zy.news.web.bean.SysRole;
import zy.news.web.bean.SysUser;
import zy.news.web.ui.param.RoleUserBind;
import zy.news.web.ui.param.SafePass;
import zy.news.web.zsys.bean.Page;
import zy.news.web.zsys.bean.PageValuesResult;
import zy.news.web.zsys.bean.ValuesPage;

import java.util.List;

/**
 * 用户管理接口
 *
 * @author fanpei
 */
public interface IAuthUser extends IBaseCruid<SysUser> {

    /**
     * 根据用户的身份和密码进行登录认证，如果认证通过，返回用户身份信息
     *
     * @param usr
     * @return
     * @throws Exception
     */
    SysUser login(SysUser usr) throws Exception;

    /**
     * 校验用户密码是否正确
     *
     * @return
     */
    SysUser selectUserByNamPasswd(SysUser user) throws WarningException;

    /**
     * 绑定角色
     *
     * @param username
     * @param roleid
     */
    @Deprecated
    void bindUserRole(String username, Long roleid) throws WarningException;

    /**
     * 修改密码
     *
     * @param user
     */
    void updatePasswd(SysUser user) throws WarningException;

    /**
     * 获取指定用户已绑定角色列表
     *
     * @param userid
     * @return
     * @throws Exception
     */
    List<SysRole> specUserEnableRoles(@RequestParam Long userid) throws Exception;

    /**
     * 获取指定用户未绑定角色列表
     *
     * @param userid
     * @return
     * @throws Exception
     */
    List<SysRole> specUserUnEnableRoles(@RequestParam Long userid) throws Exception;

    /**
     * 绑定用户角色
     *
     * @param userBind
     * @throws Exception
     */
    void bindSpecUserRole(@RequestBody RoleUserBind userBind) throws Exception;

    /**
     * 解除用户角色绑定
     *
     * @param userBind
     * @throws Exception
     */
    void unBindSpecUserRole(@RequestBody RoleUserBind userBind) throws Exception;

    /**
     * 用户搜索
     *
     * @param page
     * @param fastSearch
     * @return
     * @throws Exception
     */
    PageValuesResult<SysUser> selectAllPage(Page page, String fastSearch) throws Exception;
}
