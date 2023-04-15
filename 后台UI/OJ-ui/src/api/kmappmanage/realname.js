import request from '@/utils/request'

// 查询实名审核列表
export function listRealname(query) {
  return request({
    url: '/kmappmanage/realname/list',
    method: 'get',
    params: query
  })
}

// 查询实名审核详细
export function getRealname(id) {
  return request({
    url: '/kmappmanage/realname/' + id,
    method: 'get'
  })
}

// 新增实名审核
export function addRealname(data) {
  return request({
    url: '/kmappmanage/realname',
    method: 'post',
    data: data
  })
}

// 修改实名审核
export function updateRealname(data) {
  return request({
    url: '/kmappmanage/realname',
    method: 'put',
    data: data
  })
}

// 删除实名审核
export function delRealname(id) {
  return request({
    url: '/kmappmanage/realname/' + id,
    method: 'delete'
  })
}
