package com.design.service;

import com.design.pojo.Entry;

import java.util.List;

public interface EntryService {

    List<Entry> queryAll();

    List<Entry> queryByCategoryId(Integer id);

    int add(Entry entry);

    Entry queryById(Integer id);

    boolean update(Entry entry);

    void delete(Integer id);
}
