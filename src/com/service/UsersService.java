package com.service;

import com.entity.Users;

import java.util.List;
import java.util.Map;


public interface UsersService {

  Users adminLogin(Map<String, Object> po);

//  添加用户表
  public int add(Users po);
//  获取单个用户表信息
  public Users getById(int id);
//  修改用户表
  public int update(Users po);
//  删除用户表
  public int delete(int id);
//  查询用户表
  public List<Users> getAll(Map<String, Object> map);
//  验证用户表名称
  public Users checkName(Map<String, Object> account);
//  分页显示
  public List<Users> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}