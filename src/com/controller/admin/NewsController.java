package com.controller.admin;

import com.entity.News;
import com.entity.Users;
import com.service.NewsService;
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
public class NewsController {
    @Resource
    private NewsService newsService;

    /**
     * ====后台新闻管理====
     *
     * @param news
     * @param session
     * @return
     */




    // 添加新闻
    @RequestMapping("admin/addNews.do")
    public String addNews(@RequestParam(value = "file", required = false) MultipartFile file,
                          News news, HttpSession session, String img, HttpServletRequest request) {
        img = Info.fileUpload(file, request, img);
        news.setImg(img);
        Timestamp time = new Timestamp(System.currentTimeMillis());
        news.setPubtime(time.toString().substring(0, 19));
        newsService.add(news);
        session.setAttribute("info", "添加成功！");
        return "redirect:newsList.do";
    }

    // 处理更新新闻的信息
    @RequestMapping("admin/doUpdateNews.do")
    public String doUpdateNews(ModelMap map, int id) {
        System.out.println("id==" + id);
        map.put("news", newsService.getById(id));
        return "admin/news_update";
    }

    /*查看*/
    @RequestMapping("admin/news_look.do")
    public String news_look(ModelMap map, int id) {
        System.out.println("id==" + id);
        map.put("news", newsService.getById(id));
        return "admin/news_look";
    }

    // 更新新闻的信息
    @RequestMapping("admin/updateNews.do")
    public String updateNews(@RequestParam(value = "file", required = false) MultipartFile file,
                             News news, HttpSession session, String img, HttpServletRequest request) {
        img=Info.fileUpload(file,request,img);
        if (img != null ) {
            news.setImg(img);
        }
        newsService.update(news);
        session.setAttribute("info", "更新成功！");
        return "redirect:newsList.do";
    }



    // 查询所有新闻的信息
    @RequestMapping("admin/newsList.do")
    public String newsList(HttpSession session, ModelMap map) {
        Map<String, Object> bMap = new HashMap<String, Object>();
        List<News> list = newsService.getAll(bMap);
        map.put("list", list);
        session.setAttribute("p", 1);
        return "admin/news_list";
    }


    //删除新闻
    @RequestMapping("admin/deleteNews.do")
    public String deleteNews(int id, HttpSession session) {
        newsService.delete(id);
        session.setAttribute("info", "删除成功！");
        return "redirect:newsList.do";
    }




}
