package com.MyBlog.controller;

import com.MyBlog.pojo.Blog;
import com.MyBlog.pojo.Category;
import com.MyBlog.pojo.Comment;
import com.MyBlog.pojo.Info;
import com.MyBlog.service.BlogService;
import com.MyBlog.service.CategoryService;
import com.MyBlog.service.CommentService;
import com.MyBlog.service.InfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import tk.mybatis.mapper.annotation.RegisterMapper;

import javax.jws.WebParam;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;
    @Autowired
    private InfoService infoService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/list")
    public ModelAndView list(int pageNum,ModelAndView modelAndView){
        int pageSize = 5;

        Info info = infoService.getInfo();
        info.setAccessNum(info.getAccessNum()+1);
        infoService.update(info);
        modelAndView.addObject("info",info);
        modelAndView.addObject("pageNum",pageNum);
        List<Blog> blogs = blogService.pageList(pageNum,pageSize);
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
        int pages = pageInfo.getPages();
        modelAndView.addObject("pages",pages);
        modelAndView.addObject("blogs",blogs);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/show")
    public ModelAndView show(int id,ModelAndView modelAndView){
        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        Blog blog = blogService.findById(id);
        modelAndView.addObject("blog",blog);
        blogService.addViewNumber(id);
        List<Comment> comments = commentService.findMom(id);
        modelAndView.addObject("mcomments",comments);
        List<List<Comment>> ncomments = new ArrayList<List<Comment>>();
        for(Comment comment : comments){
            List<Comment> temp = commentService.findSon(comment.getId(),id);
            ncomments.add(temp);
        }
        modelAndView.addObject("ncomments",ncomments);
        modelAndView.addObject("id",id);

        modelAndView.setViewName("blog");
        blogService.addViewNumber(id);
        return modelAndView;
    }

    @RequestMapping("/search")
    public ModelAndView search(int pageNum,String str,ModelAndView modelAndView){
        int pageSize = 5;

        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        List<Blog> blogs = blogService.pageSearch(str,pageNum,pageSize);
        modelAndView.addObject("blogs",blogs);
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
        int pages = pageInfo.getPages();
        modelAndView.addObject("pages",pages);
        modelAndView.addObject("pageNum",pageNum);
        modelAndView.addObject("str",str);

        modelAndView.setViewName("search");
        return modelAndView;
    }



}
