package com.controller.admin;

import com.entity.Users;
import com.entity.Users;
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
import java.util.List;
import java.util.Map;

@Controller
public class UsersController {
    @Resource
    private UsersService usersService;

    /**
     * ====后台用户表管理====
     *
     * @param session
     * @return
     */

    // 后台登录
    @RequestMapping("admin/alogin.do")
    public void checkLogin(Users user, HttpSession session, HttpServletResponse response) {
        Map<String, Object> u = new HashMap<String, Object>();
        System.out.println("name===" + user.getUname());
        System.out.println("pwd===" + user.getPwd());
        u.put("uname", user.getUname());
        u.put("utype", user.getUtype());
        u.put("pwd", user.getPwd());
        user = usersService.adminLogin(u);
        JSONObject obj = new JSONObject();
        if (user == null) {
            obj.put("info", "ng");
        } else {
//				将用户账号存到session中
            System.out.println("33==" + user);
            session.setAttribute("auser", user);
            System.out.println("登录验证成功！");
            obj.put("info", "ok");
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


    /*个人信息*/
    @RequestMapping("admin/showUserInfo.do")
    public String showUserInfo(ModelMap map, HttpSession session) {
        if (session.getAttribute("auser") == null) {
            return "login";
        }
        Users u = (Users) session.getAttribute("auser");
        map.put("users", usersService.getById(u.getId()));
        return "admin/user_update_person";
    }

    /*保存个人信息*/
    @RequestMapping("admin/updatePersonUser.do")
    public String updateUserInfo(ModelMap map, @RequestParam(value = "file", required = false) MultipartFile file,
                                 Users user, HttpSession session, String img, HttpServletRequest request) {
        if (img != null && !img.equals("zanwu.jpg")) {
            user.setImg(img);
        }
        usersService.update(user);
        map.put("users", usersService.getById(user.getId()));
        session.setAttribute("suc", "cc");
        return "redirect:showUserInfo.do";
    }

    // 验证用户名是否存在
    @RequestMapping("admin/checkName.do")
    public void checkName(Users user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + usersService.checkName(map));
        JSONObject obj = new JSONObject();
        if (usersService.checkName(map) != null) {
            obj.put("info", "ng");
        } else {
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


    // 添加用户表
    @RequestMapping("admin/addUsers.do")
    public String addUsers(@RequestParam(value = "file", required = false) MultipartFile file,
                          Users users, HttpSession session, String img, HttpServletRequest request) {
        img = Info.fileUpload(file, request, img);
        users.setImg(img);
        Timestamp time = new Timestamp(System.currentTimeMillis());
        users.setPubtime(time.toString().substring(0, 19));
        usersService.add(users);
        session.setAttribute("info", "添加成功！");
        return "admin/success";
    }

    // 处理更新用户表的信息
    @RequestMapping("admin/doUpdateUsers.do")
    public String doUpdateUsers(ModelMap map, int id) {
        System.out.println("id==" + id);
        map.put("users", usersService.getById(id));
        return "admin/users_update";
    }

    // 更新用户表的信息
    @RequestMapping("admin/updateUsers.do")
    public String updateUsers(@RequestParam(value = "file", required = false) MultipartFile file,
                             Users users, HttpSession session, String img, HttpServletRequest request) {
        img=Info.fileUpload(file,request,img);
        if (img != null ) {
            users.setImg(img);
        }
        usersService.update(users);
        session.setAttribute("info", "更新成功！");
        return "admin/success";
    }



    // 查询所有用户表的信息
    @RequestMapping("admin/usersList.do")
    public String usersList(HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        bMap.put("utype","顾客");
        List<Users> list = usersService.getAll(bMap);
        map.put("list", list);
        session.setAttribute("p", 1);
        return "admin/users_list";
    }


    @RequestMapping("admin/usersList_yg.do")
    public String usersList_yg(HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        bMap.put("utype","员工");
        List<Users> list = usersService.getAll(bMap);
        map.put("list", list);
        session.setAttribute("p", 1);
        return "admin/users_list_yg";
    }

    //删除用户表
    @RequestMapping("admin/deleteUsers.do")
    public String deleteUsers(int id, HttpSession session) {
        usersService.delete(id);
        session.setAttribute("info", "删除成功！");
        return "admin/success";
    }





    // 后台注销登录
    @RequestMapping("admin/loginOut.do")
    public String adminLoginOut(HttpSession session) {
        session.removeAttribute("auser");
        return "admin/login";
    }



}
