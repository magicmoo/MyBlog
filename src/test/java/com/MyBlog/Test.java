package com.MyBlog;

import com.MyBlog.util.EncodingUtil;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.UnsupportedEncodingException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-mapper.xml","classpath:applicationContext-service.xml"})
public class Test {

    @org.junit.Test
    public void test1(){
        try {
            System.out.println(java.net.URLDecoder.decode
                    ("他："+"%E5%BC%80%E9%97%A8%E6%9F%A5%E6%B0%B4%E8%A1%A8","utf-8"));
            System.out.println("我：•́ω•̀)¿¿¿");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @org.junit.Test
    public void test2(){
        String str = "开门查水表";
        System.out.println(EncodingUtil.getEncoding(str));
    }

}
