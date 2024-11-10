package com.controller.admin;

import com.entity.Ftype;
import com.service.FtypeService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FtypeController {
    @Resource
    private FtypeService ftypeService;

    public static final String TABLE_NAME = "分类";

    /**
     * ===后台分类管理===
     *
     * @return
     */

    // 添加分类
    @RequestMapping("admin/addType.do")
    public void addFtype(Ftype Ftype, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", Ftype.getName());
        System.out.println("uname===" + ftypeService.checkName(map));
        JSONObject obj = new JSONObject();
        if (ftypeService.checkName(map) != null) {
            obj.put("info", "ok");
        } else {
            com.entity.Ftype Ftype1 = new Ftype();
            Ftype1.setName(Ftype.getName());
            Ftype1.setBtype("分类");
            ftypeService.add(Ftype1);
            obj.put("info", "可以用！");

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



    /*处理修改分类*/
    @RequestMapping("admin/doUpdateFtype.do")
    public String doUpdateFtype(HttpServletRequest request, int id, ModelMap map) {
        map.put("ftype", ftypeService.getById(id));
        return "admin/ftype_update";
    }

    /*保存分类*/
    @RequestMapping("admin/updateTypeName.do")
    public void updateTypeName(Ftype Ftype, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", Ftype.getName());
        System.out.println("uname===" + ftypeService.checkName(map));
        System.out.println("btype===" + Ftype.getBtype());
        JSONObject obj = new JSONObject();
        com.entity.Ftype type = ftypeService.checkName(map);
        if (ftypeService.checkName(map) != null) {
            if (type.getName().equals(Ftype.getName())) {
                obj.put("info", "ok");
            } else {
                obj.put("info", "ng");
            }
        } else {
            com.entity.Ftype type1 = ftypeService.getById(Ftype.getId());
            type1.setName(Ftype.getName());
            type1.setBtype("分类");
            ftypeService.update(type1);
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


    // 分页查询分类信息的列表
    @RequestMapping("admin/ftypeList.do")
    public String ftypeList(@RequestParam(value = "page", defaultValue = "0") Integer page, ModelMap map,
                            HttpSession session) {

        Map<String, Object> bMap = new HashMap<>();
        List<Ftype> list = ftypeService.getAll(bMap);
        map.put("list", list);
        return "admin/ftype_list";
    }

    // 分页查询分类信息的列表--模糊查询
    @RequestMapping("admin/ftypeListSearch.do")
    public String ftypeListSearch(@RequestParam(value = "page", defaultValue = "0") Integer page, ModelMap map,
                                  HttpSession session, Ftype ftype) {
        Map<String, Object> bMap = new HashMap<>();
        if (ftype.getId() != null && !ftype.getId().equals("")) {
            bMap.put("id",ftype.getId());
        }
        if (ftype.getName() != null && !ftype.getName().equals("")) {
            bMap.put("name",ftype.getName());
        }
        if (ftype.getBtype() != null && !ftype.getBtype().equals("")) {
            bMap.put("btype",ftype.getBtype());
        }
        List<Ftype> list = ftypeService.getAll(bMap);
        map.put("list", list);
        return "admin/ftype_list";
    }

    /*删除分类*/
    @RequestMapping("admin/deleteFtype.do")
    public String deleteFtype(int id) {
        ftypeService.delete(id);
        return "redirect:ftypeList.do";
    }
}

