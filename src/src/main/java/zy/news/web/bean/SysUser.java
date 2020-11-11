package zy.news.web.bean;

import lombok.Data;
import maoko.common.StringUtil;
import maoko.common.agorithm.AesCipher;
import sun.misc.BASE64Encoder;
import zy.news.common.exception.WarningException;
import zy.news.web.zsys.bean.IValidate;
import zy.news.web.zsys.gson.MyExpose;

import java.util.List;

@Data
public class SysUser implements IValidate {
    public static final String ADMIN_ROLE = "admin";//mapper.xml文件中使用 与数据库统一
    public static final String ADMIN_NAME = "admin";//mapper.xml文件中使用 与数据库统一
    public static final String SYSROLE_DESCR = "超级管理员";

    public static final String SESSION_USER = "LOGINNAME";
    @Deprecated
    public static final String SESSION_USERMODEL = "LOGINUSER";
    public static final String SESSION_TOKEN = "LOGINTOKEN";

    private Long id;//id
    private String username;//登录名
    private String realname;
    @MyExpose(serialize = false)
    private String passwd;
    private List<SysRole> roleList;
    private String token;//登录验证码


    @Override
    public void validate() throws Exception {
        if (StringUtil.isStrNullOrWhiteSpace(username) || StringUtil.isStrNullOrWhiteSpace(passwd)) {
            throw new WarningException("用户名和密码不能为空！");
        }
    }

    public String getAesPassWd() {
        return AesCipher.Encrypt(passwd);
    }
}