package com.servlet;

import com.Bean.Project;
import com.dao.ProjectDao;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;


@WebServlet("/project")
public class ProjectServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request, response);
    }

    /**
     * servlet选择项，根据不同类型到不同方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

        String type = request.getParameter("type");
        if ("add".equals(type)){
            addProject(request,response);
        }else if("toEdit".equals(type)){
            int id = Integer.parseInt(request.getParameter("id"));
            toEditProject(request,response,id);
        }else if ("edit".equals(type)){
            EditProject(request,response);
        }


        else if("del".equals(type)){
            int id = Integer.parseInt(request.getParameter("id"));
            delProject(request,response,id);
        }


        else {
            ProjectDao projectDao = new ProjectDao();
            List<Project> projects = projectDao.getProjectAll();
    //        JSONArray jsonArray =  JSONArray.fromObject(projects);
    //        String json = jsonArray.toString();
    //        request.setAttribute("jsonStr",json);
//
            HttpSession session = request.getSession();
            session.setAttribute("lists",projects);
            response.sendRedirect("../jsp/project.jsp");
//            request.setAttribute("lists", projects);
//            request.getRequestDispatcher("/jsp/project.jsp").forward(request, response);

        }
    }

    /***
     * 跳转添加页面，
     * @param request
     * @param response
     * @param id
     * @throws IOException
     */
    private void toEditProject(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {

        ProjectDao projectDao = new ProjectDao();
        Project project  = projectDao.findProjectById(id);
        HttpSession session = request.getSession();
        session.setAttribute("plist",project);

        response.getWriter().write("../jsp/projectedit.jsp");

    }

    /**
     * 添加project数据到后台，保存在数据库
     * @param request
     * @param response
     */
    private void EditProject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String applyer = request.getParameter("applyer");
        String projectName = request.getParameter("projectName");
        String landlinePhone = request.getParameter("landlinePhone");
        String mobilePhone =  request.getParameter("mobilePhone");
        String email = request.getParameter("email");
        int moneyGiven = Integer.parseInt(request.getParameter("moneyGiven"));
        int money = Integer.parseInt(request.getParameter("money"));
        String moment = request.getParameter("moment");
        String promaryCoverage = request.getParameter("promaryCoverage");


        Object[] paras ={projectName,applyer,landlinePhone,mobilePhone,money,moneyGiven,moment,promaryCoverage,email,id};
        ProjectDao projectDao = new ProjectDao();
        projectDao.EditProject(paras);

        response.getWriter().write("/project");

    }

    /**
     * 删除操作
     * @param request
     * @param response
     * @param id
     * @throws IOException
     */
    private void delProject(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        ProjectDao searchDao = new ProjectDao();
        if( searchDao.delProjectById(id)){
            response.getWriter().write("success delete!!");
        }

    }


    /**
     * 添加
     * @param request
     * @param response
     */
    private void addProject(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String projectName = request.getParameter("projectName");
        String applyer = request.getParameter("applyer");
        String landlinePhone = request.getParameter("landlinePhone");
        String mobilePhone =  request.getParameter("mobilePhone");
        String email = request.getParameter("email");
        int money = Integer.parseInt(request.getParameter("money"));
        int moneyGiven = Integer.parseInt(request.getParameter("moneyGiven"));
        String moment = request.getParameter("moment");
        String promaryCoverage = request.getParameter("promaryCoverage");

        long currentTimeMillis = System.currentTimeMillis();
        Date date = new Date(currentTimeMillis);  //只有年月日  与MySQL中的DATE相对应
        Time time = new Time(currentTimeMillis);  //只有时分秒  与MySQL中的TIME相对应
        String datetime = date.toString() + " " + time.toString();


        Object[] paras ={projectName,applyer,landlinePhone,mobilePhone,datetime,money,moneyGiven,moment,promaryCoverage,email};
        ProjectDao projectDao = new ProjectDao();
        projectDao.addProject(paras);

        response.getWriter().write("/project");
//        return "/project";
    }


}
