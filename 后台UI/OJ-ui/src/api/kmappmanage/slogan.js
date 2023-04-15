import request from '@/utils/request'

// 查询标语管理列表
export function listSlogan(query) {
  return request({
    url: '/kmappmanage/slogan/list',
    method: 'get',
    params: query
  })
}

// 查询标语管理详细
export function getSlogan(id) {
  return request({
    url: '/kmappmanage/slogan/' + id,
    method: 'get'
  })
}

// 新增标语管理
export function addSlogan(data) {
  return request({
    url: '/kmappmanage/slogan',
    method: 'post',
    data: data
  })
}

// 修改标语管理
export function updateSlogan(data) {
  return request({
    url: '/kmappmanage/slogan',
    method: 'put',
    data: data
  })
}

// 删除标语管理
export function delSlogan(id) {
  return request({
    url: '/kmappmanage/slogan/' + id,
    method: 'delete'
  })
}
