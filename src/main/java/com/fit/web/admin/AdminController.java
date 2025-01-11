package com.fit.web.admin;

import com.fit.base.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
    @RequestMapping({"", "/", "index", "/index.do"})
    public String index(HttpServletRequest req) throws Exception {
        return toAdmin("admin_index");
    }

    @RequestMapping(path = "/captcha", method = RequestMethod.GET)
    public void image_code(HttpServletResponse response, HttpSession session) {
        // 生成验证码
//        String text = kaptchaProducer.createText();
//        BufferedImage image = kaptchaProducer.createImage(text);
        // 将验证码存入session
//        session.setAttribute("c", text);
//        // 将突图片输出给浏览器
//        response.setContentType("image/png");
//        try {
//            OutputStream os = response.getOutputStream();
//            ImageIO.write(image, "png", os);
//        } catch (IOException e) {
//            log.error("响应验证码失败:" + e.getMessage());
//        }
    }
}
