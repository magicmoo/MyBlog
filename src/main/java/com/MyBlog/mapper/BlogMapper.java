package com.MyBlog.mapper;

import com.MyBlog.pojo.Blog;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;


public interface BlogMapper extends Mapper<Blog> {

    @Update("update blog set view_number = view_number+1 where id=#{id}")
    public void addViewNumberById(int id);

    @Update("update blog set comment_number = comment_number+1 where id=#{id}")
    public void addCommentNumberById(int id);

    @Update("update blog set comment_number = comment_number-1 where id=#{id}")
    public void reduceCommentNumberById(int id);
}
