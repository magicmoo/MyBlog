package com.MyBlog.mapper;


import com.MyBlog.pojo.Blog;
import com.github.pagehelper.PageHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-mapper.xml","classpath:applicationContext-service.xml"})
public class BlogMapperTest {

    @Autowired
    private BlogMapper blogMapper;

    @Test
    public void page(){
        PageHelper.startPage(1,2);
        List<Blog> list = blogMapper.selectAll();
        System.out.println("--------------------------------");
        for(Blog blog : list){
            System.out.println(blog);
        }
        System.out.println("--------------------------------");
    }

}
