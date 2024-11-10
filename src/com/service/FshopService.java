package com.service;

import com.entity.Fshop;

import java.util.List;
import java.util.Map;


public interface FshopService {

//  添加购物车
  public int add(Fshop po);
//  获取单个购物车信息
  public Fshop getById(int id);
//  修改购物车
  public int update(Fshop po);
//  删除购物车
  public int delete(int id);
//  查询购物车
  public List<Fshop> getAll(Map<String, Object> map);
//  验证购物车名称
  public Fshop checkName(Map<String, Object> account);
//  分页显示
  public List<Fshop> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}