package com.MyBlog.controller;

import com.MyBlog.pojo.Blog;
import com.MyBlog.pojo.Category;
import com.MyBlog.pojo.Info;
import com.MyBlog.service.BlogService;
import com.MyBlog.service.CategoryService;
import com.MyBlog.service.InfoService;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class adminController {
    @Autowired
    private BlogService blogService;
    @Autowired
    private InfoService infoService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/blogs")
    public ModelAndView admin_blogs(String str, int category, int pageNum, ModelAndView modelAndView){
        int pageSize = 5;

        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        List<Blog> blogs = null;
        if(category == 0){
            blogs = blogService.pageSearch(str,pageNum,pageSize);
        }else{
            blogs = blogService.pageFindBySearchAndCategory(str,category,pageNum,pageSize);
        }
        modelAndView.addObject("blogs",blogs);

        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
        int pages = pageInfo.getPages();
        modelAndView.addObject("pages",pages);
        modelAndView.addObject("pageNum",pageNum);
        modelAndView.addObject("str",str);
        List<Category> categories = categoryService.findAll();
        modelAndView.addObject("categories",categories);
        modelAndView.addObject("cid",category);

        modelAndView.setViewName("admin/blogs");
        return modelAndView;
    }

    @RequestMapping("/blog/edit")
    public ModelAndView edit(int id,ModelAndView modelAndView){
        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        Blog blog = blogService.findById(id);
        List<Category> categories = categoryService.findAll();
        modelAndView.addObject("categories",categories);
        modelAndView.addObject("blog",blog);
        modelAndView.addObject("type",1);

        modelAndView.setViewName("admin/blogs-input");
        return modelAndView;
    }

    @RequestMapping("/blog/input")
    public ModelAndView input(ModelAndView modelAndView){
        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        List<Category> categories = categoryService.findAll();
        modelAndView.addObject("categories",categories);
        modelAndView.addObject("type",2);
        modelAndView.setViewName("admin/blogs-input");
        return modelAndView;
    }

    @RequestMapping("/blog/update")
    public String update(Blog blog){
        blogService.update(blog);
        return "forward:/admin/blogs.do?str=&category=0&pageNum=1";
    }

    @RequestMapping("/blog/save")
    public String save(Blog blog){
        blogService.save(blog);
        return "forward:/admin/blogs.do?str=&category=0&pageNum=1";
    }

    @RequestMapping("/blog/delete")
    public String delete(int id){
        blogService.delete(id);
        return "forward:/admin/blogs.do?str=&category=0&pageNum=1";
    }

    @RequestMapping("/categories")
    public ModelAndView categories(int pageNum,ModelAndView modelAndView){
        int pageSize = 5;

        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        List<Category> categories = categoryService.pageFind(pageNum,pageSize);
        modelAndView.addObject("categories",categories);
        PageInfo<Category> pageInfo = new PageInfo<Category>(categories);
        int pages = pageInfo.getPages();
        modelAndView.addObject("pages",pages);
        modelAndView.addObject("pageNum",pageNum);

        modelAndView.setViewName("admin/types");
        return modelAndView;
    }

    @RequestMapping("/category/edit")
    public ModelAndView edit2(int id,ModelAndView modelAndView){
        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        Category category = categoryService.findById(id);
        modelAndView.addObject("category",category);
        modelAndView.addObject("type",1);

        modelAndView.setViewName("/admin/types-input");
        return modelAndView;
    }

    @RequestMapping("/category/input")
    public ModelAndView input2(ModelAndView modelAndView){
        Info info = infoService.getInfo();
        modelAndView.addObject("info",info);
        modelAndView.addObject("type",2);

        modelAndView.setViewName("/admin/types-input");
        return modelAndView;
    }

    @RequestMapping("/category/update")
    public String update2(Category category){
        categoryService.update(category);
        return "forward:/admin/categories.do?pageNum=1";
    }

    @RequestMapping("/category/save")
    public String save2(Category category){
        categoryService.insert(category);
        return "forward:/admin/categories.do?pageNum=1";
    }

    @RequestMapping("/category/delete")
    public String delete2(int id){
        categoryService.delete(id);
        return "forward:/admin/categories.do?pageNum=1";
    }
}
