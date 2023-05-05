package com.entity;


public class Student {

  private String id;
  private String name;
  private String class_stu;
  private String sex;
  private String age;
  private String place;
  public Student() {
  }
  public Student(String id,  String class_stu,String name, String sex, String age, String place) {
    this.id = id;
    this.name = name;
    this.class_stu = class_stu;
    this.sex = sex;
    this.age = age;
    this.place = place;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getClass_stu() {
    return class_stu;
  }

  public void setClass_stu(String class_stu) {
    this.class_stu = class_stu;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getAge() {
    return age;
  }

  public void setAge(String age) {
    this.age = age;
  }


  public String getPlace() {
    return place;
  }

  public void setPlace(String place) {
    this.place = place;
  }

}
