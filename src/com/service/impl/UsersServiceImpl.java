package com.service.impl;

import com.dao.UsersMapper;
import com.entity.Users;
import com.service.UsersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UsersServiceImpl implements UsersService {
	@Resource
    private UsersMapper usersdao;

	@Override
	public Users adminLogin(Map<String, Object> po) {
		return usersdao.adminLogin(po);
	}

	@Override
	public int add(Users po) {
		return usersdao.insertSelective(po);
	}
	@Override
	public int update(Users po) {
		return usersdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return usersdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Users> getAll(Map<String, Object> map) {
		return usersdao.getAll(map);
	}
	@Override
	public Users checkName(Map<String, Object> account) {
		return usersdao.checkName(account);
	}
	@Override
	public List<Users> getByPage(Map<String, Object> map) {
		return usersdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return usersdao.getCount(po);
	}
	@Override
	public Users getById(int id) {
		return usersdao.selectByPrimaryKey(id);
	}

}
