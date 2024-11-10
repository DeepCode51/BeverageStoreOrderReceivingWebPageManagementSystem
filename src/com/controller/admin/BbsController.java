package com.controller.admin;

import com.entity.Bbs;
import com.entity.Users;
import com.service.BbsService;
import com.service.UsersService;
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
public class BbsController {
    @Resource
    private BbsService bbsService;

    @Resource
    private UsersService usersService;

    public static final String TABLE_NAME = "投诉及建议表";

    /**
     * ===后台投诉及建议表管理===
     *
     * @param request
     * @param session
     * @return
     */

    // 添加投诉及建议表
    @RequestMapping("admin/addBbs.do")
    public String addBbs(HttpServletRequest request, Bbs bbs, HttpSession session) {
        Users user = (Users) session.getAttribute("auser");
        if (user==null){
            return "admin/login";
        }else {
        bbsService.add(bbs);
        return "redirect:bbsList.do";
        }
    }


    /*处理修改投诉及建议表*/
    @RequestMapping("admin/doUpdateBbs.do")
    public String doUpdateBbs(HttpServletRequest request, int id, ModelMap map) {
        map.put("bbs", bbsService.getById(id));
        return "admin/bbs_update";
    }

    /*保存投诉及建议表*/
    @RequestMapping("admin/updateBbs.do")
    public String updateBbs(HttpServletRequest request, Bbs bbs, HttpSession session) {
        bbs.setStatus("已回复");
        bbs.setEtime(new Timestamp(System.currentTimeMillis()).toString().substring(0,19));
        bbsService.update(bbs);
        return "redirect:bbsList.do";
    }


    // 分页查询投诉及建议表信息的列表
    @RequestMapping("admin/bbsList.do")
    public String bbsList(@RequestParam(value = "page", defaultValue = "0") Integer page, ModelMap map,
                            HttpSession session) {

        Map<String, Object> bMap = new HashMap<>();
        List<Bbs> list = bbsService.getAll(bMap);
        map.put("list", list);
        map.put("ulist",usersService.getAll(null));
        return "admin/bbs_list";
    }


    /*删除投诉及建议表*/
    @RequestMapping("admin/deleteBbs.do")
    public String deleteBbs(int id) {
        bbsService.delete(id);
        return "redirect:bbsList.do";
    }
}

