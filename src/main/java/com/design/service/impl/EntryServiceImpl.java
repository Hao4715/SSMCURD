package com.design.service.impl;

import com.design.mapper.EntryMapper;
import com.design.pojo.Entry;
import com.design.service.EntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("entryService")
public class EntryServiceImpl implements EntryService {

    @Autowired
    private EntryMapper entryMapper;

    @Override
    public List<Entry> queryAll() {

        return entryMapper.queryAll();
    }

    @Override
    public List<Entry> queryByCategoryId(Integer id) {

        return entryMapper.queryByCategoryId(id);

    }

    @Override
    public int add(Entry entry) {
        return entryMapper.add(entry);
    }

    @Override
    public Entry queryById(Integer id) {
        if(id == null || id == 0)
            return null;
        return entryMapper.queryById(id);
    }

    @Override
    public boolean update(Entry entry) {
        if(entry.getId() == null ||entry.getId() == 0)
            return false;
        return entryMapper.update(entry) == 1? true:false;
    }

    @Override
    public void delete(Integer id) {
        entryMapper.delete(id);
    }

}
