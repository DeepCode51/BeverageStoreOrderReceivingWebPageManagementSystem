package com.dao;

import com.entity.Goods;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods goods);

    int insertSelective(Goods goods);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods goods);

    int updateByPrimaryKeyWithBLOBs(Goods goods);

    int updateByPrimaryKey(Goods goods);

    public Goods checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Goods> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Goods> getByPage(Map<String, Object> map);
}