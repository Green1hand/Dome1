<%--
  Created by IntelliJ IDEA.
  User: 陈浩繁
  Date: 2020/10/13
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册账户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="static/css/public.css" media="all">

    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        body {
            background: #1e9fff url(static/images/login.png);
        }
        body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
        .layui-container {width: 100%;height: 100%;overflow: hidden}
        .admin-login-background {width:400px;height:300px;position:absolute;left:48%;top:40%;margin-left:-180px;margin-top:-100px;}
        .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
        .logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
        .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
        .login-form .layui-form-item {position:relative;}
        .login-form .layui-form-item label {position:absolute;left:10px;top:1px;width:38px;line-height:10px;text-align:center;color: #524646;}
        .login-form .layui-form-item input {padding-left:36px;}
        .captcha {width:60%;display:inline-block;}
        .captcha-img {display:inline-block;width:34%;float:right;}
        .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
    </style>

</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
         <div class="layui-form login-form">
            <form class="layui-form" action="" lay-filter="example">
                <div class="layui-form-item logo-title">
                    <h1>注册</h1>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="account" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" lay-verify="required" autocomplete="off" placeholder="请输入密码" value="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="phone" autocomplete="off" placeholder="请输入手机号" class="layui-input">
                    </div>
                </div>
                <div style="display: none" class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea name="remark" placeholder="备注信息" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><a href="/login">登入</a></label>
                    <div class="layui-input-block">
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="static/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="static/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="static/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form','jquery','layer'], function () {
        var form = layui.form
            , layer = layui.layer
            , $ = layui.jquery;

        // 粒子线条背景
        $(document).ready(function(){
            $('.layui-container').particleground({
                dotColor:'#7ec7fd',
                lineColor:'#7ec7fd'
            });
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            $.ajax({
                url:'register',
                type:'POST',
                data:JSON.stringify(data.field),
                contentType:'application/json',
                dataType:'json',
                success:function (data){
                    console.log(data)
                    if (data.code == 200) {
                        layer.msg('注册成功', function () {
                            location.href = 'login';
                        });
                    }else {
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });
    });
</script>

</body>
</html>
