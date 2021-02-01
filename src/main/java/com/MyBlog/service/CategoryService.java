package com.MyBlog.service;

import com.MyBlog.pojo.Blog;
import com.MyBlog.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    List<Category> pageFind(int pageNum,int pageSize);
    Category findById(int id);
    void insert(Category category);
    void delete(int id);
    void update(Category category);
}
