package com.dao;

import com.entity.${Domain};

import java.util.List;
import java.util.Map;

public interface ${Domain}Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(${Domain} ${domain});

    int insertSelective(${Domain} ${domain});

    ${Domain} selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(${Domain} ${domain});

    int updateByPrimaryKeyWithBLOBs(${Domain} ${domain});

    int updateByPrimaryKey(${Domain} ${domain});

    public ${Domain} checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<${Domain}> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<${Domain}> getByPage(Map<String, Object> map);
}