import request from '@/utils/request'

// 查询用户答题管理列表
export function listAnswer(query) {
  return request({
    url: '/ojmanage/answer/list',
    method: 'get',
    params: query
  })
}

// 查询用户答题管理详细
export function getAnswer(id) {
  return request({
    url: '/ojmanage/answer/' + id,
    method: 'get'
  })
}

// 新增用户答题管理
export function addAnswer(data) {
  return request({
    url: '/ojmanage/answer',
    method: 'post',
    data: data
  })
}

// 修改用户答题管理
export function updateAnswer(data) {
  return request({
    url: '/ojmanage/answer',
    method: 'put',
    data: data
  })
}

// 删除用户答题管理
export function delAnswer(id) {
  return request({
    url: '/ojmanage/answer/' + id,
    method: 'delete'
  })
}
