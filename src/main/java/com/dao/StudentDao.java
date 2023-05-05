package com.dao;

import com.entity.Student;
import com.util.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    public boolean register(Student student) {
        boolean flag = false;
        JDBCUtil.init();
        int i = JDBCUtil.addUpdDel("insert into student(id,class,name,sex,age,place)" +
                "values('"+student.getId()+"','"+student.getClass_stu()+"','"+student.getName()+"','"+student.getSex()+"','"+student.getAge()+"','"+student.getPlace()+"')");
        if(i>0){
            flag = true;
        }
        JDBCUtil.closeConn();
        return flag;
    }
    public boolean delete(String id){
        boolean flag = false;
        JDBCUtil.init();
        int i = JDBCUtil.addUpdDel("DELETE FROM student WHERE id = '"+id+"'");
        if(i>0){
            flag = true;
        }
        JDBCUtil.closeConn();
        return flag;
    }
    public boolean update(Student student ){
        boolean flag = false;
        JDBCUtil.init();
        int i = JDBCUtil.addUpdDel("update student " +
                "set class = '"+student.getClass_stu()+"', name = '"+student.getName()+"', sex = '"+student.getSex()+"', age = '"+student.getAge()+"', place = '"+student.getPlace()+"' where id = '"+student.getId()+"'");
        if(i>0){
            flag = true;
        }
        JDBCUtil.closeConn();
        return flag;
    }

    public int getTotal() {
        int pageSize = 0;
        JDBCUtil.init();
        ResultSet resultSet = JDBCUtil.selectSql("SELECT COUNT(*) FROM student");
        try {
            while (resultSet.next()){
                pageSize = resultSet.getInt(1);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        JDBCUtil.closeConn();
        return pageSize;
    }
    public List<Student> getDataList(int page, int pageSize) {
        List<Student> dataList = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        JDBCUtil.init();
        try {
            ResultSet resultSet = JDBCUtil.selectSql("SELECT * FROM student ORDER BY id LIMIT "+offset+", "+pageSize);
            while (resultSet.next()){
                Student student = new Student(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5),resultSet.getString(6));
                dataList.add(student);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        JDBCUtil.init();
        return dataList;
    }
}
