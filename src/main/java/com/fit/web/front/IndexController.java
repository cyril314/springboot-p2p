package com.fit.web.front;

import com.fit.base.BaseController;
import com.fit.entity.TBorrow;
import com.fit.entity.TLinks;
import com.fit.entity.TMediareport;
import com.fit.entity.TNews;
import com.fit.service.TBorrowService;
import com.fit.service.TLinksService;
import com.fit.service.TMediareportService;
import com.fit.service.TNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/1/10
 */
@Controller
public class IndexController extends BaseController {

    @Autowired
    private TBorrowService borrowService;
    @Autowired
    private TLinksService linksService;
    @Autowired
    private TNewsService newsService;
    @Autowired
    private TMediareportService mediareportService;

    @RequestMapping({"", "/", "index", "/index.do"})
    public String index(HttpServletRequest req) throws Exception {
        Map<String, Object> params = getRequestParamsMap(req);
        // 最新借款列表
        params.put("offset", 0);
        params.put("limit", 6);
        List<TBorrow> mapList = borrowService.findList(params);
        req.setAttribute("mapList", mapList);
        // 图片滚动
        List<TLinks> bannerList = linksService.findList(params);
        params.put("type", 3);
        params.put("limit", 3);
        req.setAttribute("bannerList", bannerList);
        // 公告
        params.clear();
        params.put("offset", 0);
        params.put("limit", 5);
        List<TNews> newsList = newsService.findList(params);
        req.setAttribute("newsList", newsList);
        TNews ggMap = newsList.get(0);
        req.setAttribute("ZxggMap", ggMap);
        // 媒体报道 取5条记录
        params.put("stick", 2);
        params.put("state", 2);
        List<TMediareport> meikuList = mediareportService.findList(params);
        req.setAttribute("meikuList", meikuList);

        return toFront("index-list");
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest req) throws Exception {
        return toFront("login");
    }

}
