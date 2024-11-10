package com.controller.web;

import com.entity.Users;
import com.service.FtypeService;
import com.service.OrdersService;
import com.service.UsersService;
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
import java.util.Map;

@Controller
public class UsersForeController {
    @Resource
    private UsersService userService;
    @Resource
    private OrdersService ordersService;
    @Resource
    private FtypeService ftypeService;

    /*处理充值*/
    @RequestMapping("doAddMoney.do")
    public String doAddChongZhi(HttpSession session, ModelMap map) {
        Users u = (Users) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            map.put("user", userService.getById(u.getId()));
            return "updateMoney";
        }
    }


    /*充值*/
    @RequestMapping("chongZhi.do")
    public String chongZhi(HttpSession session, ModelMap map, Users users) {
        Users u = (Users) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Users user = userService.getById(users.getId());
            if (user.getMoney().equals("") || user.getMoney() == null) {
                user.setMoney(users.getMoney());
            } else {
                user.setMoney(user.getMoney() + users.getMoney());
            }
            userService.update(user);
            user = userService.getById(u.getId());
            session.setAttribute("info", "充值成功！余额是：" + user.getMoney());
            return "success";
        }
    }


    // 前台登录
    @RequestMapping("login.do")
    public void checkAdminLogin(Users user, HttpServletResponse response, HttpSession session) {
        JSONObject obj = new JSONObject();
        Map<String, Object> uMap = new HashMap<>();
        uMap.put("uname", user.getUname());
        uMap.put("pwd", user.getPwd());
        uMap.put("utype", "顾客");
        Users users = userService.adminLogin(uMap);
        if (users != null) {
            session.setAttribute("user", users);
            obj.put("info", "ok");
        } else {
            obj.put("info", "ng");
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }

    }


    // 前台忘记密码
    @RequestMapping("forPwd.do")
    public String forPwd(Users user, ModelMap map) {
        Map<String, Object> umap = new HashMap<String, Object>();
        umap.put("uname", user.getUname());
        Users u = userService.checkName(umap);
        if (u == null || u.equals("")) {
            return "error_uname";
        } else {
            map.put("user", u);
            return "fore_losspwd";
        }

    }

    // 处理修改个人信息
    @RequestMapping("showInfo.do")
    public String showInfo(HttpSession session, ModelMap map) {
        Users u = (Users) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            map.put("user", userService.getById(u.getId()));
            return "user_update";
        }
    }

    // 处理修改个人信息
    @RequestMapping("addShowInfo.do")
    public String addShowInfo(@RequestParam(value = "file", required = false) MultipartFile file,
                              HttpServletRequest request, HttpSession session, ModelMap map, Users user, String img) {
        img = Info.fileUpload(file, request, img);
        if (img != null && !img.equals("zanwu.jpg")) {
            user.setImg(img);
        }
        userService.update(user);
        session.setAttribute("info","修改成功！");
        return "success";
    }


    // 前台注销登录
    @RequestMapping("loginOut.do")
    public String loginOut(HttpSession session) {
        session.removeAttribute("user");
        session.removeAttribute("p");
        return "login";
    }


    // 验证用户名是否存在
    @RequestMapping("checkName.do")
    public void checkReg(Users user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + userService.checkName(map));
        JSONObject obj = new JSONObject();
        if (userService.checkName(map) != null) {
            System.out.println("uname233333333333===");
            obj.put("info", "ng");
        } else {
            System.out.println("uname255555555555555===");
            obj.put("info", "用户名可以用！");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    @RequestMapping("checkPass.do")
    public void checkPass(Users user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + userService.checkName(map));
        JSONObject obj = new JSONObject();
        if (userService.checkName(map) != null) {
            obj.put("info", userService.checkName(map).getPwd());
        } else {
            obj.put("info", "ng");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    @RequestMapping("reg.do")
    public String addReg(@RequestParam(value = "file", required = false) MultipartFile file,
                         HttpServletRequest request, Users user, HttpSession session, String img) {
        img = Info.fileUpload(file, request, img);
        user.setImg(img);
        user.setMoney(0.0);
        user.setUtype("顾客");
        Timestamp time = new Timestamp(System.currentTimeMillis());
        user.setPubtime(time.toString().substring(0, 19));
        userService.add(user);
        return "login";
    }


}
