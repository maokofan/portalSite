package zy.news.web.bean;

import lombok.Data;
import maoko.common.StringUtil;
import zy.news.web.zsys.bean.IValidate;

import java.util.Date;

@Data
public class Regulations extends ContentBase implements IValidate {
    private Long id;
    private String author;
    private Date publishdate;
    private Integer dptid;
    private Long pageview;

    //APPEND

    private String dptname;
    private String front;
    private String next;

    @Override
    public void validate() throws Exception {
        if (null == dptid) {
            throw new Exception("deptid为空！");
        }
        super.validate();
    }
}