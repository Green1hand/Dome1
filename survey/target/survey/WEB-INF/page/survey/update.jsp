<%--
  Created by IntelliJ IDEA.
  User: 陈浩繁
  Date: 2020/10/13
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <input type="hidden" name="id" lay-verify="required" autocomplete="off" value="${survey.id}" class="layui-input">
            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="required"  autocomplete="off" placeholder="请输入标题" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">说明</label>
                <div class="layui-input-block">
                    <textarea name="remark" placeholder="说明信息" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">限制</label>
                <div class="layui-input-inline">
                    <select name="bounds" lay-filter="bounds" lay-verify="required">
                        <option value="0">不限制</option>
                        <option value="1">IP限制</option>
                    </select>
                </div>
            </div>
            <%--<hr>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">访问规制</label>
                <div class="layui-input-inline">
                    <select name="rules" lay-filter="rules" lay-verify="required">
                        <option value="0">公开访问</option>
                        <option value="1">密码访问</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="password" id="password" style="display: none" lay-verify="pass" placeholder="请设置密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="start_time" id="start_time" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="end_time" id="end_time" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">匿名访问</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="anon" lay-skin="switch" lay-text="ON|OFF" value="1">
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
    layui.use(['form', 'layedit', 'laydate','jquery','layer'], function(){
        var form = layui.form
            , $ = layui.jquery
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#start_time'
        });
        laydate.render({
            elem: '#end_time'
        });

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
        //监听访问规则
        form.on('select(rules)', function (data){
            if(data.value == "1"){
                $('#password').show();
            }else{
                $('#password').hide();
            }
        });

        if("${survey.rules}"==="1"){
            $('#password').show();
        }

        //填充数据
        form.val('demo2', {
            "title":"${survey.title}",
            "remark":"${survey.remark}",
            "bounds":"${survey.bounds}",
            "start_time":'<fmt:formatDate value="${survey.start_time}" pattern="yyyy-MM-dd"/>',
            "end_time":'<fmt:formatDate value="${survey.end_time}" pattern="yyyy-MM-dd"/>',
            "rules":"${survey.rules}",
            "password":"${survey.password}",
            <c:if test="${survey.anon eq 1}">
                "anon":"${survey.anon}",
            </c:if>
        });
    });

</script>

</body>
</html>
