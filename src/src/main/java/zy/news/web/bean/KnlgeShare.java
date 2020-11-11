package zy.news.web.bean;

import lombok.Data;
import maoko.common.StringUtil;
import maoko.common.exception.OutOfRangeException;
import zy.news.common.exception.WarningException;
import zy.news.web.ui.param.ArticleType;
import zy.news.web.ui.param.ReviewStatus;
import zy.news.web.zsys.bean.IValidate;

import java.util.Date;

@Data
public class KnlgeShare extends ContentBase implements IValidate {
    private Long id;
    private String author;
    private Date publishdate;
    private Byte reviewstatus;
    private String reviewer;
    private Date reviewdate;
    private String reviewcomment;
    private Integer goodnum;
    private Integer badnum;
    private Long pageview;


    //辅助变量 非数据库变量

    private Byte articletype = ArticleType.知识分享.getValue();
    private String reviewstatusStr;
    private Integer cmtCount;//评论个数
    private String front;
    private String next;

    public void setReviewstatus(Byte reviewstatus) throws OutOfRangeException {
        this.reviewstatus = reviewstatus;
        this.reviewstatusStr = ReviewStatus.getInstance(reviewstatus.byteValue()).toString();
    }

    @Override
    public void validate() throws Exception {
        boolean annexEmpty = annexes == null || annexes.isEmpty();
        boolean stringNull = StringUtil.isStrNullOrWhiteSpace(content);
        if (annexEmpty && stringNull) {
            throw new Exception("附件列表或者内容content字段不能都为空！");
        }
        if (StringUtil.isStrNullOrWhiteSpace(title)) {
            throw new Exception("新闻标题title字段为空！");
        } else if (title.length() > TITLE_MAX_LEN) {
            throw new WarningException("标题长度过长，长度限制为85个汉字或字符！");
        }
        if (!StringUtil.isStrNullOrWhiteSpace(content) && content.length() > CONTENT_MAX_LEN) {
            throw new WarningException("内容长度过长，请精简文字后再试！");
        }
    }
}