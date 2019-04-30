package com.dao;

import com.Bean.Expert;

import com.config.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExpertDao {

    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());


    public List<Expert> getAll()  {
        List<Expert> list = new ArrayList<Expert>();
        String sql =  "select * from expert where status = '1'";
        try {
            list = queryRunner.query(sql,new BeanListHandler<Expert>(Expert.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Expert getExpert(int userid){
        String sql = "select * from expert where idNum = ?";
        Expert expert = new Expert();
        try {
            expert = queryRunner.query(sql, new BeanHandler<Expert>(Expert.class),userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  expert;
    }

    public Expert getExpertById(int id) {
        Expert expert = new Expert();
        try {
            String sql = "select * from expert where id = ?";
            expert = queryRunner.query(sql, new BeanHandler<Expert>(Expert.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  expert;
    }


    public void addExpert(Object[] expert) {

        try {
//            String sql = "insert into expert(name,idNum,password,nation,sex，birth，unit，dept，" +
//                    "subject，job，resArea，industryCategory，mainsuccess，honor，phonenum，email，address) " +
//                    "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            String sql1 ="insert into expert values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1')";
            queryRunner.update(sql1,expert);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateExcept(Object[] paras) {
        try {
            String sql = "update expert set name=?,idNum=?,password=?,sex=?,nation=?,birth=?,unit=?,department=?,subject=?,job=?" +
                    ",researchArea=?,industryCategory=?,mainSuccess=?,honor=?,phoneNum=?,email=?,address=? where id=?";
            queryRunner.update(sql,paras);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public boolean delExpertById(String id){

        try {
            String sql = "update expert set status=0 where id = ?";
            queryRunner.update(sql,id);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

}
