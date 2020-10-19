<%--
  Created by IntelliJ IDEA.
  User: 陈浩繁
  Date: 2020/10/13
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../static/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>查询条件</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">标题</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-inline">
                                <input type="text" name="state" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">创建人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="edit"> 修改 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="set"> 设计问卷 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="Preview"> 预览问卷 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="get"> 发布问卷 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="Details"> 问卷详情 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%--<script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>--%>
    </div>
</div>
<script src="../static/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: 'query',
            toolbar: '#toolbarDemo',
            /*contentType: 'application/json',*/
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 180, title: 'ID', sort: true},
                {field: 'title', width: 235, title: '问卷标题'},
                {field: 'remark', width: 400, title: '问卷说明'},
                {field: 'start_time', width: 200, title: '开始时间'},
                {field: 'end_time', width: 200, title: '结束时间'},
                {field: 'state', title: '状态', width: 100,sort: true},
                {field: 'name', title: '创建人', width: 100},
                {field: 'creator_time', title: '创建时间', width: 200, sort: true},
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            /*layer.alert(result, {
                title: '最终的搜索信息'
            });*/
            if(data.field.title == ""){
                data.field.title=null;
            }
            if(data.field.state == ""){
                data.field.state=null;
            }
            if(data.field.name == ""){
                data.field.name=null;
            }
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                },
                where: {
                    /*searchParams: result*/
                    "title":data.field.title,
                    "state":data.field.state,
                    "name":data.field.name
                }
            }, 'data');
            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: 'add',
                    end:function (){
                        table.reload('currentTableId');
                    }
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }

                if(arr.length < 1){
                    layer.msg("请至少选择一张问卷！",{time:1000});
                    return ;
                }

                $.ajax({
                    url:'delete',
                    type:'POST',
                    data:'ids='+arr.join(","),
                    /*contentType:'application/json',*/
                    dataType:'json',
                    success:function (data){
                        layer.msg(data.msg,
                            {time:500},
                            function (){
                                table.reload('currentTableId');
                            }
                        );
                    }
                });
            }else if (obj.event === 'edit') {  // 监听修改操作

                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }
                if(arr.length != 1){
                    layer.msg("请选择一张问卷！",{time:1000});
                    return ;
                }

                var index = layer.open({
                    title: '修改用户',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: 'detail?id='+arr[0],
                    end:function (){
                        table.reload('currentTableId');
                    }
                });
            }else if (obj.event === 'set') {  // 设计问卷操作

                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }
                if(arr.length != 1){
                    layer.msg("请选择一张问卷！",{time:1000});
                    return ;
                }

                var index = layer.open({
                    title: '问卷设计',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: 'set',
                    end:function (){
                        table.reload('currentTableId');
                    }
                });
            }else if (obj.event === 'Preview') {  // 预览问卷操作

                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }
                if(arr.length != 1){
                    layer.msg("请选择一张问卷！",{time:1000});
                    return ;
                }

                var index = layer.open({
                    title: '问卷设计',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: 'Preview',
                    end:function (){
                        table.reload('currentTableId');
                    }
                });
            }else if (obj.event === 'get') {  // 发布问卷操作

                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }
                if(arr.length != 1){
                    layer.msg("请选择一张问卷！",{time:1000});
                    return ;
                }

                var index = layer.open({
                    title: '问卷设计',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: 'get',
                    end:function (){
                        table.reload('currentTableId');
                    }
                });
            }else if (obj.event === 'Details') {  // 问卷详情操作

                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }
                if(arr.length != 1){
                    layer.msg("请选择一张问卷！",{time:1000});
                    return ;
                }

                var index = layer.open({
                    title: '问卷设计',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: 'Details',
                    end:function (){
                        table.reload('currentTableId');
                    }
                });
            }
        });

    });
</script>

</body>
</html>