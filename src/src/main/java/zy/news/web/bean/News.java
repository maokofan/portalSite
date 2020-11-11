package zy.news.web.bean;

import com.google.gson.annotations.Expose;
import lombok.Data;
import maoko.common.StringUtil;
import maoko.common.exception.OutOfRangeException;
import zy.news.common.exception.WarningException;
import zy.news.web.ui.param.ArticleType;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.zsys.bean.IValidate;
import zy.news.web.zsys.utils.HtmlUtils;

import java.util.Date;

@Data
public class News extends ContentBase implements IValidate {

    private Long id;
    private Long imageid;
    private Long ntid;
    private String author;
    private Date publishdate;
    private Byte reviewstatus;
    private String reviewer;
    private Date reviewdate;
    private String reviewcomment;
    private Long pageview;


    //辅助变量 非数据库变量

    private Byte articletype = ArticleType.新闻.getValue();
    private String newsTName;//新闻类型名称
    private String imageUrl;//图片地址
    private String reviewstatusStr;
    private String front;
    private String next;


    public void setReviewstatus(Byte reviewstatus) throws OutOfRangeException {
        this.reviewstatus = reviewstatus;
        this.reviewstatusStr = ReviewStatus.getInstance(reviewstatus.byteValue()).toString();
    }

    @Override
    public void validate() throws Exception {
        if (ntid == null) {
            throw new Exception("新闻类型ntid字段为空！");
        }
        super.validate();
    }
}