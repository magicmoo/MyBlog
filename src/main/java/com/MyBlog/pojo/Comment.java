package com.MyBlog.pojo;

import lombok.Data;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name = "comment")
public class Comment {
    @Id
    @KeySql(useGeneratedKeys = true)
    private int id;
    private String username;
    private String content;
    @Column(name = "b_id")
    private int bId;
    @Column(name = "is_response")
    private int isResponse;
}
