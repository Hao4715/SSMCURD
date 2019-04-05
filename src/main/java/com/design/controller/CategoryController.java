package com.design.controller;


import com.design.pojo.Category;
import com.design.pojo.Entry;
import com.design.service.CategoryService;
import com.design.service.EntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private EntryService entryService;

    @RequestMapping("/main")
    public String main(Model model){

        //查询文档分类信息
        List<Category> categories = categoryService.queryAll();

        //查询电子文档
        List<Entry> entries = entryService.queryAll();

        model.addAttribute("categories",categories);
        model.addAttribute("entries",entries);
        return "main";
    }

    @RequestMapping("/query/categoryId")
    public String queryById(@RequestParam("id") Integer id,Model model){

        List<Category> categories = categoryService.queryAll();

        List<Entry> entries = entryService.queryByCategoryId(id);

        if(id == null || id == 0)
            id = null;

        //保留条件
        model.addAttribute("categoryId",id);
       model.addAttribute("categories",categories);
        model.addAttribute("entries",entries);
        return "main";
    }
}
