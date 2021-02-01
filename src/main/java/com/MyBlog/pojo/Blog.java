package com.MyBlog.pojo;

import lombok.Data;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Table(name = "blog")
public class Blog {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String title;
    private String createTime;    //实际上为最后一次更新的时间S
    private String category;
    private Integer viewNumber;
    private Integer CommentNumber;
    private String content;
    private String img;
    private int type;
    @Column(name = "descr")
    private String desc;
}
