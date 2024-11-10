package com.dao;

import com.entity.Bbs;

import java.util.List;
import java.util.Map;

public interface BbsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Bbs bbs);

    int insertSelective(Bbs bbs);

    Bbs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Bbs bbs);

    int updateByPrimaryKeyWithBLOBs(Bbs bbs);

    int updateByPrimaryKey(Bbs bbs);

    public Bbs checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Bbs> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Bbs> getByPage(Map<String, Object> map);
}