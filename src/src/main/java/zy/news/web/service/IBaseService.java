package zy.news.web.service;

import zy.news.web.bean.News;

import javax.servlet.http.HttpSession;

/**
 * 基础服务接口
 *
 * @author maoko
 * @date 2020/2/27 14:53
 */
public interface IBaseService<T> {

    /**
     * 判断是否存在
     *
     * @param record
     * @param tmpRecord
     * @return
     */
    boolean exist(T record, T tmpRecord);

    /**
     * 添加新闻
     *
     * @param session
     * @param record
     */
    void add(HttpSession session, T record) throws Exception;

    /**
     * 删除新闻
     *
     * @param session
     * @param record
     * @throws Exception
     */
    void delete(HttpSession session, T record) throws Exception;

    /**
     * 编辑更新
     *
     * @param session
     * @param record
     * @throws Exception
     */
    void update(HttpSession session, T record) throws Exception;

    /**
     * 获取详情
     *
     * @param id
     * @return
     * @throws Exception
     */
    T getRecordDetail(Long id) throws Exception;
}
