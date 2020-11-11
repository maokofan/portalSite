package zy.news.web.service.impl;

import maoko.common.agorithm.AesCipher;
import maoko.common.file.FileIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zy.news.common.db.base.DbExampleUtil;
import zy.news.web.ui.param.SafePass;
import zy.news.web.zsys.bean.Page;
import zy.news.web.zsys.bean.PageValuesResult;
import zy.news.web.zsys.bean.ValuesPage;
import zy.news.common.exception.LoginitException;
import zy.news.common.exception.WarningException;
import zy.news.web.bean.SysRole;
import zy.news.web.bean.SysUser;
import zy.news.web.mapper.SysRoleMapper;
import zy.news.web.mapper.SysUserMapper;
import zy.news.web.service.IAuthUser;
import zy.news.web.ui.param.RoleUserBind;
import zy.news.web.zsys.bean.PageValuesParam;
import zy.news.web.service.IUserCache;
import zy.news.web.zsys.utils.ServiceUtil;

import java.util.List;

/**
 * @author fanpei
 */
@Service
public class SvrImpAuthUser implements IAuthUser {

    private final SysUserMapper mapper;
    private final SysRoleMapper roleMapper;
    private final IUserCache userCache;

    @Autowired
    public SvrImpAuthUser(SysUserMapper mapper, SysRoleMapper roleMapper, IUserCache userCache) {
        this.mapper = mapper;
        this.roleMapper = roleMapper;
        this.userCache = userCache;
    }


    @Override
    public int deleteByPrimaryKey(Long id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysUser record) throws WarningException {
        if (SysUser.ADMIN_ROLE.equals(record.getUsername())) {
            throw new WarningException("禁止操作管理员账户");
        }
        if (mapper.selectByName(record.getUsername()) != null) {
            throw new WarningException("此用户名已存在！");
        }
        int result = mapper.insert(record);
        return result;
    }

    @Override
    public SysUser selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SysUser> selectAll() {
        return mapper.selectAll("");
    }

    @Override
    public int updateByPrimaryKey(SysUser record) throws WarningException {
        if (SysUser.ADMIN_ROLE.equals(record.getUsername())) {
            throw new WarningException("禁止操作管理员账户");
        }
        if (null == record.getId()) {
            throw new WarningException("用户id为空，请重新填写参数！");
        }
        SysUser oldUser = selectByPrimaryKey(record.getId());
        if (oldUser == null) {
            throw new WarningException("用户已不存在！");
        }
        if (!oldUser.getUsername().equals(record.getUsername())) {
            if (mapper.selectByName(record.getUsername()) != null) {
                throw new WarningException("此用户名已存在！");
            }
        }
        return mapper.updateByPrimaryKey(record);
    }


    @Override
    public SysUser login(SysUser usr) throws Exception {
        usr.validate();
        if (null != (usr = selectUserByNamPasswd(usr))) {
            if (!SysUser.ADMIN_NAME.equals(usr.getUsername()) && roleMapper.selectUserRoleCount(usr.getId()) == 0) {
                throw new LoginitException("用户还未分配角色无法登录，请联系管理员！");
            }
        } else {
            throw new LoginitException("用户名或密码错误！");
        }
        usr.setToken(FileIDUtil.getNextId());
        // 加载模块
        userCache.updateUserTimeOut(usr);
        if (!SysUser.ADMIN_NAME.equals(usr.getUsername())) {
            usr.setRoleList(roleMapper.selectUserRoles(usr.getId()));
        }
        return usr;
    }

    @Override
    public SysUser selectUserByNamPasswd(SysUser user) throws WarningException {
        return mapper.selectByNamePasswd(user.getUsername(), user.getAesPassWd());
    }

    @Override
    public void updatePasswd(SysUser user) throws WarningException {
      /*  if (SysUser.ADMIN_ROLE.equals(user.getUsername())) {
            throw new WarningException("禁止操作管理员账户");
        }*/
        mapper.updatePasswd(user.getAesPassWd(), user.getId());
    }

    @Override
    public void bindUserRole(String username, Long roleid) throws WarningException {
        if (SysUser.ADMIN_ROLE.equals(username)) {
            throw new WarningException("禁止操作管理员账户");
        }
        mapper.bindUserRole(username, roleid);
    }

    @Override
    public ValuesPage selectAllPage(Page page) throws Exception {
        PageValuesParam pvparam = new PageValuesParam(mapper, "selectAll");
        pvparam.addParam(null);
        return ServiceUtil.getValuePage(page, pvparam);
    }

    @Override
    public List<SysRole> specUserEnableRoles(Long userid) throws Exception {
        return mapper.specUserEnableRoles(userid);
    }

    @Override
    public List<SysRole> specUserUnEnableRoles(Long userid) throws Exception {
        return mapper.specUserUnEnableRoles(userid);
    }

    @Override
    public void bindSpecUserRole(RoleUserBind userBind) throws Exception {
        userBind.validate();
        mapper.bindSpecUserRole(userBind);
    }

    @Override
    public void unBindSpecUserRole(RoleUserBind userBind) throws Exception {
        userBind.validate();
        mapper.unBindSpecUserRole(userBind);
    }

    @Override
    public PageValuesResult<SysUser> selectAllPage(Page page, String fastSearch) throws Exception {
        PageValuesParam pvparam = new PageValuesParam(mapper, "selectAll");
        pvparam.addParam(DbExampleUtil.getLikeValue(fastSearch));
        return ServiceUtil.getValuePageResult(page, pvparam);
    }
}
