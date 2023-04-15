import request from '@/utils/request'

// 查询讨论区管理列表
export function listDiscussion(query) {
  return request({
    url: '/ojmanage/discussion/list',
    method: 'get',
    params: query
  })
}

// 查询讨论区管理详细
export function getDiscussion(discussionId) {
  return request({
    url: '/ojmanage/discussion/' + discussionId,
    method: 'get'
  })
}

// 新增讨论区管理
export function addDiscussion(data) {
  return request({
    url: '/ojmanage/discussion',
    method: 'post',
    data: data
  })
}

// 修改讨论区管理
export function updateDiscussion(data) {
  return request({
    url: '/ojmanage/discussion',
    method: 'put',
    data: data
  })
}

// 删除讨论区管理
export function delDiscussion(discussionId) {
  return request({
    url: '/ojmanage/discussion/' + discussionId,
    method: 'delete'
  })
}
