package com.MyBlog.pojo;

import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name = "info")
public class Info {
    @Id
    private int id;
    private Integer articleNum;
    private Integer accessNum;
    private Integer commentNum;
    private Integer hotNum;
}
