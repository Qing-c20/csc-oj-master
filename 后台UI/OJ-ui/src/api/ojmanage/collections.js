import request from '@/utils/request'

// 查询个人收藏管理列表
export function listCollections(query) {
  return request({
    url: '/ojmanage/collections/list',
    method: 'get',
    params: query
  })
}

// 查询个人收藏管理详细
export function getCollections(id) {
  return request({
    url: '/ojmanage/collections/' + id,
    method: 'get'
  })
}

// 新增个人收藏管理
export function addCollections(data) {
  return request({
    url: '/ojmanage/collections',
    method: 'post',
    data: data
  })
}

// 修改个人收藏管理
export function updateCollections(data) {
  return request({
    url: '/ojmanage/collections',
    method: 'put',
    data: data
  })
}

// 删除个人收藏管理
export function delCollections(id) {
  return request({
    url: '/ojmanage/collections/' + id,
    method: 'delete'
  })
}
