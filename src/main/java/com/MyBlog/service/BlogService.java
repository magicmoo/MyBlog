package com.MyBlog.service;

import com.MyBlog.pojo.Blog;

import java.util.List;


public interface BlogService {
    public List<Blog> list();
    public List<Blog> pageList(int pageNum,int pageSize);
    public int save(Blog blog);
    public List<Blog> pageSearch(String str,int pageNum,int pageSize);
    public Blog findById(int id);
    public void addViewNumber(int id);
    public void addCommentNumber(int id);
    public void reduceCommentNumber(int id);
    List<Blog> pageFindByCategoryId(int cid,int pageNum,int pageSize);
    List<Blog> pageFindBySearchAndCategory(String str,int cid,int pageNum,int pageSize);
    void update(Blog blog);
    void delete(int id);
}
