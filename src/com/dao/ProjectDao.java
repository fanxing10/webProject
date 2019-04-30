package com.dao;

import com.Bean.Project;
import com.config.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectDao {

    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());

    public List<Project> getProjectAll() {
        List<Project> list = new ArrayList<Project>();
        String sql =  "select * from project where status = '1'";
        try {
            list = queryRunner.query(sql,new BeanListHandler<Project>(Project.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addProject(Object[] paras) {
        try {

            String sql1 ="insert into project values(null,?,?,?,?,?,?,?,?,?,?,'1')";
            queryRunner.update(sql1,paras);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Project findProjectById(int id) {
        Project project = new Project();

        try {
            String sql = "select * from project where id = ?";
            project = queryRunner.query(sql,new BeanHandler<Project>(Project.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return project;
    }

    public boolean delProjectById(int id) {
        try {
            String sql = "update project set status=0 where id = ?";
            queryRunner.update(sql,id);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean EditProject(Object[] paras) {
        try {
            String sql = "update project set projectName=?,applyer=?,landlinePhone=?, mobilePhone=?,money=?," +
                    "moneyGiven=?,moment=?,promaryCoverage=?,email=? where id=?";
            queryRunner.update(sql,paras);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Project> findProjectsByExpertId(int expertId) {
        List<Project> list = new ArrayList<>();
        try {
            String sql = "select * from project where id in (select projectID from ewithp where expertID = ?) ORDER BY id";
           list= queryRunner.query(sql,new BeanListHandler<Project>(Project.class),expertId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Project> findUnProjectsByExpertId(int expertId) {
        List<Project> list = new ArrayList<>();
        try {
            String sql = "select * from project where id not in (select projectID from ewithp where expertID = ?) ORDER BY id ";
            list= queryRunner.query(sql,new BeanListHandler<Project>(Project.class),expertId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addProjectForExpert(String id, String[] ids) {
        String sql = "insert into  ewithp values(?,?)";
            try {
                for (String projectID:ids) {
                    int pid = Integer.parseInt(projectID);
                    int eid = Integer.parseInt(id);
                    queryRunner.update(sql,eid,pid);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
    }


}
