import request from '@/utils/request'

// 查询评论回复管理列表
export function listReply(query) {
  return request({
    url: '/ojmanage/reply/list',
    method: 'get',
    params: query
  })
}

// 查询评论回复管理详细
export function getReply(replyId) {
  return request({
    url: '/ojmanage/reply/' + replyId,
    method: 'get'
  })
}

// 新增评论回复管理
export function addReply(data) {
  return request({
    url: '/ojmanage/reply',
    method: 'post',
    data: data
  })
}

// 修改评论回复管理
export function updateReply(data) {
  return request({
    url: '/ojmanage/reply',
    method: 'put',
    data: data
  })
}

// 删除评论回复管理
export function delReply(replyId) {
  return request({
    url: '/ojmanage/reply/' + replyId,
    method: 'delete'
  })
}
