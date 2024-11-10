package com.dao;

import com.entity.News;

import java.util.List;
import java.util.Map;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News news);

    int insertSelective(News news);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News news);

    int updateByPrimaryKeyWithBLOBs(News news);

    int updateByPrimaryKey(News news);

    public News checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<News> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<News> getByPage(Map<String, Object> map);
}