package com.dao;

import com.entity.Users;

import java.util.List;
import java.util.Map;

public interface UsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Users users);

    int insertSelective(Users users);

    Users selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Users users);

    int updateByPrimaryKey(Users users);

    public Users checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Users> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Users> getByPage(Map<String, Object> map);

    Users adminLogin(Map<String, Object> po);
}