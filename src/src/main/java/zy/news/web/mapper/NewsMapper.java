package zy.news.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import zy.news.web.bean.ContentBase;
import zy.news.web.bean.News;
import zy.news.web.bean.NewsSimple;
import zy.news.web.ui.result.ReviewInfo;

@Repository
public interface NewsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(News record);

    News selectByPrimaryKey(Long id);

    List<NewsSimple> selectAllNewsSimple(@Param("reviewStatus") Byte reviewStatus, @Param("notReview") Byte notReview);

    int updateByPrimaryKey(News record);

    //apend

    /**
     * 此新闻是否存在
     *
     * @param news
     * @return
     */
    int exist(News news);

    /**
     * 获取简单的对象不带blob字段
     *
     * @param id
     * @return
     */
    News selectRecordWithOutBlobByPrimaryKey(Long id);

    /**
     * 获取content blob 字段
     *
     * @param id
     * @return
     */
    ContentBase selectContenBlobByPrimaryKey(Long id);

    /**
     * 获取详情
     *
     * @param id
     * @return
     */
    News selectNewsDetailByPrimaryKey(Long id);

    /**
     * 浏览量+1
     *
     * @param id
     * @return
     */
    int countViewByPrimaryKey(Long id);

    /**
     * 更新审核信息
     *
     * @param reviewInfo
     * @return
     */
    int updateReviewInfo(ReviewInfo reviewInfo);

    /**
     * 获取审核详情
     *
     * @param id
     * @return
     */
    ReviewInfo selectReviewInfoByPrimaryKey(Long id);
}