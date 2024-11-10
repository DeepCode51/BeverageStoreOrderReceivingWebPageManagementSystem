package com.dao;

import com.entity.Ftype;

import java.util.List;
import java.util.Map;

public interface FtypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Ftype ftype);

    int insertSelective(Ftype ftype);

    Ftype selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Ftype ftype);

    int updateByPrimaryKeyWithBLOBs(Ftype ftype);

    int updateByPrimaryKey(Ftype ftype);

    public Ftype checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Ftype> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Ftype> getByPage(Map<String, Object> map);
}