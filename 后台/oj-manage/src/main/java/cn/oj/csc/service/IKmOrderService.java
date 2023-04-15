package cn.oj.csc.service;

import java.util.List;
import cn.oj.csc.domain.Orders;

/**
 * 应用订单Service接口
 * 
 * @author 甲粒子
 * @date 2022-07-30
 */
public interface IKmOrderService 
{
    /**
     * 查询应用订单
     * 
     * @param id 应用订单主键
     * @return 应用订单
     */
    public Orders selectKmOrderById(Long id);

    /**
     * 查询应用订单列表
     * 
     * @param orders 应用订单
     * @return 应用订单集合
     */
    public List<Orders> selectKmOrderList(Orders orders);

    /**
     * 新增应用订单
     * 
     * @param orders 应用订单
     * @return 结果
     */
    public int insertKmOrder(Orders orders);

    /**
     * 修改应用订单
     * 
     * @param orders 应用订单
     * @return 结果
     */
    public int updateKmOrder(Orders orders);

    /**
     * 批量删除应用订单
     * 
     * @param ids 需要删除的应用订单主键集合
     * @return 结果
     */
    public int deleteKmOrderByIds(Long[] ids);

    /**
     * 删除应用订单信息
     * 
     * @param id 应用订单主键
     * @return 结果
     */
    public int deleteKmOrderById(Long id);
}
