import request from '@/utils/request'

// 查询应用订单列表
export function listOrder(query) {
  return request({
    url: '/kmappmanage/order/list',
    method: 'get',
    params: query
  })
}

// 查询应用订单详细
export function getOrder(id) {
  return request({
    url: '/kmappmanage/order/' + id,
    method: 'get'
  })
}

// 新增应用订单
export function addOrder(data) {
  return request({
    url: '/kmappmanage/order',
    method: 'post',
    data: data
  })
}

// 修改应用订单
export function updateOrder(data) {
  return request({
    url: '/kmappmanage/order',
    method: 'put',
    data: data
  })
}

// 删除应用订单
export function delOrder(id) {
  return request({
    url: '/kmappmanage/order/' + id,
    method: 'delete'
  })
}
