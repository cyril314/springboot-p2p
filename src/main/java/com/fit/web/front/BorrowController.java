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
public class BorrowController extends BaseController {

    @RequestMapping({"/borrow", "/borrow.do"})
    public String borrow_index() {
        return toFront("borrow-index");
    }
}
