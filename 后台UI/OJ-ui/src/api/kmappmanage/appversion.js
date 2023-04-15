import request from '@/utils/request'

// 查询应用版本列表
export function listAppversion(query) {
  return request({
    url: '/kmappmanage/appversion/list',
    method: 'get',
    params: query
  })
}

// 查询应用版本详细
export function getAppversion(id) {
  return request({
    url: '/kmappmanage/appversion/' + id,
    method: 'get'
  })
}

// 新增应用版本
export function addAppversion(data) {
  return request({
    url: '/kmappmanage/appversion',
    method: 'post',
    data: data
  })
}

// 修改应用版本
export function updateAppversion(data) {
  return request({
    url: '/kmappmanage/appversion',
    method: 'put',
    data: data
  })
}

// 删除应用版本
export function delAppversion(id) {
  return request({
    url: '/kmappmanage/appversion/' + id,
    method: 'delete'
  })
}
