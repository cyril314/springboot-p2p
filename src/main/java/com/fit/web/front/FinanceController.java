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
public class FinanceController extends BaseController {

    @RequestMapping({"/finance", "/finance.do"})
    public String finance_index() {
        return toFront("finance-index");
    }
}
