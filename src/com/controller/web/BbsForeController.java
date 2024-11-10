package com.controller.web;

import com.entity.Bbs;
import com.entity.Users;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.BbsService;
import com.util.Info;
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
public class BbsForeController {
    @Resource
    private BbsService bbsService;

    public static final String TABLE_NAME = "投诉及建议表";

    /**
     * ===前台投诉及建议表管理===
     *
     * @param request
     * @param session
     * @return
     */

    // 添加投诉及建议表
    @RequestMapping("addBbs.do")
    public String addBbs(HttpServletRequest request, Bbs bbs, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (user==null){
            return "login";
        }else {
            bbs.setUid(user.getId());
            bbs.setBtype("投诉及建议");
            bbs.setStatus("待回复");
            bbs.setPubtime(new Timestamp(System.currentTimeMillis()).toString().substring(0,19));
        bbsService.add(bbs);
        return "redirect:bbsList.do";
        }
    }


    /*处理修改投诉及建议表*/
    @RequestMapping("doUpdateBbs.do")
    public String doUpdateBbs(HttpServletRequest request, int id, ModelMap map) {
        map.put("bbs", bbsService.getById(id));
        return "bbs_update";
    }

    /*保存投诉及建议表*/
    @RequestMapping("updateBbs.do")
    public String updateBbs(HttpServletRequest request, Bbs bbs, HttpSession session) {
        bbsService.update(bbs);
        return "redirect:bbsList.do";
    }


    // 分页查询投诉及建议表信息的列表
    @RequestMapping("bbsList.do")
    public String bbsList(@RequestParam(value = "page", defaultValue = "1") Integer page, ModelMap map,
                            HttpSession session) {
        Users users = (Users) session.getAttribute("user");
        if (users==null){
            return "login";
        }else {
            Map<String, Object> bMap = new HashMap<>();
            bMap.put("uid",users.getId());
            PageHelper.startPage(page, Info.PAGE_SIZE);
            List<Bbs> list = bbsService.getAll(bMap);
            PageInfo<Bbs> pageInfo = new PageInfo<>(list,Info.PAGE_SIZE);
            map.put("pageInfo", pageInfo);
            return "bbs_list";
        }

    }


    /*删除投诉及建议表*/
    @RequestMapping("deleteBbs.do")
    public String deleteBbs(int id) {
        bbsService.delete(id);
        return "redirect:bbsList.do";
    }
}

