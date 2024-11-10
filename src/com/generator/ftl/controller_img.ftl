package com.controller.admin;

import com.entity.${Domain};
import com.entity.Users;
import com.service.${Domain}Service;
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
public class ${Domain}Controller {
    @Resource
    private ${Domain}Service ${domain}Service;

    /**
     * ====后台${tableNameCn}管理====
     *
     * @param ${domain}
     * @param session
     * @return
     */




    // 添加${tableNameCn}
    @RequestMapping("admin/add${Domain}.do")
    public String add${Domain}(@RequestParam(value = "file", required = false) MultipartFile file,
                          ${Domain} ${domain}, HttpSession session, String img, HttpServletRequest request) {
        img = Info.fileUpload(file, request, img);
        ${domain}.setImg(img);
        Timestamp time = new Timestamp(System.currentTimeMillis());
        ${domain}.setPubtime(time.toString().substring(0, 19));
        ${domain}Service.add(${domain});
        session.setAttribute("info", "添加成功！");
        return "admin/success";
    }

    // 处理更新${tableNameCn}的信息
    @RequestMapping("admin/doUpdate${Domain}.do")
    public String doUpdate${Domain}(ModelMap map, int id) {
        System.out.println("id==" + id);
        map.put("${domain}", ${domain}Service.getById(id));
        return "admin/${domain}_update";
    }

    // 更新${tableNameCn}的信息
    @RequestMapping("admin/update${Domain}.do")
    public String update${Domain}(@RequestParam(value = "file", required = false) MultipartFile file,
                             ${Domain} ${domain}, HttpSession session, String img, HttpServletRequest request) {
        img=Info.fileUpload(file,request,img);
        if (img != null ) {
            ${domain}.setImg(img);
        }
        ${domain}Service.update(${domain});
        session.setAttribute("info", "更新成功！");
        return "admin/success";
    }



    // 查询所有${tableNameCn}的信息
    @RequestMapping("admin/${domain}List.do")
    public String ${domain}List(HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        List<${Domain}> list = ${domain}Service.getAll(bMap);
        map.put("list", list);
        session.setAttribute("p", 1);
        return "admin/${domain}_list";
    }


    //删除${tableNameCn}
    @RequestMapping("admin/delete${Domain}.do")
    public String delete${Domain}(int id, HttpSession session) {
        ${domain}Service.delete(id);
        session.setAttribute("info", "删除成功！");
        return "admin/success";
    }




}
