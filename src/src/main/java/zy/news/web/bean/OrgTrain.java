package zy.news.web.bean;

import com.google.gson.annotations.Expose;
import lombok.Data;
import maoko.common.StringUtil;
import zy.news.web.zsys.bean.IValidate;

import java.util.Date;
import java.util.List;

/**
 * @author maoko
 */
@Data
public class OrgTrain extends ContentBase implements IValidate {
    private Long id;
    private String author;
    private Date publishdate;
    private Long pageview;
    //append
    private String front;
    private String next;

    @Override
    public void validate() throws Exception {
        super.validate();
    }
}