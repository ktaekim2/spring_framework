package com.its.req;

import org.springframework.stereotype.Service;

@Service // @Autowired 작동하기 위해
public class HomeService {
    public void serviceMethod1(String param1, String param2) {
        System.out.println("param1 = " + param1 + ", param2 = " + param2);
    }
}
