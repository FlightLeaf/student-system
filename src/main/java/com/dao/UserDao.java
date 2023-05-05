package com.dao;

import com.entity.User;
import com.util.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public boolean register(User user) {
        boolean flag = false;
        JDBCUtil.init();
        int i = JDBCUtil.addUpdDel("insert into user(name,email,password,tel)" +
        "values('"+user.getName()+"','"+user.getEmail()+"','"+user.getPassword()+"','"+user.getTel()+"')");
        if(i>0){
            flag = true;
        }
        JDBCUtil.closeConn();
        return flag;
    }
    public boolean login(String email, String password) {
        boolean flag = false;
        try{
            JDBCUtil.init();
            ResultSet rs = JDBCUtil.selectSql("select * from user where email='"+email+"' and password='"+password+"'");
            while (rs.next()){
                if(rs.getString("email").equals(email)&&rs.getString("password").equals(password)){
                    flag = true;
                }
            }
            JDBCUtil.closeConn();
        } catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }
    public boolean IDJudgment(String email) {
        boolean flag = true;
        JDBCUtil.init();
        ResultSet rs = JDBCUtil.selectSql("select * from user where email = '"+email+"'");
        try{
            while (rs.next()){
                if(rs.getString("email").equals(email)){
                    flag = false;
                }
            }
            rs.close();
            JDBCUtil.closeConn();
        } catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

}
