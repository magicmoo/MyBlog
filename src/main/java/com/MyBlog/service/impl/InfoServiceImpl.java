package com.MyBlog.service.impl;

import com.MyBlog.mapper.InfoMapper;
import com.MyBlog.pojo.Info;
import com.MyBlog.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoMapper infoMapper;

    @Override
    public Info getInfo() {
        List<Info> infos = infoMapper.selectAll();
        return infos.get(0);
    }

    @Override
    public void update(Info info) {
        infoMapper.updateByPrimaryKey(info);
    }
}
