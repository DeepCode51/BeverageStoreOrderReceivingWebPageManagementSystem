package com.controller.web;

import com.entity.Ftype;
import com.entity.Goods;
import com.entity.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.*;
import com.util.Info;
import com.util.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NewsForeController {
	@Resource
	private NewsService newsService;
	@Resource
	private OrdersService ordersService;
	@Resource 
	private UsersService userService;
	@Resource
	private GoodsService goodsService;
	@Resource
    private FtypeService ftypeService;

    /*通用方法*/
    public void commonMethod(ModelMap map){
        map.put("tlist",ftypeService.getAll(null));
    }


	
//	首页显示内容
	@RequestMapping("index.do")
	public String showIndex(ModelMap map){
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> pmap2=new HashMap<String,Object>();
		Map<String, Object> jzmap=new HashMap<String,Object>();
		Map<String, Object> sbmap=new HashMap<String,Object>();
		Map<String, Object> tmap=new HashMap<String,Object>();
		pmap.put("pageno", 0);
		pmap.put("pageSize", 4);
		pmap.put("gtype", "新闻资讯");
		
		pmap2.put("pageno", 1);
		pmap2.put("pageSize", 6);
		pmap2.put("gtype", "新闻资讯");
		
		jzmap.put("pageno", 0);
		jzmap.put("pageSize", 10);
		
		
		List<News> list=newsService.getByPage(pmap);
		
		List<News> list2=newsService.getByPage(pmap2);
		
		List<News> sblist=newsService.getByPage(sbmap);

		List<Goods> clist=goodsService.getAll(jzmap);
	    List<Ftype> tlist=ftypeService.getAll(tmap);
	    map.put("sblist", sblist);
		map.put("list", list);
		map.put("list2", list2);
		map.put("glist", clist);
		map.put("tlist", tlist);
		return "index2";
	}

	
	
	
	
	//news.do 新闻资讯
	@RequestMapping("showNewsList.do")
	public String showNewsList(@RequestParam(value="page",defaultValue = "1")Integer page,
                               ModelMap map, HttpSession session){
		Map<String, Object> bMap=new HashMap<String,Object>();
        bMap.put("gtype", "新闻资讯");
        PageHelper.startPage(page, Info.PAGE_SIZE);
		List<News> list=newsService.getAll(bMap);
        PageInfo<News> pageInfo = new PageInfo<>(list,Info.PAGE_SIZE);
		map.put("pageInfo", pageInfo);
        /*通用方法*/
        commonMethod(map);
		session.setAttribute("p", 1);
		return "news_list";
	}
	
	//搜索查询新闻资讯searchNews.do
	@RequestMapping("searchNews.do")
	public String searchNews(@RequestParam(value="page",defaultValue = "1")Integer page,
                             ModelMap map, HttpSession session, News news){
        Map<String, Object> bMap=new HashMap<String,Object>();
        bMap.put("gtype", "新闻资讯");
        if (news.getName()!=null&&!news.getName().equals("")){
            bMap.put("name", news.getName());
        }
        PageHelper.startPage(1, newsService.getAll(bMap).size());
		List<News> list=newsService.getAll(bMap);
        PageInfo<News> pageInfo = new PageInfo<>(list,list.size());
        map.put("pageInfo", pageInfo);
        /*通用方法*/
        commonMethod(map);
		session.setAttribute("p", 2);
		return "news_list";
	}




	//显示单个新闻的信息
    @RequestMapping("showNews.do")
    public String showNews(ModelMap map, int id){
    	System.out.println("id==="+id);
    	map.put("news", newsService.getById(id));
        /*通用方法*/
        commonMethod(map);
    	return "newsx";
    }

    @RequestMapping("showNewsx.do")
    public String showNewsx(ModelMap map, int id){
        System.out.println("id==="+id);
        map.put("news", newsService.getById(id));
        /*通用方法*/
        commonMethod(map);
        return "newsx";
    }

}
