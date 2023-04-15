import request from '@/utils/request'

// 查询狂码新闻列表
export function listNews(query) {
  return request({
    url: '/kmappmanage/news/list',
    method: 'get',
    params: query
  })
}

// 查询狂码新闻详细
export function getNews(id) {
  return request({
    url: '/kmappmanage/news/' + id,
    method: 'get'
  })
}

// 新增狂码新闻
export function addNews(data) {
  return request({
    url: '/kmappmanage/news',
    method: 'post',
    data: data
  })
}

// 修改狂码新闻
export function updateNews(data) {
  return request({
    url: '/kmappmanage/news',
    method: 'put',
    data: data
  })
}

// 删除狂码新闻
export function delNews(id) {
  return request({
    url: '/kmappmanage/news/' + id,
    method: 'delete'
  })
}
