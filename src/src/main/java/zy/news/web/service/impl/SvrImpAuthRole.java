package zy.news.web.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zy.news.web.zsys.bean.Page;
import zy.news.web.zsys.bean.ValuesPage;
import zy.news.common.exception.WarningException;
import zy.news.web.bean.SysModule;
import zy.news.web.bean.SysRole;
import zy.news.web.bean.SysUser;
import zy.news.web.mapper.SysRoleMapper;
import zy.news.web.service.IAuthRole;
import zy.news.web.ui.param.RoleModulesBind;
import zy.news.web.ui.param.RolePermsBind;
import zy.news.web.zsys.bean.PageValuesParam;
import zy.news.web.zsys.utils.ServiceUtil;

import java.util.ArrayList;
import java.util.List;

@Service
public class SvrImpAuthRole implements IAuthRole {

    @Autowired
    private SysRoleMapper mapper;


    @Autowired
    private UserCache userCache;


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteByPrimaryKey(Long id) throws WarningException {
        mapper.deleteRoleUsersByRoleId(id);
        mapper.deleteRolePermsByRoleId(id);
        int count = mapper.deleteByPrimaryKey(id);
        return count;
    }

    @Override
    public int insert(SysRole record) throws WarningException {
        if (SysUser.ADMIN_ROLE.equals(record.getRole()) || SysUser.SYSROLE_DESCR.equals(record.getDescr())) {
            throw new WarningException("此角色名或描述已被系统占用，竞争使用，请求改其他名称或描述！");
        }
        long count = mapper.selectRoleByName(record.getRole());
        if (count > 0) {
            throw new WarningException("此角色名称已存在，请修改后再试!");
        }
        return mapper.insert(record);
    }

    @Override
    public SysRole selectByPrimaryKey(Long id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SysRole> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(SysRole record) {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SysModule> specRoleEnableMoudles(Long roleid) {
        return mapper.specRoleEnableMoudles(roleid);
    }

    @Override
    public List<SysModule> specRoleUnEnableRootMoudles(Long roleid) {
        return mapper.specRoleUnEnableRootMoudles(roleid);
    }

    @Override
    public List<SysModule> specRoleUnEnableChildMoudles(Long roleid, Long moduleid) {
        return mapper.specRoleUnEnableChildMoudles(roleid, moduleid);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void bindSpecRoleMoudle(RoleModulesBind modulesBind) throws Exception {
        modulesBind.validate();
        List<Long> moudleids = modulesBind.getMoudleids();
        for (Long mid : moudleids) {
            mapper.bindSpecRoleMoudle(modulesBind.getRoleid(), mid.longValue());
        }
    }

    @Override
    public void unBindSpecRoleMoudle(RoleModulesBind modulesBind) throws Exception {
        modulesBind.validate();
        mapper.unBindSpecRoleMoudle(modulesBind);
    }

    @Override
    public ValuesPage selectAllPage(Page page) throws Exception {
        PageValuesParam pvparam = new PageValuesParam(mapper, "selectAll");
        return ServiceUtil.getValuePage(page, pvparam);
    }

    @Override
    @Deprecated
    public boolean checkRolePermsExist(RolePermsBind bindShip) {
        return mapper.checkRolePermsExist(bindShip) > 1;
    }

    @Override
    @Deprecated
    public void bindRolePerms(RolePermsBind bindShip) throws Exception {
        bindShip.validate();
        if (checkRolePermsExist(bindShip)) {
            throw new WarningException("部分权限[" + bindShip.getpermisdStr() + "]已存在，请检查！");
        }
        mapper.bindRolePerms(bindShip);
        //userCache.invalidate(bindShip.getRoleid());
    }

    @Override
    @Deprecated
    public void unBindRolePerms(RolePermsBind bindShip) {
        mapper.unBindRolePerms(bindShip);
        //userCache.invalidate(bindShip.getRoleid());
    }
}
