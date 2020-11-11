package zy.news.web.bean;

import lombok.Data;
import maoko.common.StringUtil;
import zy.news.web.zsys.bean.IValidate;

import java.util.Date;

@Data
public class Quality extends ContentBase implements IValidate {
    private Long id;
    private Byte type;
    private String author;
    private Date publishdate;
    private Long pageview;

    //APPEND

    private String typeStr;
    private String front;
    private String next;

    public void setType(Byte type) {
        this.type = type;
        switch (type.intValue()) {
            case 0:
                this.typeStr = "质量月报";
                break;
            case 1:
                this.typeStr = "警示案例";
                break;
            case 2:
                this.typeStr = "其他";
                break;
            default:
                break;
        }
    }

    @Override
    public void validate() throws Exception {
        if (null == type) {
            throw new Exception("type为空！");
        }
        if (type < 0 || type > 2) {
            throw new Exception("type值超出范围[0,2]");
        }
        super.validate();
    }
}