import request from '@/utils/request'

// 查询用户管理列表
export function listUsermanage(query) {
  return request({
    url: '/kmappmanage/usermanage/list',
    method: 'get',
    params: query
  })
}

// 查询用户管理详细
export function getUsermanage(id) {
  return request({
    url: '/kmappmanage/usermanage/' + id,
    method: 'get'
  })
}

// 新增用户管理
export function addUsermanage(data) {
  return request({
    url: '/kmappmanage/usermanage',
    method: 'post',
    data: data
  })
}

// 修改用户管理
export function updateUsermanage(data) {
  return request({
    url: '/kmappmanage/usermanage',
    method: 'put',
    data: data
  })
}

// 删除用户管理
export function delUsermanage(id) {
  return request({
    url: '/kmappmanage/usermanage/' + id,
    method: 'delete'
  })
}
