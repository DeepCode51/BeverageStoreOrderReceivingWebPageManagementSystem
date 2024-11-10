package com.service.impl;

import com.dao.FshopMapper;
import com.entity.Fshop;
import com.service.FshopService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class FshopServiceImpl implements FshopService {
	@Resource
    private FshopMapper fshopdao;

	@Override
	public int add(Fshop po) {
		return fshopdao.insertSelective(po);
	}
	@Override
	public int update(Fshop po) {
		return fshopdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return fshopdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Fshop> getAll(Map<String, Object> map) {
		return fshopdao.getAll(map);
	}
	@Override
	public Fshop checkName(Map<String, Object> account) {
		return fshopdao.checkName(account);
	}
	@Override
	public List<Fshop> getByPage(Map<String, Object> map) {
		return fshopdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return fshopdao.getCount(po);
	}
	@Override
	public Fshop getById(int id) {
		return fshopdao.selectByPrimaryKey(id);
	}

}
