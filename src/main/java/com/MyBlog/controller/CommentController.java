package com.MyBlog.controller;

import com.MyBlog.pojo.Blog;
import com.MyBlog.pojo.Comment;
import com.MyBlog.service.BlogService;
import com.MyBlog.service.CommentService;
import com.MyBlog.util.EncodingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private BlogService blogService;

    @RequestMapping("/save")
    public String save(Comment comment,int id){
//        System.out.println(comment);
        commentService.response(comment);
        blogService.addCommentNumber(id);
        return "forward:/blog/show.do?id="+id;
    }
}
