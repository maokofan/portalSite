package zy.news.web.bean;

import lombok.Data;
import maoko.common.exception.OutOfRangeException;
import zy.news.web.ui.param.ReviewStatus;

import java.util.Date;

/**
 * @author maoko
 * @date 2020/3/5 13:53
 */
@Data
public class CommentSimple {
    private Long id;
    private Long articleid;
    private String articleTitle;
    private Byte articletype;
    private String content;
    private String author;
    private String ip;
    private Date publishdate;
    private String reviewcomment;
    private Byte reviewstatus;

    //辅助变量 非数据库变量
    private String reviewstatusStr;
    private Long seqnum;

    public void setReviewstatus(Byte reviewstatus) throws OutOfRangeException {
        this.reviewstatus = reviewstatus;
        this.reviewstatusStr = ReviewStatus.getInstance(reviewstatus.byteValue()).toString();
    }
}
