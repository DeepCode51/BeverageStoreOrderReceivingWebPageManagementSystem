package com.controller.admin;

import com.entity.Fshop;
import com.entity.Goods;
import com.entity.Orders;
import com.entity.Users;
import com.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrdersController {
    @Resource
    private OrdersService ordersService;
    @Resource
    private FtypeService ftypeService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private UsersService usersService;

    @Resource
    private FshopService fshopService;

    public static final String TABLE_NAME = "订单";



    /*通用方法*/
    public void commonMethod(ModelMap map){
        map.put("tlist",ftypeService.getAll(null));
        map.put("glist",goodsService.getAll(null));
        map.put("ulist",usersService.getAll(null));
    }
    /**
     * ===后台订单管理===
     *
     * @param request
     * @param session
     * @return
     */

    // 添加订单
    @RequestMapping("admin/addOrders.do")
    public String addOrders(HttpServletRequest request, Orders orders, HttpSession session) {
        Users user = (Users) session.getAttribute("auser");
        if (user==null){
            return "admin/login";
        }else {
        ordersService.add(orders);
        return "redirect:ordersList.do";
        }
    }


    /*处理修改订单*/
    @RequestMapping("admin/doUpdateOrders.do")
    public String doUpdateOrders(HttpServletRequest request, int id, ModelMap map) {
        map.put("orders", ordersService.getById(id));
        return "admin/orders_update";
    }

    /*保存订单*/
    @RequestMapping("admin/updateOrders.do")
    public String updateOrders(HttpServletRequest request, Orders orders, HttpSession session) {
        ordersService.update(orders);
        return "redirect:ordersList.do";
    }


    // 分页查询订单信息的列表
    @RequestMapping("admin/ordersList.do")
    public String ordersList(@RequestParam(value = "page", defaultValue = "0") Integer page, ModelMap map,
                             HttpSession session) {

        Map<String, Object> bMap = new HashMap<>();
        List<Orders> list = ordersService.getAll(bMap);
        map.put("list", list);
        /*通用方法*/
        commonMethod(map);
        return "admin/orders_list";
    }



    /*删除订单*/
    @RequestMapping("admin/deleteOrders.do")
    public String deleteOrders(int id) {
        ordersService.delete(id);
        return "redirect:ordersList.do";
    }

    /*订单详情*/
    @RequestMapping("admin/showOrderDetail.do")
    public String showOrderDetail(ModelMap map,int id) {
        Orders orders = ordersService.getById(id);
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("oid",orders.getOno());
        List<Fshop> bList = fshopService.getAll(bMap);
        /*通用方法*/
        commonMethod(map);
        map.put("list",bList);
        map.put("order",orders);
        map.put("user",usersService.getById(orders.getUid()));
        return "admin/order_detail";
    }


    /*配置*/
    @RequestMapping("admin/doAddOrders_pz.do")
    public String doAddOrders_pz(ModelMap map,int id) {
        Orders orders = ordersService.getById(id);
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("oid",orders.getOno());
        List<Fshop> bList = fshopService.getAll(bMap);
        /*通用方法*/
        commonMethod(map);
        map.put("goods",goodsService.getById(orders.getFid()));
        map.put("order",orders);
        map.put("user",usersService.getById(orders.getUid()));
        return "admin/order_pz";
    }
    @RequestMapping("admin/addOrders_pz.do")
    public String addOrders_pz(Orders orders) {
        orders.setStatus("待支付差价");
        ordersService.update(orders);
        return "redirect:ordersList.do";
    }

    /*配送*/
    @RequestMapping("admin/forder_ps.do")
    public String forder_ps(int id) {
        Orders orders = ordersService.getById(id);
        orders.setStatus("配送中");
        ordersService.update(orders);
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("oid",orders.getOno());
        List<Fshop> bList = fshopService.getAll(bMap);
        for (Fshop ss : bList) {
            ss.setStatus("配送中");
            ss.setId(ss.getId());
            fshopService.update(ss);
        }
        return "redirect:ordersList.do";
    }

    /*完成*/
    @RequestMapping("admin/orderQueRen.do")
    public String orderQueRen(int id) {
        Orders orders = ordersService.getById(id);
        orders.setStatus("配送完成");
        ordersService.update(orders);
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("oid",orders.getOno());
        List<Fshop> bList = fshopService.getAll(bMap);
        for (Fshop ss : bList) {
            ss.setStatus("配送完成");
            ss.setId(ss.getId());
            fshopService.update(ss);
        }
        return "redirect:ordersList.do";
    }

    /*确认退货*/
    @RequestMapping("admin/queRenTuiHuo.do")
    public String queRenTuiHuo(int id) {
        Orders orders = ordersService.getById(id);
        orders.setStatus("已退货，退款");
        Users users = usersService.getById(orders.getUid());
        users.setMoney(users.getMoney()+orders.getZprice());
        usersService.update(users);
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("oid",orders.getOno());
        List<Fshop> bList = fshopService.getAll(bMap);
        for (Fshop ss : bList) {
            ss.setStatus("已退货，退款");
            ss.setId(ss.getId());
            Goods gg = goodsService.getById(ss.getFid());
            gg.setXnum(gg.getXnum()-ss.getNum());
            gg.setId(ss.getFid());
            goodsService.update(gg);
            fshopService.update(ss);
        }
        ordersService.update(orders);
        return "redirect:ordersList.do";
    }


    /*拒绝*/
    @RequestMapping("admin/juJue.do")
    public String juJue(int id) {
        Orders orders = ordersService.getById(id);
        orders.setStatus("配送中");
        ordersService.update(orders);
        Map<String,Object> bMap = new HashMap<>();
        bMap.put("oid",orders.getOno());
        List<Fshop> bList = fshopService.getAll(bMap);
        for (Fshop ss : bList) {
            ss.setStatus("配送中");
            ss.setId(ss.getId());
            fshopService.update(ss);
        }
        return "redirect:ordersList.do";
    }
}

