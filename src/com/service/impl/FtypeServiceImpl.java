package com.service.impl;

import com.dao.FtypeMapper;
import com.entity.Ftype;
import com.service.FtypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class FtypeServiceImpl implements FtypeService {
	@Resource
    private FtypeMapper ftypedao;

	@Override
	public int add(Ftype po) {
		return ftypedao.insertSelective(po);
	}
	@Override
	public int update(Ftype po) {
		return ftypedao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return ftypedao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Ftype> getAll(Map<String, Object> map) {
		return ftypedao.getAll(map);
	}
	@Override
	public Ftype checkName(Map<String, Object> account) {
		return ftypedao.checkName(account);
	}
	@Override
	public List<Ftype> getByPage(Map<String, Object> map) {
		return ftypedao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return ftypedao.getCount(po);
	}
	@Override
	public Ftype getById(int id) {
		return ftypedao.selectByPrimaryKey(id);
	}

}
