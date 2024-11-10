package com.service.impl;

import com.dao.KeepMapper;
import com.entity.Keep;
import com.service.KeepService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class KeepServiceImpl implements KeepService {
	@Resource
    private KeepMapper keepdao;

	@Override
	public int add(Keep po) {
		return keepdao.insertSelective(po);
	}
	@Override
	public int update(Keep po) {
		return keepdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return keepdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Keep> getAll(Map<String, Object> map) {
		return keepdao.getAll(map);
	}
	@Override
	public Keep checkName(Map<String, Object> account) {
		return keepdao.checkName(account);
	}
	@Override
	public List<Keep> getByPage(Map<String, Object> map) {
		return keepdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return keepdao.getCount(po);
	}
	@Override
	public Keep getById(int id) {
		return keepdao.selectByPrimaryKey(id);
	}

}
