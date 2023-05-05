<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>注册</title>
    <meta charset="UTF-8">

    <style>
        .bjimg{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            min-width: 1000px;
            z-index: -10;
            zoom: 1;
            background-color: #ffffff;
            background-image: url(img/海洋.jpg) ;
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            background-position: center 0;
        }
    </style>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>

    <script type="text/javascript">
        var S ;
        $(function(){
            $("#inputEmail").blur(function(){
                var uname = $(this).val();
                if(uname==""){
                    $("#remind").html("邮箱不能为空");
                }else{
                    // $.ajax方法实现
                    $.ajax({
                        url:"idTools.jsp",
                        type:"get",
                        data:"uname="+uname,
                        dataType:"text",
                        async:false,
                        success:function(result){
                            $("#remind").html(result);
                            S = result;
                        }
                    });
                }
            });
        });
    </script>
    <script type="text/javascript">
        function s(){
            var pwd = document.getElementById("inputPassword1").value;
            var pwd_ = document.getElementById("inputPassword2").value;
            var ty = document.getElementById("inputType").value;
            if(pwd!=pwd_){
                alert("密码输入不相同，请重新输入！");
                return false;
            }
            if(S == "邮箱已存在"){
                alert("用户名已存在，请重新输入！");
                return false;
            }
            if(ty == 2){
                if(H == "邮箱或者身份码错误、或者身份码已被激活！"){
                    alert("邮箱或者身份码错误、或者身份码已被激活！");
                    return false;
                }
            }
            if(code_judge != null){
                alert("用户身份码错误！刷新后重新输入信息注册！！！");
                return false;
            }
            return true;
        }
    </script>
    <style>
        .back{
            position: fixed;
            width: 70%;
            height: 80%;
            background-color: rgba(255, 255, 255, 0.78);
            border-radius: 6px;
            z-index: 0;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
        }
    </style>

</head>
<body>
<div class="bjimg"></div>
<%@include file="head.jsp"%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <br><br><br>
            <h1 class="text-center"style="color:#ffffff;font-family: '方正粗黑宋简体'">
                注册
            </h1><br><br>
            <div class="row clearfix" style="color: #FFFFFF;">
                <div class="col-md-4 column"></div>
                <form class="form-horizontal" role="form" action="registerTools.jsp" method="post" onsubmit="return s()">
                    <div class="col-md-4 column">
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control"  autocomplete="off" id="inputName" name="name" required="required"/>
                            </div>
                        </div><br>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" autocomplete="off"  id="inputEmail" name="email" required="required"/>
                                <span id="remind" style="color: #ffffff;"></span>
                            </div>
                        </div><br>
                        <div class="form-group">
                            <label for="inputTel" class="col-sm-3 control-label">电话</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" autocomplete="off"  id="inputTel" name="tel" required="required"/>
                            </div>
                        </div><br>
                        <div class="form-group">
                            <label for="inputPassword1" class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" autocomplete="off"  id="inputPassword1" name="password" required="required"/>
                            </div>
                        </div><br>
                        <div class="form-group">
                            <label for="inputPassword2" class="col-sm-3 control-label">确认密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" autocomplete="off"  id="inputPassword2" name="password_" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bot" class="col-sm-1 control-label"></label>
                            <div class="col-sm-11">
                                <button type="submit" id="bot" class="btn btn-block btn-default btn-primary">注册</button>
                                <font color="red">请牢记以上信息！注册表示同意用户协议！</font>
                                <font color="black" style="float: right;color: #FFFFFF">已有账号？<a href="login.jsp?name=成员登录"><font style="color: #FFFFFF">返回登录</font></a></font>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="col-md-4 column">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
