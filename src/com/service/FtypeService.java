package com.service;

import com.entity.Ftype;

import java.util.List;
import java.util.Map;


public interface FtypeService {

//  添加分类
  public int add(Ftype po);
//  获取单个分类信息
  public Ftype getById(int id);
//  修改分类
  public int update(Ftype po);
//  删除分类
  public int delete(int id);
//  查询分类
  public List<Ftype> getAll(Map<String, Object> map);
//  验证分类名称
  public Ftype checkName(Map<String, Object> account);
//  分页显示
  public List<Ftype> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}