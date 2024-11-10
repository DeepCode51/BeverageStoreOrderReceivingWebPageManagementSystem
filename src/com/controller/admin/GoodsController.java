package com.controller.admin;

import com.entity.Goods;
import com.entity.Users;
import com.service.FtypeService;
import com.service.GoodsService;
import com.util.Info;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class GoodsController {
    @Resource
    private GoodsService goodsService;
    @Resource
    private FtypeService ftypeService;

    /*通用方法*/
    public void commonMethod(ModelMap map){
        map.put("tlist",ftypeService.getAll(null));
    }

    /**
     * ====后台饮品管理====
     *
     * @return
     */

    // 处理更新饮品的信息
    @RequestMapping("admin/doAddGoods.do")
    public String doAddGoods(ModelMap map) {
        /*通用方法*/
        commonMethod(map);
        return "admin/goods_add";
    }



    // 添加饮品
    @RequestMapping("admin/addGoods.do")
    public String addGoods(@RequestParam(value = "file", required = false) MultipartFile file,
                          Goods goods, HttpSession session, String img, HttpServletRequest request) {
        Users users = (Users) session.getAttribute("auser");
        if (users==null){
            return "admin/login";
        }else {
            img = Info.fileUpload(file, request, img);
            goods.setImg(img);
            goods.setUid(users.getId()+"");
            Timestamp time = new Timestamp(System.currentTimeMillis());
            goods.setPubtime(time.toString().substring(0, 19));
            goodsService.add(goods);
            session.setAttribute("info", "添加成功！");
            return "redirect:goodsList.do";
        }
    }

    // 处理更新饮品的信息
    @RequestMapping("admin/doUpdateGoods.do")
    public String doUpdateGoods(ModelMap map, int id) {
        System.out.println("id==" + id);
        /*通用方法*/
        commonMethod(map);
        map.put("goods", goodsService.getById(id));
        return "admin/goods_update";
    }

    // 更新饮品的信息
    @RequestMapping("admin/updateGoods.do")
    public String updateGoods(@RequestParam(value = "file", required = false) MultipartFile file,
                             Goods goods, HttpSession session, String img, HttpServletRequest request) {
        img=Info.fileUpload(file,request,img);
        if (img != null ) {
            goods.setImg(img);
        }
        goodsService.update(goods);
        session.setAttribute("info", "更新成功！");
        return "redirect:goodsList.do";
    }



    // 查询所有饮品的信息
    @RequestMapping("admin/goodsList.do")
    public String goodsList(HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        List<Goods> list = goodsService.getAll(bMap);
        map.put("list", list);
        session.setAttribute("p", 1);
        /*通用方法*/
        commonMethod(map);
        return "admin/goods_list";
    }


    //删除饮品
    @RequestMapping("admin/deleteGoods.do")
    public String deleteGoods(int id, HttpSession session) {
        goodsService.delete(id);
        session.setAttribute("info", "删除成功！");
        return "redirect:goodsList.do";
    }




}
