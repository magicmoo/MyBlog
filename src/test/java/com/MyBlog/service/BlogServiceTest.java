package com.MyBlog.service;


import com.MyBlog.pojo.Blog;
import com.MyBlog.service.BlogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-mapper.xml","classpath:applicationContext-service.xml"})
public class BlogServiceTest {

    @Autowired
    private BlogService blogService;

    @Test
    public void list(){
        List<Blog> list = blogService.list();
        System.out.println("--------------------------------");
        System.out.println(list);
        System.out.println("--------------------------------");
    }

    @Test
    public void pageSearch(){
        List<Blog> list = blogService.pageSearch("",1,5);
        System.out.println("--------------------------------");
        for(Blog blog : list){
            System.out.println(blog);
        }
        System.out.println("--------------------------------");
    }

    @Test
    public void addViewNumber(){
        blogService.addViewNumber(1);
    }

    @Test
    public void updateCommentNumber(){
//        blogService.addCommentNumber(1);
        blogService.reduceCommentNumber(1);
    }

    @Test
    public void pageFindByCategoryId(){
        List<Blog> blogs = blogService.pageFindByCategoryId(1, 1, 5);
        System.out.println("--------------------------------");
        for(Blog blog : blogs){
            System.out.println(blog);
        }
        System.out.println("--------------------------------");
    }

    @Test
    public void pageFindBySearchAndCategory(){
        List<Blog> blogs = blogService.pageFindBySearchAndCategory("", 1, 1, 5);
        System.out.println("--------------------------------");
        for(Blog blog : blogs){
            System.out.println(blog);
        }
        System.out.println("--------------------------------");
    }

}
