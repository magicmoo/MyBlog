package com.MyBlog.service;

import com.MyBlog.pojo.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> findByBid(int bId);
    void response(Comment comment);
    void deleteById(int id);
    List<Comment> findAll();
    List<Comment> findMom(int bId);
    List<Comment> findSon(int isres,int bid);
}
