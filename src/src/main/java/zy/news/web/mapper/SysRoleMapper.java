package zy.news.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import zy.news.web.bean.SysModule;
import zy.news.web.bean.SysRole;
import zy.news.web.ui.param.RoleModulesBind;
import zy.news.web.ui.param.RolePermsBind;

@Repository
public interface SysRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysRole record);

    SysRole selectByPrimaryKey(Long id);

    List<SysRole> selectAll();

    int updateByPrimaryKey(SysRole record);

    //append

    //region Deprecated

    /**
     * 检查权限是否存在
     *
     * @param bindShip
     * @return
     */
    @Deprecated
    long checkRolePermsExist(@Param("bindShip") RolePermsBind bindShip);

    /**
     * 绑定权限关系
     *
     * @param bindShip
     */
    @Deprecated
    void bindRolePerms(@Param("bindShip") RolePermsBind bindShip);

    /**
     * 解除关系
     *
     * @param bindShip
     */
    @Deprecated
    void unBindRolePerms(@Param("bindShip") RolePermsBind bindShip);
    //endregion Deprecated

    /**
     * 检查roleids 是否在T_SYS_ROLEPERMS表中存在记录
     *
     * @param roleids
     * @return
     */
    @Deprecated
    long countByExampleRolePerms(@Param("roleids") List<Long> roleids);

    /**
     * 删除指定角色关联的权限
     *
     * @param id
     */
    void deleteRolePermsByRoleId(@Param("id") Long id);

    /**
     * 删除指定角色的用户关联
     *
     * @param id
     */
    void deleteRoleUsersByRoleId(@Param("id") Long id);

    /**
     * 检查roleids 是否在 t_sys_roleusers 表中存在记录
     *
     * @param roleids
     * @return
     */
    @Deprecated
    long countRoleUsers(@Param("roleids") List<Long> roleids);

    /**
     * 获取指定角色已绑定的模块列表
     *
     * @return
     */
    List<SysModule> specRoleEnableMoudles(@Param("roleid") Long roleid);

    /**
     * 获取指定角色指定模块未拥有的模块列表
     *
     * @param roleid
     * @return
     */
    List<SysModule> specRoleUnEnableRootMoudles(@Param("roleid") Long roleid);

    /**
     * 获取指定角色指定模块未拥有的模块列表
     *
     * @param roleid
     * @param moduleid
     * @return
     */
    List<SysModule> specRoleUnEnableChildMoudles(@Param("roleid") Long roleid, @Param("moduleid") Long moduleid);

    /**
     * 删除指定角色所有权限
     *
     * @param roleid
     */
    void delSpecRoleMoudle(@Param("roleid") long roleid);

    /**
     * 绑定指定角色的模块
     *
     * @return
     */
    void bindSpecRoleMoudle(@Param("roleid") long roleid, @Param("mid") long mid);

    /**
     * 解除指定角色绑定的模块
     *
     * @return
     */
    void unBindSpecRoleMoudle(@Param("modulesBind") RoleModulesBind modulesBind);

    /**
     * 通过名称获取角色
     *
     * @param roleNam
     * @return
     */
    long selectRoleByName(@Param("role") String roleNam);

    /**
     * 检查用户具有角色个数
     *
     * @param userid
     * @return
     */
    int selectUserRoleCount(long userid);

    /**
     * 获取用户角色列表
     *
     * @param userid
     * @return
     */
    List<SysRole> selectUserRoles(long userid);
}