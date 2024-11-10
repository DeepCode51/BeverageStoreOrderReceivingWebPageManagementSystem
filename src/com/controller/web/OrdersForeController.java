package com.controller.web;

import com.entity.Fshop;
import com.entity.Goods;
import com.entity.Orders;
import com.entity.Users;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.*;
import com.util.Info;
import com.util.PageBean;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrdersForeController {
	@Resource
	private OrdersService ordersService;
	@Resource
	private UsersService usersService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private FtypeService typeService;
    @Resource
    private FshopService fshopService;

    /*通用方法*/
    public void commonMethod(ModelMap map){
        map.put("plist", goodsService.getAll(null));
        map.put("glist", goodsService.getAll(null));
        map.put("ulist", usersService.getAll(null));
        map.put("tlist", typeService.getAll(null));
    }


	// 购买
	@RequestMapping("addOrders.do")
	public String addBuy(ModelMap map, HttpServletRequest request, Orders orders, HttpSession session) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Users users = usersService.getById(user.getId());
			if (user.getMoney()==null||orders.getZprice()>users.getMoney()) {
				session.setAttribute("info", "余额不足，请充值！");
				return "redirect:doAddMoney.do";
			} else {
                String ono = Info.getID();
                System.out.println("订单号rr===" + ono);
                Map<String, Object> sMap = new HashMap<String, Object>();
                Fshop fshop = new Fshop();
                sMap.put("uid",users.getId());
                sMap.put("status","购物车");
                List<Fshop> slist = fshopService.getAll(sMap);
                for (Fshop fs : slist) {
                    Fshop ff = fshopService.getById(fs.getId());
                    Goods gg = goodsService.getById(ff.getFid());
                    if(gg.getXnum()!=null){
                        gg.setXnum(gg.getXnum()+ff.getNum());
                    }else{
                        gg.setXnum(ff.getNum());
                    }
                    gg.setId(ff.getFid());
                    goodsService.update(gg);
                    ff.setStatus("已支付，待配送");
                    ff.setId(fs.getId());
                    ff.setOid(ono);
                    fshopService.update(ff);
                    Orders forder = new Orders();
                    forder.setStatus("已支付，待配送");
                    forder.setMark(orders.getMark());
                    forder.setBtype(orders.getBtype());
                    forder.setSid(Integer.parseInt(gg.getUid()));
                    forder.setAmount(fs.getNum());
                    Double zprice2 = fs.getNum()*gg.getPrice();
                    forder.setZprice(zprice2);
                    forder.setFid(gg.getId());
                    forder.setOno(ono);
                    forder.setPubtime(time.toString().substring(0, 10));
                    forder.setStime(time.toString().substring(0, 19));
                    forder.setUid(users.getId());
                    forder.setOtype("单个订单");
                    ordersService.add(forder);
                }
                Double dd = users.getMoney();
                Double dou = dd - orders.getZprice();
                users.setMoney(dou);
                usersService.update(users);
				return "redirect:myOrdersList.do";
			}
		}
	}



    // 修改购物车的数量
    @RequestMapping("updateShopNum.do")
    public String updateShopNum(Fshop fshop,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return "login";
        }else {
            Fshop shop = fshopService.getById(fshop.getId());
            shop.setNum(fshop.getNum());
            fshopService.update(shop);
            return "redirect:showShop.do";
        }
    }

	/*支付差价 */
    @RequestMapping("zhiFu.do")
    public String zhiFu(ModelMap map, HttpServletRequest request, int id, HttpSession session) {
        Timestamp time = new Timestamp(System.currentTimeMillis());
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "login";
        } else {
            Users users = usersService.getById(user.getId());
            Orders orders = ordersService.getById(id);
            if (user.getMoney()==null||orders.getBprice()>users.getMoney()) {
                session.setAttribute("info", "余额不足，请充值！");
                return "redirect:doAddMoney.do";
            } else {
                orders.setStatus("已支付，待配送");
                ordersService.update(orders);
                Double dd = users.getMoney();
                Double dou = dd - orders.getZprice();
                users.setMoney(dou);
                usersService.update(users);
                return "redirect:myOrdersList.do";
            }
        }
    }


	// 分页查询顾客预定信息
	@RequestMapping("myOrdersList.do")
	public String myOrdersList(@RequestParam(value = "page", defaultValue = "1") Integer page, ModelMap map,
                               HttpSession session) {
		Users u = (Users) session.getAttribute("user");
		if (u == null || u.equals("")) {
			return "login";
		} else {
			Map<String, Object> bMap = new HashMap<String, Object>();
            bMap.put("uid", u.getId());
            PageHelper.startPage(page,Info.PAGE_SIZE);
			List<Orders> list = ordersService.getAll(bMap);
            PageInfo<Orders> pageInfo = new PageInfo<>(list,Info.PAGE_SIZE);
			map.put("pageInfo", pageInfo);
            /*通用方法*/
            commonMethod(map);
			return "myOrdersList";
		}
	}

	

		/*删除*/
	@RequestMapping("deleteOrdersF.do")
	public String deleteOrdersF(int id) {
		ordersService.delete(id);
		return "redirect:myOrdersList.do";
	}

    /*退货*/
    @RequestMapping("tuiHuo.do")
    public String tuiHuo(int id,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return "login";
        }else {
            Orders orders = ordersService.getById(id);
            orders.setStatus("待确认退货");
            ordersService.update(orders);
            return "redirect:myOrdersList.do";
        }
    }

