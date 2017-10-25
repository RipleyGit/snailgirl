package com.sod.service;

import com.sod.mapper.UserMapper;
import com.sod.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class CustomUserService implements UserDetailsService{

    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username)  {

        User user = userMapper.findUserByUserNameEmailTel(username);
        if(user == null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        System.out.println(user.getPassword());
        List<SimpleGrantedAuthority> authorities =new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(user.getState()));


        return new org.springframework.security.core.userdetails.User(user.getUsername()
        ,user.getPassword(),authorities);
    }
}
