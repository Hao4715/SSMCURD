package com.design.controller;


import com.design.pojo.Category;
import com.design.pojo.Entry;
import com.design.service.CategoryService;
import com.design.service.EntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/entry")
public class EntryController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private EntryService entryService;

    @RequestMapping("/addTo/{id}")
    public String addTo(@PathVariable("id") String id, Model model){
        model.addAttribute("categoryid",id);
        return "addEntry";
    }

    @RequestMapping("/add")
    public String add(Entry entry,Model model){
        //添加电子文档
        boolean successflag = entryService.add(entry) == 1 ? true:false;
        model.addAttribute("successflag",successflag);
        List<Category> categories = categoryService.queryAll();

        Integer id = entry.getCategoryid();
        List<Entry> entries = entryService.queryByCategoryId(id);
        if(id == null || id == 0)
            id = null;

        //保留条件
        model.addAttribute("categoryId",id);
        model.addAttribute("categories",categories);
        model.addAttribute("entries",entries);
        return "main";
    }

    @RequestMapping("/updateTo/{id}")
    public String updateTo(@PathVariable("id") Integer id,Model model){

        //更新前先查询出信息
        Entry entry = entryService.queryById(id);
        model.addAttribute("entry",entry);
        return "updateEntry";
    }

    @RequestMapping("/update")
    public String update(Entry entry,Model model){

        //更新信息
        boolean successFlag = entryService.update(entry);

        List<Category> categories = categoryService.queryAll();
        Integer id = entry.getCategoryid();
        List<Entry> entries = entryService.queryByCategoryId(id);
        if(id == null || id == 0)
            id = null;

        //保留条件
        model.addAttribute("categoryId",id);
        model.addAttribute("categories",categories);
        model.addAttribute("entries",entries);
        model.addAttribute("successFlag",successFlag);
        return "main";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id,Model model) {
        Entry entry = entryService.queryById(id);
        entryService.delete(id);
        Integer Id= entry.getCategoryid();
        List<Category> categories = categoryService.queryAll();

        //查询电子文档
        List<Entry> entries = entryService.queryByCategoryId(Id);

        model.addAttribute("categories",categories);
        model.addAttribute("entries",entries);
        return "main";
    }

}
