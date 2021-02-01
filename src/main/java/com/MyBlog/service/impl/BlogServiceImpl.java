package com.MyBlog.service.impl;

import com.MyBlog.mapper.BlogMapper;
import com.MyBlog.mapper.CategoryMapper;
import com.MyBlog.pojo.Blog;
import com.MyBlog.pojo.Category;
import com.MyBlog.service.BlogService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Blog> list() {
        return blogMapper.selectAll();
    }

    @Override
    public List<Blog> pageList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Blog> list = blogMapper.selectAll();
        return list;
    }

    @Override
    public int save(Blog blog) {
        return blogMapper.insert(blog);
    }

    @Override
    public List<Blog> pageSearch(String str,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        Example example = new Example(Blog.class);
        Example.Criteria criteria = example.createCriteria();
        char[] chars = str.toCharArray();
        for(char ch : chars){
            criteria.andLike("title","%"+ch+"%");
        }
        List<Blog> blogs = blogMapper.selectByExample(example);
        return blogs;
    }

    @Override
    public Blog findById(int id) {
        Blog blog = blogMapper.selectByPrimaryKey(id);
        return blog;
    }

    @Override
    public void addViewNumber(int id) {
        blogMapper.addViewNumberById(id);
    }

    @Override
    public void addCommentNumber(int id) {
        blogMapper.addCommentNumberById(id);
    }

    @Override
    public void reduceCommentNumber(int id) {
        blogMapper.reduceCommentNumberById(id);
    }

    @Override
    public List<Blog> pageFindByCategoryId(int cid,int pageNum,int pageSize) {
        Category category = categoryMapper.selectByPrimaryKey(cid);
        Blog blog = new Blog();
        blog.setCategory(category.getName());
        PageHelper.startPage(pageNum,pageSize);
        List<Blog> blogs = blogMapper.select(blog);
        return blogs;
    }

    @Override
    public List<Blog> pageFindBySearchAndCategory(String str, int cid, int pageNum, int pageSize) {
        Example example = new Example(Blog.class);
        Category category = categoryMapper.selectByPrimaryKey(cid);
        PageHelper.startPage(pageNum,pageSize);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("category", category.getName());
        char[] chars = str.toCharArray();
        for(char ch : chars){
            criteria.andLike("title","%"+ch+"%");
        }
        List<Blog> blogs = blogMapper.selectByExample(example);
        return blogs;
    }

    @Override
    public void update(Blog blog) {
        blogMapper.updateByPrimaryKey(blog);
    }

    @Override
    public void delete(int id) {
        blogMapper.deleteByPrimaryKey(id);
    }
}
