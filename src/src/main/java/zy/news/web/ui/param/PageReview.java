package zy.news.web.ui.param;

import lombok.Data;
import maoko.common.exception.OutOfRangeException;
import zy.news.web.zsys.bean.Page;

/**
 * @author maoko
 * @date 2020/3/17 17:43
 */
public class PageReview extends Page {

    private Byte status;
    /**
     * 没有被审核操作的，当status=0 时有效
     * 0：不启用此筛选 1：启用此筛选（从未被审核的）
     */
    private Byte notReview;

    public Page getPage() {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(size);
        return page;
    }

    public ReviewStatus getStatus() throws OutOfRangeException {
        return ReviewStatus.getInstance(status.byteValue());
    }

    public Byte getNotReview() {
        if (status != 0) {
            notReview = 0;
        }
        return notReview;
    }

    public void setNotReview(Byte notReview) {
        this.notReview = notReview;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}
