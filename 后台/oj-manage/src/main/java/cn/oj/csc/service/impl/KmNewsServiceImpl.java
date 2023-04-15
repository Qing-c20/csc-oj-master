package cn.oj.csc.service.impl;

import java.util.List;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmNewsMapper;
import cn.oj.csc.domain.News;
import cn.oj.csc.service.IKmNewsService;

/**
 * 狂码新闻Service业务层处理
 * 
 * @author 翟彬州
 * @date 2022-07-03
 */
@Service
public class KmNewsServiceImpl implements IKmNewsService 
{
    @Autowired
    private KmNewsMapper kmNewsMapper;

    /**
     * 查询狂码新闻
     * 
     * @param id 狂码新闻主键
     * @return 狂码新闻
     */
    @Override
    public News selectKmNewsById(Long id)
    {
        return kmNewsMapper.selectKmNewsById(id);
    }

    /**
     * 查询狂码新闻列表
     * 
     * @param news 狂码新闻
     * @return 狂码新闻
     */
    @Override
    public List<News> selectKmNewsList(News news)
    {
        return kmNewsMapper.selectKmNewsList(news);
    }

    /**
     * 新增狂码新闻
     * 
     * @param news 狂码新闻
     * @return 结果
     */
    @Override
    public int insertKmNews(News news)
    {
        news.setCreateTime(DateUtils.getNowDate());
        return kmNewsMapper.insertKmNews(news);
    }

    /**
     * 修改狂码新闻
     * 
     * @param news 狂码新闻
     * @return 结果
     */
    @Override
    public int updateKmNews(News news)
    {
        return kmNewsMapper.updateKmNews(news);
    }

    /**
     * 批量删除狂码新闻
     * 
     * @param ids 需要删除的狂码新闻主键
     * @return 结果
     */
    @Override
    public int deleteKmNewsByIds(Long[] ids)
    {
        return kmNewsMapper.deleteKmNewsByIds(ids);
    }

    /**
     * 删除狂码新闻信息
     * 
     * @param id 狂码新闻主键
     * @return 结果
     */
    @Override
    public int deleteKmNewsById(Long id)
    {
        return kmNewsMapper.deleteKmNewsById(id);
    }
}
