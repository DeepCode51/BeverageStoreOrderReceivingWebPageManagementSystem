package com.dao;

import com.entity.Keep;

import java.util.List;
import java.util.Map;

public interface KeepMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Keep keep);

    int insertSelective(Keep keep);

    Keep selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Keep keep);

    int updateByPrimaryKeyWithBLOBs(Keep keep);

    int updateByPrimaryKey(Keep keep);

    public Keep checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Keep> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Keep> getByPage(Map<String, Object> map);
}