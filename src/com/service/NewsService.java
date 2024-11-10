package com.service;

import com.entity.News;

import java.util.List;
import java.util.Map;


public interface NewsService {

//  添加新闻
  public int add(News po);
//  获取单个新闻信息
  public News getById(int id);
//  修改新闻
  public int update(News po);
//  删除新闻
  public int delete(int id);
//  查询新闻
  public List<News> getAll(Map<String, Object> map);
//  验证新闻名称
  public News checkName(Map<String, Object> account);
//  分页显示
  public List<News> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}