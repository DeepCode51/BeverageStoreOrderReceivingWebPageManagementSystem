package com.service.impl;

import com.dao.${Domain}Mapper;
import com.entity.${Domain};
import com.service.${Domain}Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ${Domain}ServiceImpl implements ${Domain}Service {
	@Resource
    private ${Domain}Mapper ${domain}dao;

	@Override
	public int add(${Domain} po) {
		return ${domain}dao.insertSelective(po);
	}
	@Override
	public int update(${Domain} po) {
		return ${domain}dao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return ${domain}dao.deleteByPrimaryKey(id);
	}
	@Override
	public List<${Domain}> getAll(Map<String, Object> map) {
		return ${domain}dao.getAll(map);
	}
	@Override
	public ${Domain} checkName(Map<String, Object> account) {
		return ${domain}dao.checkName(account);
	}
	@Override
	public List<${Domain}> getByPage(Map<String, Object> map) {
		return ${domain}dao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return ${domain}dao.getCount(po);
	}
	@Override
	public ${Domain} getById(int id) {
		return ${domain}dao.selectByPrimaryKey(id);
	}

}
