import request from '@/utils/request'

// 查询狂码banner列表
export function listKmbanner(query) {
  return request({
    url: '/kmappmanage/kmbanner/list',
    method: 'get',
    params: query
  })
}

// 查询狂码banner详细
export function getKmbanner(id) {
  return request({
    url: '/kmappmanage/kmbanner/' + id,
    method: 'get'
  })
}

// 新增狂码banner
export function addKmbanner(data) {
  return request({
    url: '/kmappmanage/kmbanner',
    method: 'post',
    data: data
  })
}

// 修改狂码banner
export function updateKmbanner(data) {
  return request({
    url: '/kmappmanage/kmbanner',
    method: 'put',
    data: data
  })
}

// 删除狂码banner
export function delKmbanner(id) {
  return request({
    url: '/kmappmanage/kmbanner/' + id,
    method: 'delete'
  })
}
