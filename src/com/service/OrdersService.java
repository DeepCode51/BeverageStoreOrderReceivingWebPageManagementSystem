package com.service;

import com.entity.Orders;

import java.util.List;
import java.util.Map;


public interface OrdersService {

//  添加订单
  public int add(Orders po);
//  获取单个订单信息
  public Orders getById(int id);
//  修改订单
  public int update(Orders po);
//  删除订单
  public int delete(int id);
//  查询订单
  public List<Orders> getAll(Map<String, Object> map);
//  验证订单名称
  public Orders checkName(Map<String, Object> account);
//  分页显示
  public List<Orders> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}