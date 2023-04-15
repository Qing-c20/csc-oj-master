import request from '@/utils/request'

// 查询用户支出列表
export function listExpenditure(query) {
  return request({
    url: '/kmappmanage/expenditure/list',
    method: 'get',
    params: query
  })
}

// 查询用户支出详细
export function getExpenditure(id) {
  return request({
    url: '/kmappmanage/expenditure/' + id,
    method: 'get'
  })
}

// 新增用户支出
export function addExpenditure(data) {
  return request({
    url: '/kmappmanage/expenditure',
    method: 'post',
    data: data
  })
}

// 修改用户支出
export function updateExpenditure(data) {
  return request({
    url: '/kmappmanage/expenditure',
    method: 'put',
    data: data
  })
}

// 删除用户支出
export function delExpenditure(id) {
  return request({
    url: '/kmappmanage/expenditure/' + id,
    method: 'delete'
  })
}
