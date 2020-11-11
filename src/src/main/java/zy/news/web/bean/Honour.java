package zy.news.web.bean;

import lombok.Data;
import maoko.common.StringUtil;
import zy.news.web.zsys.bean.IValidate;

import java.io.Serializable;
import java.util.Date;

@Data
public class Honour extends ContentBase implements IValidate {
    private final static int HONORTITLE_LEN = 200;
    private Long id;
    private Long imageid;//可为空
    private String pepole;
    private String honortitle;
    private String author;
    private Date publishdate;
    private Long pageview;

    //append
    private String imageUrl;
    private String front;
    private String next;

    @Override
    public void validate() throws Exception {
        if (StringUtil.isStrNullOrWhiteSpace(pepole)) {
            throw new Exception("pepole字段为空！");
        }
        if (StringUtil.isStrNullOrWhiteSpace(honortitle)) {
            throw new Exception("honortitle字段为空！");
        }
        if (honortitle.length() > HONORTITLE_LEN) {
            throw new Exception("honortitle文字个数过长，限定200个汉字和标点！");
        }
        super.validate();
    }
}