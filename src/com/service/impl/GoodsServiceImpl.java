package com.service.impl;

import com.dao.GoodsMapper;
import com.entity.Goods;
import com.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Resource
    private GoodsMapper goodsdao;

	@Override
	public int add(Goods po) {
		return goodsdao.insertSelective(po);
	}
	@Override
	public int update(Goods po) {
		return goodsdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return goodsdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Goods> getAll(Map<String, Object> map) {
		return goodsdao.getAll(map);
	}
	@Override
	public Goods checkName(Map<String, Object> account) {
		return goodsdao.checkName(account);
	}
	@Override
	public List<Goods> getByPage(Map<String, Object> map) {
		return goodsdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return goodsdao.getCount(po);
	}
	@Override
	public Goods getById(int id) {
		return goodsdao.selectByPrimaryKey(id);
	}

}
