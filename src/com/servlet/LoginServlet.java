package com.servlet;


import com.Bean.Expert;
import com.config.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;



public class LoginServlet extends HttpServlet {

    @Override
    public void init(){
        int count  = 0;
        this.getServletContext().setAttribute("count",count);//设置域属性
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException{

        HttpSession session = request.getSession();

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        if (userId == null){
            userId =(String) session.getAttribute("userId");
        }
        if (password == null){
            password =(String) session.getAttribute("password");
        }
        Expert expert;

        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from expert where idNum = ? and password = ?";

        try {
            expert = queryRunner.query(sql, new BeanHandler<Expert>(Expert.class), userId, password);
            if (expert != null){

                String name = expert.getName();
                session.setAttribute("userId",userId);
                session.setAttribute("password",password);
                session.setAttribute("name",name);
//
                request.getRequestDispatcher("/main").forward(request, response);
            } else{
                response.sendRedirect("login.jsp?error=yes");
//                response.getWriter().write("sorry,your userName or password is wrong");
            }


        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

     }
    // 处理 POST 方法请求的方法
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
