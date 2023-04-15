import request from '@/utils/request'

// 查询枪手预定列表
export function listBooking(query) {
  return request({
    url: '/kmappmanage/booking/list',
    method: 'get',
    params: query
  })
}

// 查询枪手预定详细
export function getBooking(id) {
  return request({
    url: '/kmappmanage/booking/' + id,
    method: 'get'
  })
}

// 新增枪手预定
export function addBooking(data) {
  return request({
    url: '/kmappmanage/booking',
    method: 'post',
    data: data
  })
}

// 修改枪手预定
export function updateBooking(data) {
  return request({
    url: '/kmappmanage/booking',
    method: 'put',
    data: data
  })
}

// 删除枪手预定
export function delBooking(id) {
  return request({
    url: '/kmappmanage/booking/' + id,
    method: 'delete'
  })
}
