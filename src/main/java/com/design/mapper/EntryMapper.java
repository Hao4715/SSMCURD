package com.design.mapper;

import com.design.pojo.Entry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EntryMapper {

    List<Entry> queryAll();

    List<Entry> queryByCategoryId(@Param("id") Integer id);

    int add(Entry entry);

    Entry queryById(@Param("id") Integer id);

    int update(Entry entry);

    void delete(Integer id);
}

