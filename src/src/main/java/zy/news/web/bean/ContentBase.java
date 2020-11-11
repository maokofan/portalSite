package zy.news.web.bean;

import com.google.gson.annotations.Expose;
import lombok.Data;
import maoko.common.StringUtil;
import maoko.common.ZipUtils;
import zy.news.common.exception.WarningException;
import zy.news.web.zsys.bean.IValidate;
import zy.news.web.zsys.utils.HtmlUtils;

import java.util.List;

/**
 * @author maoko
 * @date 2020/3/7 13:30
 */
@Data
public class ContentBase implements IValidate {
    public static final int TITLE_MAX_LEN = 85;
    public static final int CONTENT_MAX_LEN = 5592405;
    /**
     * 概要长度
     */
    private static final int SUMMARYLEN = 80;

    protected String title;
    protected String content;
    @Expose(serialize = false, deserialize = false)
    protected String summary;
    protected List<ArticlAnnex> annexes;//附件列表


    /**
     * 将新闻内容转换为数据库blob
     */
    public void convertContent2Blob() {
        summary = HtmlUtils.html2Str(content).trim();
        int len = summary.length();
        if (len > SUMMARYLEN) {
            summary = summary.substring(0, SUMMARYLEN);
        }
    }

    @Override
    public void validate() throws Exception {
        if (StringUtil.isStrNullOrWhiteSpace(title)) {
            throw new Exception("新闻标题title字段为空！");
        } else if (title.length() > TITLE_MAX_LEN) {
            throw new WarningException("标题长度过长，长度限制为85个汉字或字符！");
        }
        if (StringUtil.isStrNullOrWhiteSpace(content)) {
            throw new Exception("content为空！");
        } else if (content.length() > CONTENT_MAX_LEN) {
            throw new WarningException("内容长度过长，请精简文字后再试！");
        }
    }
}
