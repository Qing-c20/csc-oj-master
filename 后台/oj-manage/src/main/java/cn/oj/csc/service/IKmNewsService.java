package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.News;

/**
 * 狂码新闻Service接口
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
public interface IKmNewsService 
{
    /**
     * 查询狂码新闻
     * 
     * @param id 狂码新闻主键
     * @return 狂码新闻
     */
    public News selectKmNewsById(Long id);

    /**
     * 查询狂码新闻列表
     * 
     * @param news 狂码新闻
     * @return 狂码新闻集合
     */
    public List<News> selectKmNewsList(News news);

    /**
     * 新增狂码新闻
     * 
     * @param news 狂码新闻
     * @return 结果
     */
    public int insertKmNews(News news);

    /**
     * 修改狂码新闻
     * 
     * @param news 狂码新闻
     * @return 结果
     */
    public int updateKmNews(News news);

    /**
     * 批量删除狂码新闻
     * 
     * @param ids 需要删除的狂码新闻主键集合
     * @return 结果
     */
    public int deleteKmNewsByIds(Long[] ids);

    /**
     * 删除狂码新闻信息
     * 
     * @param id 狂码新闻主键
     * @return 结果
     */
    public int deleteKmNewsById(Long id);
}
