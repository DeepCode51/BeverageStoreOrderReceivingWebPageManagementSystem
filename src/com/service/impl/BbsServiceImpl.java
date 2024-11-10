package com.service.impl;

import com.dao.BbsMapper;
import com.entity.Bbs;
import com.service.BbsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BbsServiceImpl implements BbsService {
	@Resource
    private BbsMapper bbsdao;

	@Override
	public int add(Bbs po) {
		return bbsdao.insertSelective(po);
	}
	@Override
	public int update(Bbs po) {
		return bbsdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return bbsdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Bbs> getAll(Map<String, Object> map) {
		return bbsdao.getAll(map);
	}
	@Override
	public Bbs checkName(Map<String, Object> account) {
		return bbsdao.checkName(account);
	}
	@Override
	public List<Bbs> getByPage(Map<String, Object> map) {
		return bbsdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return bbsdao.getCount(po);
	}
	@Override
	public Bbs getById(int id) {
		return bbsdao.selectByPrimaryKey(id);
	}

}
