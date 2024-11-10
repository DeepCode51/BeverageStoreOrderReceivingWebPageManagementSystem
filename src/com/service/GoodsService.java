package com.service;

import com.entity.Goods;

import java.util.List;
import java.util.Map;


public interface GoodsService {

//  添加饮品
  public int add(Goods po);
//  获取单个饮品信息
  public Goods getById(int id);
//  修改饮品
  public int update(Goods po);
//  删除饮品
  public int delete(int id);
//  查询饮品
  public List<Goods> getAll(Map<String, Object> map);
//  验证饮品名称
  public Goods checkName(Map<String, Object> account);
//  分页显示
  public List<Goods> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}