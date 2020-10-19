<%--
  Created by IntelliJ IDEA.
  User: 陈浩繁
  Date: 2020/10/12
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>主页一</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="static/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="static/css/public.css" media="all">
</head>
<style>
    .layui-top-box {padding:40px 20px 20px 20px;color:#fff}
    .panel {margin-bottom:17px;background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
    .panel-body {padding:15px}
    .panel-title {margin-top:0;margin-bottom:0;font-size:14px;color:inherit}
    .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
    .layui-red {color:red}
    .main_btn > p {height:40px;}
</style>
<body>
<div class="layuimini-container">
    <div class="layuimini-main layui-top-box">
        <div class="layui-row layui-col-space10">

            <div class="layui-col-md3">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-cyan">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-blue">实时</span>
                                <h5>用户统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">1234</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1234</div>
                                <small>当前分类总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-md3">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-blue">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-cyan">实时</span>
                                <h5>商品统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">1234</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1234</div>
                                <small>当前分类总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-md3">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-green">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-orange">实时</span>
                                <h5>浏览统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">1234</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1234</div>
                                <small>当前分类总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="col-xs-6 col-md-3">
                    <div class="panel layui-bg-orange">
                        <div class="panel-body">
                            <div class="panel-title">
                                <span class="label pull-right layui-bg-green">实时</span>
                                <h5>订单统计</h5>
                            </div>
                            <div class="panel-content">
                                <h1 class="no-margins">1234</h1>
                                <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1234</div>
                                <small>当前分类总记录数</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-box">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md12">
                <blockquote class="layui-elem-quote main_btn">
                    <p>本模板基于layui2.5.4以及font-awesome-4.7.0进行实现。layui开发文档地址：<a class="layui-btn layui-btn-xs layui-btn-danger" target="_blank" href="http://www.layui.com/doc">layui文档</a></p>
                    <p>技术交流QQ群：<a target="_blank" href="error.jsp"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="layuimini" title="layuimini"></a>（加群请备注来源：如gitee、github、官网等）</p>
                    <%--<p>喜欢此后台模板的可以给我的GitHub和Gitee加个Star支持一下</p>--%>
                    <%--<p>GitHub地址：
                        <iframe src="https://ghbtns.com/github-btn.html?user=zhongshaofa&repo=layuimini&type=star&count=true" frameborder="0" scrolling="0" width="100px" height="20px"></iframe>
                        <iframe src="https://ghbtns.com/github-btn.html?user=zhongshaofa&repo=layuimini&type=fork&count=true" frameborder="0" scrolling="0" width="100px" height="20px"></iframe>
                    </p>--%>
<%--
                    <p>Gitee地址：<a href="https://gitee.com/zhongshaofa/layuimini" target="_blank"><img src="https://gitee.com/zhongshaofa/layuimini/badge/star.svg?theme=dark" alt="star"></a> <a href="https://gitee.com/zhongshaofa/layuimini" target="_blank"><img src="https://gitee.com/zhongshaofa/layuimini/badge/fork.svg?theme=dark" alt="fork"></a></p>
--%>
                </blockquote>
            </div>
        </div>
    </div>

    <div class="layui-box">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md6">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>昵称</th>
                        <th>加入时间</th>
                        <th>签名</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>测试1</td>
                        <td>2020-11-29</td>
                        <td>人生就像是一场修行</td>
                    </tr>
                    <tr>
                        <td>测试2</td>
                        <td>2020-11-28</td>
                        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                    </tr>
                    <tr>
                        <td>测试3</td>
                        <td>2020-11-28</td>
                        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                    </tr>
                    <tr>
                        <td>测试4</td>
                        <td>2020-11-28</td>
                        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="layui-col-md6">
                <ul class="layui-timeline">
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">10月18日</h3>
                            <p>
                                使用了一段时间此框架，还是不太行，前端学的太烂/(ㄒoㄒ)/~~
                                <br>不过我是来练习后端的O(∩_∩)O
                                <br>加油！💪 加油！💪<i class="layui-icon"></i>
                            </p>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title">10月5日</h3>
                            <p>开始了解这个模板，并跟着教程开始搭建项目</p>
                            <ul>
                                <li>艰难</li>
                            </ul>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">过去</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="static/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
</body>
</html>