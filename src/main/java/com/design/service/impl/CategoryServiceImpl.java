package com.design.service.impl;

import com.design.mapper.CategoryMapper;
import com.design.pojo.Category;
import com.design.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {


    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> queryAll() {

        return categoryMapper.queryAll();
    }
}
