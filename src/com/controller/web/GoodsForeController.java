package com.controller.web;

import com.entity.Goods;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.FtypeService;
import com.service.GoodsService;
import com.util.Info;
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
public class GoodsForeController {
    @Resource
    private GoodsService goodsService;
    @Resource
    private FtypeService ftypeService;

    /**
     * ====前台饮品管理====
     *
     * @return
     */

    /*通用方法*/
    public void commonMethod(ModelMap map){
        map.put("tlist",ftypeService.getAll(null));
    }




    // 查询所有饮品的信息
    @RequestMapping("showGoodsList.do")
    public String goodsList(@RequestParam(value="page",defaultValue = "1") Integer page,
                            HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        PageHelper.startPage(page, Info.PAGE_SIZE);
        List<Goods> list = goodsService.getAll(bMap);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(list, Info.PAGE_SIZE);
        map.put("pageInfo", goodsPageInfo);
        /*通用方法*/
        commonMethod(map);
        session.setAttribute("p", 1);
        return "goods_list";
    }

    // 查询所有推荐饮品的信息
    @RequestMapping("showGoodsList_tj.do")
    public String showGoodsList_tj(@RequestParam(value="page",defaultValue = "1") Integer page,
                            HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        bMap.put("status","推荐");

        PageHelper.startPage(1, goodsService.getAll(bMap).size());
        List<Goods> list = goodsService.getAll(bMap);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(list, goodsService.getAll(bMap).size());
        map.put("pageInfo", goodsPageInfo);
        /*通用方法*/
        commonMethod(map);
        session.setAttribute("p", 2);
        return "goods_list";
    }

    // 搜索查询所有饮品的信息
    @RequestMapping("selectGoodsList.do")
    public String selectGoodsList(HttpSession session, ModelMap map, Goods goods) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        if (goods.getName()!=null&&!goods.getName().equals("")){
            bMap.put("name",goods.getName());
        }
        if (goods.getFid()!=null&&!goods.getFid().equals("")){
            bMap.put("fid",goods.getFid());
        }
        PageHelper.startPage(1, goodsService.getAll(bMap).size());
        List<Goods> list = goodsService.getAll(bMap);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(list, goodsService.getAll(bMap).size());
        map.put("pageInfo", goodsPageInfo);
        /*通用方法*/
        commonMethod(map);
        session.setAttribute("p", 10);
        return "goods_list";
    }

    @RequestMapping("showGoods.do")
    public String showGoods(ModelMap map, int id, HttpSession session) {
        map.put("goods",goodsService.getById(id));
        /*通用方法*/
        commonMethod(map);
        return "goodsx";
    }



}
