package com.MyBlog.controller;


import com.MyBlog.pojo.Blog;
import com.MyBlog.pojo.Category;
import com.MyBlog.pojo.Info;
import com.MyBlog.service.BlogService;
import com.MyBlog.service.CategoryService;
import com.MyBlog.service.InfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private InfoService infoService;

    @RequestMapping("/list")
    public ModelAndView list(ModelAndView modelAndView,int id,int pageNum){
        int pageSize = 5;

        List<Category> categories = categoryService.findAll();
        modelAndView.addObject("categories",categories);
        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        List<Blog> blogs = new ArrayList<>();
        int pages = 1;
        if(id != 0){
            blogs = blogService.pageFindByCategoryId(id,pageNum,pageSize);
            PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
            pages = pageInfo.getPages();
        }
        modelAndView.addObject("blogs",blogs);
        modelAndView.addObject("id",id);
        modelAndView.addObject("pageNum",pageNum);
        modelAndView.addObject("pages",pages);

        modelAndView.setViewName("types");
        return modelAndView;
    }
}
