import request from '@/utils/request'

// 查询个人收藏管理列表
export function listCollection(query) {
  return request({
    url: '/ojmanage/collection/list',
    method: 'get',
    params: query
  })
}

// 查询个人收藏管理详细
export function getCollection(id) {
  return request({
    url: '/ojmanage/collection/' + id,
    method: 'get'
  })
}

// 新增个人收藏管理
export function addCollection(data) {
  return request({
    url: '/ojmanage/collection',
    method: 'post',
    data: data
  })
}

// 修改个人收藏管理
export function updateCollection(data) {
  return request({
    url: '/ojmanage/collection',
    method: 'put',
    data: data
  })
}

// 删除个人收藏管理
export function delCollection(id) {
  return request({
    url: '/ojmanage/collection/' + id,
    method: 'delete'
  })
}
