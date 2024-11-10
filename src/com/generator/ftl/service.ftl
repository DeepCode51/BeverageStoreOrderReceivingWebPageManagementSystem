package com.service;

import com.entity.${Domain};

import java.util.List;
import java.util.Map;


public interface ${Domain}Service {

//  添加${tableNameCn}
  public int add(${Domain} po);
//  获取单个${tableNameCn}信息
  public ${Domain} getById(int id);
//  修改${tableNameCn}
  public int update(${Domain} po);
//  删除${tableNameCn}
  public int delete(int id);
//  查询${tableNameCn}
  public List<${Domain}> getAll(Map<String, Object> map);
//  验证${tableNameCn}名称
  public ${Domain} checkName(Map<String, Object> account);
//  分页显示
  public List<${Domain}> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}