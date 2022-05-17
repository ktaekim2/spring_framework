package com.its.req;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    // 스프링이 관리하는 객체를 쓰려면
    @Autowired
    private HomeService homeService; // 객체를 주입(필드주입방식)
    // 두 개 쓰려면 이렇게
    @Autowired
    private HomeService homeService1;

    @GetMapping("/")
    public String index() {
        System.out.println("HomeController.index");
        return "index";
    }

    // welcome 요청 처리
    @GetMapping("/welcome")
    public String welcome() {
        System.out.println("HomeController.welcome");
        return "welcome";
    }

    @GetMapping("/form-ex")
    public String formEx() {
        System.out.println("HomeController.ex");
        return "form-ex";
    }

    @GetMapping("/param-req1")
    public String paramReq1(@RequestParam("param1") String param1, @RequestParam("param2") String param2) {
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
        System.out.println("HomeController.paramReq1");
        return null;
    }

    @PostMapping("/param-req1")
    public String paramReq2(@RequestParam("param1") String param1,
                            @RequestParam("param2") String param2,
                            Model model1) {
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
        System.out.println("HomeController.paramReq1");

        // HomeService 클래스의 serviceMethod1() 메서드를 호출하면서
        // param1, param2를 넘기고 serviceMethod1 에서는
        // param1, param2의 값을 출력
//        HomeService homeService = new HomeService();
        homeService.serviceMethod1(param1, param2);

        // param1, param2를 param-print.jsp로 가져가서 출력
        model1.addAttribute("pa1", param1); // (담아갈 이름, 담아갈 값)
        model1.addAttribute("pa2", param2);
        // Model: 화면으로 data를 실어 나르는 역할
        return "param-print";
    }
}
