package com.its.dbex.controller;

import com.its.dbex.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DataController {
    @Autowired
    private DataService dataService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/save-form")
    public String saveForm() {
        return "save-form";
    }

    @PostMapping("/save")
    public String save(@RequestParam String val1, @RequestParam String val2) {
        System.out.println("DataController.save");
        dataService.save(val1, val2);
        return null;
    }
}
