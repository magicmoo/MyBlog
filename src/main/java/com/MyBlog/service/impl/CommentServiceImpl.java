package com.MyBlog.service.impl;

import com.MyBlog.mapper.CommentMapper;
import com.MyBlog.pojo.Comment;
import com.MyBlog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> findByBid(int bId) {
        return commentMapper.findByBid(bId);
    }
    public void response(Comment comment) {
//        System.out.println("-----------------------------------");
//        Encoding.getEncoding(comment.getContent());
//        System.out.println("-----------------------------------");
        commentMapper.insert(comment);
    }

    @Override
    public void deleteById(int id) {
        commentMapper.updateContent(id,"该评论已删除");
    }

    @Override
    public List<Comment> findAll() {
        return commentMapper.selectAll();
    }

    @Override
    public List<Comment> findMom(int bId) {
        return commentMapper.findByIsResponseAndBid(0,bId);
    }

    @Override
    public List<Comment> findSon(int isres,int bid) {
        return commentMapper.findByIsResponseAndBid(isres,bid);
    }
}
