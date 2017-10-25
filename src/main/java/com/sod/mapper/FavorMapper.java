package com.sod.mapper;

import com.sod.pojo.Favor;

import java.util.List;

public interface FavorMapper {

    List<Favor> findFavorList(String userId);
}
