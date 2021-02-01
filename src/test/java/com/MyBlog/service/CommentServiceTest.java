package com.MyBlog.service;

import com.MyBlog.pojo.Comment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-mapper.xml","classpath:applicationContext-service.xml"})
public class CommentServiceTest {

    @Autowired
    private CommentService commentService;

    @Test
    public void findByBid(){
        List<Comment> comments = commentService.findByBid(1);
        System.out.println("------------------------------");
        for(Comment comment : comments){
            System.out.println(comment);
        }
        System.out.println("------------------------------");
    }

    @Test
    public void response(){
        Comment comment = new Comment();
        comment.setBId(1);
        comment.setUsername("kmc");
        comment.setContent("kmc是个傻逼");
        comment.setBId(1);
        comment.setIsResponse(0);
        commentService.response(comment);
    }
}
