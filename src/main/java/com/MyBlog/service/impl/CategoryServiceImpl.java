package com.MyBlog.service.impl;

import com.MyBlog.mapper.CategoryMapper;
import com.MyBlog.pojo.Category;
import com.MyBlog.service.CategoryService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> findAll() {
        List<Category> categories = categoryMapper.selectAll();
        return categories;
    }

    @Override
    public List<Category> pageFind(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Category> categories = categoryMapper.selectAll();
        return categories;
    }

    @Override
    public Category findById(int id) {
        Category category = categoryMapper.selectByPrimaryKey(id);
        return category;
    }

    @Override
    public void insert(Category category) {
        categoryMapper.insert(category);
    }

    @Override
    public void delete(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Category category) {
        categoryMapper.updateByPrimaryKey(category);
    }
}
