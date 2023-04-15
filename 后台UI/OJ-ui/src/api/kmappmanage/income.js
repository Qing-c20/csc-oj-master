import request from '@/utils/request'

// 查询用户收入列表
export function listIncome(query) {
  return request({
    url: '/kmappmanage/income/list',
    method: 'get',
    params: query
  })
}

// 查询用户收入详细
export function getIncome(id) {
  return request({
    url: '/kmappmanage/income/' + id,
    method: 'get'
  })
}

// 新增用户收入
export function addIncome(data) {
  return request({
    url: '/kmappmanage/income',
    method: 'post',
    data: data
  })
}

// 修改用户收入
export function updateIncome(data) {
  return request({
    url: '/kmappmanage/income',
    method: 'put',
    data: data
  })
}

// 删除用户收入
export function delIncome(id) {
  return request({
    url: '/kmappmanage/income/' + id,
    method: 'delete'
  })
}