//    订单详情查看
    @RequestMapping("showOrderDetail.do")
    public String showOrderDetail(ModelMap map,int id,HttpSession session) {
        Orders orders = ordersService.getById(id);
        map.put("order",orders);
        map.put("user",usersService.getById(orders.getUid()));
        map.put("goods",goodsService.getById(orders.getFid()));
        /*通用方法*/
        commonMethod(map);
        return "order_detail";
    }


    /*购物车*/
    @RequestMapping("addShop.do")
    public String addShop(ModelMap map,int fid,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return "login";
        }else {
            Map<String,Object> bMap = new HashMap<>();
            bMap.put("uid",users.getId());
            bMap.put("fid",fid);
            bMap.put("status","购物车");
            int count = fshopService.getCount(bMap);
            if (count > 0) {
                Fshop shop1 = fshopService.getAll(bMap).get(0);
                shop1.setNum(shop1.getNum() + 1);
                fshopService.update(shop1);
            } else {
                Goods goods = goodsService.getById(fid);
                Fshop fshop1 = new Fshop();
                fshop1.setUid(users.getId());
                fshop1.setFid(fid);
                fshop1.setSid(Integer.parseInt(goods.getUid()));
                fshop1.setStatus("购物车");
                fshop1.setPubtime(new Timestamp(System.currentTimeMillis()).toString().substring(0, 19));
                fshop1.setNum(1);
                fshopService.add(fshop1);
            }
            return "redirect:showShop.do";
        }
    }

    /*显示购物车*/
    @RequestMapping("showShop.do")
    public String showShop(ModelMap map,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return "login";
        }else {
            Map<String,Object> bMap = new HashMap<>();
            bMap.put("uid",users.getId());
            bMap.put("status","购物车");
            map.put("list",fshopService.getAll(bMap));
            map.put("user",usersService.getById(users.getId()));
            /*通用方法*/
            commonMethod(map);
            return "car_list";
        }
    }

    /*删除购物车*/
    @RequestMapping("deleteShop.do")
    public String deleteOrders(int id,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return "login";
        }else {
            fshopService.delete(id);
            return "redirect:showShop.do";
        }
    }

    // 完成
    @RequestMapping("wanChen.do")
    public String wanChen(ModelMap map,int id,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return  "login.jsp";
        }else {
            Orders forder = ordersService.getById(id);
            forder.setStatus("完成");
            forder.setStime(new Timestamp(System.currentTimeMillis()).toString().substring(0,19));
            ordersService.update(forder);
            /*通用方法*/
            commonMethod(map);
            return "redirect:myOrdersList.do";
        }
    }


    // 查看订单详情
    @RequestMapping("orderx.do")
    public String orderx(ModelMap map,int id,HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return  "login.jsp";
        }else {
            Orders forder = ordersService.getById(id);
            Users users1 = usersService.getById(forder.getUid());
            Fshop fshop = new Fshop();
            Map<String,Object> bMap = new HashMap<>();
            bMap.put("oid",forder.getOno());
            map.put("list",fshopService.getAll(bMap));
            map.put("orders",forder);
            map.put("user",users1);
            /*通用方法*/
            commonMethod(map);
            return  "orderx";
        }
    }





}
