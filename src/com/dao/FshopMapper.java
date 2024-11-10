package com.dao;

import com.entity.Fshop;

import java.util.List;
import java.util.Map;

public interface FshopMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Fshop fshop);

    int insertSelective(Fshop fshop);

    Fshop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Fshop fshop);

    int updateByPrimaryKeyWithBLOBs(Fshop fshop);

    int updateByPrimaryKey(Fshop fshop);

    public Fshop checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Fshop> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Fshop> getByPage(Map<String, Object> map);
}