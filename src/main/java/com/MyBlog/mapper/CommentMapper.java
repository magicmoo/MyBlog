package com.MyBlog.mapper;

import com.MyBlog.pojo.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CommentMapper extends Mapper<Comment> {

    @Select("select id,username,content,b_id bId,is_response isResponse from comment where b_id=#{bId}")
    public List<Comment> findByBid(int bId);

    @Update("update comment set content=#{str} where id=#{id}")
    public void updateContent(int id,String str);

    @Select("select id,username,content,b_id bId,is_response isResponse from comment where is_response=#{res} and b_id=#{bId}")
    public List<Comment> findByIsResponseAndBid(@Param("res") int res,@Param("bId") int bId);

//    @Insert("insert into comment values(0,#{username},#{content},#{bId},#{isResponse})")
//    public void myInsert(Comment comment);
}
