package cn.oj.csc.service.impl;

import java.util.List;

import cn.oj.csc.domain.Orders;
import cn.oj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.oj.csc.mapper.KmOrderMapper;
import cn.oj.csc.service.IKmOrderService;

/**
 * 应用订单Service业务层处理
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
@Service
public class KmOrderServiceImpl implements IKmOrderService 
{
    @Autowired
    private KmOrderMapper kmOrderMapper;

    /**
     * 查询应用订单
     * 
     * @param id 应用订单主键
     * @return 应用订单
     */
    @Override
    public Orders selectKmOrderById(Long id)
    {
        return kmOrderMapper.selectKmOrderById(id);
    }

    /**
     * 查询应用订单列表
     * 
     * @param orders 应用订单
     * @return 应用订单
     */
    @Override
    public List<Orders> selectKmOrderList(Orders orders)
    {
        return kmOrderMapper.selectKmOrderList(orders);
    }

    /**
     * 新增应用订单
     * 
     * @param orders 应用订单
     * @return 结果
     */
    @Override
    public int insertKmOrder(Orders orders)
    {
        orders.setCreateTime(DateUtils.getNowDate());
        return kmOrderMapper.insertKmOrder(orders);
    }

    /**
     * 修改应用订单
     * 
     * @param orders 应用订单
     * @return 结果
     */
    @Override
    public int updateKmOrder(Orders orders)
    {
        return kmOrderMapper.updateKmOrder(orders);
    }

    /**
     * 批量删除应用订单
     * 
     * @param ids 需要删除的应用订单主键
     * @return 结果
     */
    @Override
    public int deleteKmOrderByIds(Long[] ids)
    {
        return kmOrderMapper.deleteKmOrderByIds(ids);
    }

    /**
     * 删除应用订单信息
     * 
     * @param id 应用订单主键
     * @return 结果
     */
    @Override
    public int deleteKmOrderById(Long id)
    {
        return kmOrderMapper.deleteKmOrderById(id);
    }
}
