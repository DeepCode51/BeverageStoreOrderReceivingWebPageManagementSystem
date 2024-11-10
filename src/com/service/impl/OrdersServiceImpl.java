package com.service.impl;

import com.dao.OrdersMapper;
import com.entity.Orders;
import com.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class OrdersServiceImpl implements OrdersService {
	@Resource
    private OrdersMapper ordersdao;

	@Override
	public int add(Orders po) {
		return ordersdao.insertSelective(po);
	}
	@Override
	public int update(Orders po) {
		return ordersdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return ordersdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Orders> getAll(Map<String, Object> map) {
		return ordersdao.getAll(map);
	}
	@Override
	public Orders checkName(Map<String, Object> account) {
		return ordersdao.checkName(account);
	}
	@Override
	public List<Orders> getByPage(Map<String, Object> map) {
		return ordersdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return ordersdao.getCount(po);
	}
	@Override
	public Orders getById(int id) {
		return ordersdao.selectByPrimaryKey(id);
	}

}
