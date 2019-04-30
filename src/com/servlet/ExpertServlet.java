package com.servlet;

import com.Bean.Expert;
import com.Bean.Project;
import com.dao.ExpertDao;
import com.dao.ProjectDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/expert")
public class ExpertServlet extends HttpServlet{

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            this.doPost(request, response);
        }
        protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

            String type = request.getParameter("type");
            if ("add".equals(type)){
                addExpert(request,response);
            }
            else if("toEdit".equals(type) ){
                String id = request.getParameter("id");
                int id1 = Integer.parseInt(id);
                toEdit(request,response,id1);

            }else if("edit".equals(type)){
                editExpert(request,response);
            }else if("del".equals(type)){
                String id = request.getParameter("id");
                delExpert(request,response,id);
            }
            else{
                if ("allocate".equals(type)){
                    String id = request.getParameter("id");
                    toAllocateProject(request,response,id);
                }else if ("query".equals(type)){
                    String id = request.getParameter("id");
                    queryProject(request,response,id);
                }else if ("allocateSave".equals(type)){
//                    String ids = request.getParameter("ids");
                    AllocateProject(request,response);
                }
                else {

                    ExpertDao searchDao = new ExpertDao();
                    List<Expert> experts = searchDao.getAll();
    //                request.setAttribute("lists",experts);
    //                request.getRequestDispatcher("/jsp/expert.jsp").forward(request, response);

                    HttpSession session = request.getSession();
                    session.setAttribute("lists",experts);
                    response.sendRedirect("../jsp/expert.jsp");
                }
            }
        }



    private void toAllocateProject(HttpServletRequest request, HttpServletResponse response, String id) throws IOException {
        int expertId  = Integer.parseInt(id);
        ProjectDao projectDao = new ProjectDao();
        ExpertDao expertDao = new ExpertDao();

        List<Project> lists= projectDao.findUnProjectsByExpertId(expertId);
        String name = expertDao.getExpertById(expertId).getName();

        HttpSession session = request.getSession();
        session.setAttribute("otherProjects",lists);
        session.setAttribute("expertId",expertId);
        session.setAttribute("eName",name);
        response.getWriter().write("../jsp/allocation.jsp");

    }

    private void AllocateProject(HttpServletRequest request, HttpServletResponse response) {
//            String[] ids = id.split(",");
            String[] pids = request.getParameterValues("ids");
            String expertId = request.getParameter("expertId");
            ProjectDao projectDao = new ProjectDao();
            projectDao.addProjectForExpert(expertId,pids);


    }


    /**
     * 查询某专家已知项目
     * @param request
     * @param response
     * @param id
     */
    private void queryProject(HttpServletRequest request, HttpServletResponse response, String id) throws IOException {
        int expertId  = Integer.parseInt(id);
        ExpertDao expertDao = new ExpertDao();
        ProjectDao projectDao = new ProjectDao();
        String name = expertDao.getExpertById(expertId).getName();
        List<Project> lists= projectDao.findProjectsByExpertId(expertId);
        HttpSession session = request.getSession();
        session.setAttribute("projects",lists);
        session.setAttribute("expertName",name);
        session.setAttribute("expertId",expertId);
        response.getWriter().write("../jsp/projectquery.jsp");


    }

    /**
     * @param request
     * @param response
     * @param
     * @return 如果删除成功则返回true，否则返回false;
     */
    private void delExpert(HttpServletRequest request, HttpServletResponse response, String id) throws IOException {

        ExpertDao searchDao = new ExpertDao();
        if( searchDao.delExpertById(id)){
            response.getWriter().write("success delete!!");
        }

    }

    /**
     * 查询本专家信息，跳转到修改页面
     * @param request
     * @param response
     * @param id
     * @throws ServletException
     * @throws IOException
     */
    private void toEdit(HttpServletRequest request, HttpServletResponse response,int id) throws ServletException, IOException {
        ExpertDao searchDao = new ExpertDao();
        Expert expert = searchDao.getExpertById(id);
        HttpSession session = request.getSession();
        session.setAttribute("expert",expert);
        response.sendRedirect("../jsp/expertedit.jsp");
    }

    /**
     * 后台修改页面返回值
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void editExpert(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String idCard =  request.getParameter("idCard");
            String nation = request.getParameter("nation");
            String birth = request.getParameter("birth");
            String department = request.getParameter("department");
            String unit = request.getParameter("unit");
            String subject = request.getParameter("subject");
            String job = request.getParameter("job");
            String sArea = request.getParameter("sArea");
            String email = request.getParameter("email");
            String industryCategory = request.getParameter("industryCategory");
            String phoneNum =  request.getParameter("phoneNum");
            String address = request.getParameter("address");
            String honor = request.getParameter("honor");
            String mainSuccess = request.getParameter("mainSuccess");
            Object[] paras = {name,idCard,idCard,sex,nation,birth,unit,department,subject,job,sArea,industryCategory,email,phoneNum,address,mainSuccess,honor,id};

            ExpertDao searchDao = new ExpertDao();
            searchDao.updateExcept(paras);

        response.sendRedirect("../jsp/main.jsp");
    }

    /**
     * 添加页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addExpert(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
            String name = request.getParameter("name");
            String idCard =  request.getParameter("idCard");
            String sex = request.getParameter("sex");
            String nation = request.getParameter("nation");
            String birth = request.getParameter("birth");
            String unit = request.getParameter("unit");
            String department = request.getParameter("department");
            String subject = request.getParameter("subject");
            String job = request.getParameter("job");
            String sArea = request.getParameter("sArea");
            String industryCategory = request.getParameter("industryCategory");
            String email = request.getParameter("email");
            String phoneNum =  request.getParameter("phoneNum");
            String address = request.getParameter("address");
            String mainSuccess = request.getParameter("mainSuccess");
            String honor = request.getParameter("honor");


            Object[] paras = {name,idCard,idCard,sex,nation,birth,unit,department,subject,job,sArea,industryCategory,email,phoneNum,address,mainSuccess,honor};

            ExpertDao searchDao = new ExpertDao();
//            searchDao.addExpert(expert);
            searchDao.addExpert(paras);

            response.sendRedirect("../jsp/main.jsp");
//            request.getRequestDispatcher("/jsp/main.jsp").forward(request, response);



        }

}
