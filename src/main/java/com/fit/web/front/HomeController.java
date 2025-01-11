package com.fit.web.front;

import com.fit.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/1/10
 */
@Controller
public class HomeController extends BaseController {

    @RequestMapping({"/home", "/home.do"})
    public String home_index() {
        return toFront("home-index");
    }
}
