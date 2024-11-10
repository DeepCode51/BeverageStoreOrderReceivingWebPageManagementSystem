package com.service;

import com.entity.Keep;

import java.util.List;
import java.util.Map;


public interface KeepService {

//  添加收藏
  public int add(Keep po);
//  获取单个收藏信息
  public Keep getById(int id);
//  修改收藏
  public int update(Keep po);
//  删除收藏
  public int delete(int id);
//  查询收藏
  public List<Keep> getAll(Map<String, Object> map);
//  验证收藏名称
  public Keep checkName(Map<String, Object> account);
//  分页显示
  public List<Keep> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}