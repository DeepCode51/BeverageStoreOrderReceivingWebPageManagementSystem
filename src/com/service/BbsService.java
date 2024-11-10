package com.service;

import com.entity.Bbs;

import java.util.List;
import java.util.Map;


public interface BbsService {

//  添加投诉及建议表
  public int add(Bbs po);
//  获取单个投诉及建议表信息
  public Bbs getById(int id);
//  修改投诉及建议表
  public int update(Bbs po);
//  删除投诉及建议表
  public int delete(int id);
//  查询投诉及建议表
  public List<Bbs> getAll(Map<String, Object> map);
//  验证投诉及建议表名称
  public Bbs checkName(Map<String, Object> account);
//  分页显示
  public List<Bbs> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}