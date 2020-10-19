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
    <title>添加账户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../static/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <form class="layui-form" action="" lay-filter="demo2">
            <input type="hidden" name="id" value="${admin.id}" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="account" readonly unselectable="on" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <input type="hidden" name="password" lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" lay-verify="phone" autocomplete="off" placeholder="请输入手机号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea name="remark" placeholder="备注信息" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="../static/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form','jquery','layer'], function () {
        var form = layui.form
            , layer = layui.layer
            , $ = layui.jquery;
        //监听提交
        var index = parent.layer.getFrameIndex(window.name);//获取窗口的索引
        form.on('submit(demo1)', function (data) {

            $.ajax({
                url:'update',
                type:'POST',
                data:JSON.stringify(data.field),
                contentType:'application/json',
                dataType:'json',
                success:function (data){
                    layer.msg(data.msg,
                            {time:500},
                        function (){
                            parent.layer.close(index);
                        });
                }
            });
            return false;
        });
        //表单初始赋值
        form.val('demo2', {
            "account":"${admin.account}",
            "password":"${admin.password}",
            "name":"${admin.name}",
            "phone":"${admin.phone}",
            "remark":"${admin.remark}"
        })
    });

</script>

</body>
</html>
