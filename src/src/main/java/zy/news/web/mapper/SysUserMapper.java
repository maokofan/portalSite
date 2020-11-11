package zy.news.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import zy.news.web.bean.SysRole;
import zy.news.web.bean.SysUser;
import zy.news.web.ui.param.RoleUserBind;

@Repository
public interface SysUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysUser record);

    SysUser selectByPrimaryKey(Long id);

    List<SysUser> selectAll(@Param("fastSearch") String  fastSearch);

    int updateByPrimaryKey(SysUser record);

    /**
     * 绑定角色
     *
     * @param username
     * @param roleid
     */
    @Deprecated
    void bindUserRole(@Param("username") String username, @Param("roleid") Long roleid);

    /**
     * 更新密码
     *
     * @param passwd
     * @param id
     */
    void updatePasswd(@Param("passwd") String passwd, @Param("id") Long id);

    /**
     * 通过用户名和密码获取用户
     *
     * @param name
     * @param passwd
     * @return
     */
    SysUser selectByNamePasswd(@Param("name") String name, @Param("passwd") String passwd);

    /**
     * 通过用户名获取用户
     *
     * @param name
     * @return
     */
    SysUser selectByName(@Param("name") String name);

    /**
     * 获取指定用户已绑定角色列表
     *
     * @param userid
     * @return
     * @throws Exception
     */
    List<SysRole> specUserEnableRoles(Long userid);

    /**
     * 获取指定用户未绑定角色列表
     *
     * @param userid
     * @return
     * @throws Exception
     */
    List<SysRole> specUserUnEnableRoles(Long userid);

    /**
     * 绑定用户角色
     *
     * @param userBind
     * @throws Exception
     */
    void bindSpecUserRole(@Param("userBind") RoleUserBind userBind);

    /**
     * 解除用户角色绑定
     *
     * @param userBind
     * @throws Exception
     */
    void unBindSpecUserRole(@Param("userBind")RoleUserBind userBind);

}