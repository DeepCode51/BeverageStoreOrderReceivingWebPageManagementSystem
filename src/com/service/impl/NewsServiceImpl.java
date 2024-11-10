package com.service.impl;

import com.dao.NewsMapper;
import com.entity.News;
import com.service.NewsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class NewsServiceImpl implements NewsService {
	@Resource
    private NewsMapper newsdao;

	@Override
	public int add(News po) {
		return newsdao.insertSelective(po);
	}
	@Override
	public int update(News po) {
		return newsdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return newsdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<News> getAll(Map<String, Object> map) {
		return newsdao.getAll(map);
	}
	@Override
	public News checkName(Map<String, Object> account) {
		return newsdao.checkName(account);
	}
	@Override
	public List<News> getByPage(Map<String, Object> map) {
		return newsdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return newsdao.getCount(po);
	}
	@Override
	public News getById(int id) {
		return newsdao.selectByPrimaryKey(id);
	}

}
