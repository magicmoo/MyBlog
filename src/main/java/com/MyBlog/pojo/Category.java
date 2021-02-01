package com.MyBlog.pojo;


import lombok.Data;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name = "category")
public class Category {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;

    @Column(name = "name")
    private String name;
}
