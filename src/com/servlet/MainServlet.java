package com.servlet;

import com.Bean.Expert;
import com.dao.ExpertDao;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet("/main")
public class MainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request, response);
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        HttpSession session =request.getSession();
        int userId = Integer.parseInt((String) session.getAttribute("userId"));
        String password = (String) session.getAttribute("password");
//        int userId =Integer.parseInt( request.getParameter("userId"));
//        String password = request.getParameter("password");


        ExpertDao searchDao = new ExpertDao();
        List<Expert> experts = searchDao.getAll();
        Expert expert = searchDao.getExpert(userId);
        String name = expert.getName();
//        JSONArray jsonArray =  JSONArray.fromObject(experts);
//        String json = jsonArray.toString();
//        request.setAttribute("jsonStr",json);
//        request.setAttribute("lists",experts);
        session.setAttribute("name",name);

        request.setAttribute("userId",userId);

        request.getRequestDispatcher("/jsp/main.jsp").forward(request, response);
//        request.getRequestDispatcher("/jsp/expert.jsp").forward(request, response);

    }


}
