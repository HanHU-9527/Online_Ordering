<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/11/17
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>

    <%--<!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>--%>


    <link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script type="text/javascript">

        //加入购物车
        function addShopCar(foodId) {
            var dinnerTableId = $("#dinnerTableId").val();
            //foodTypeId   //刷新界面后为当前菜品类型
            var foodTypeId = $("#foodTypeId").val();
            //加入商品到购物车，需要知道foodId  dinnerTableId
           /* window.location.href = "${pageContext.request.contextPath}/shopCarServlet?dinnerTableId=" + dinnerTableId + "&foodId=" + foodId + "&foodTypeId=" + foodTypeId + "&method=add";*/
            window.location.href = "${pageContext.request.contextPath}/shopCarServlet?dinnerTableId=${dinnerTable.id}&foodId=" + foodId + "&foodTypeId=" + foodTypeId + "&method=add";
        }

        //购买数量输入框失去焦点事件
        function blurFn(obj, foodId, buyNum, dinnerTableId, foodTypeId) {
            //获取用户输入的对象
            var num = obj.value;

            //如果用户输入不符合规范，输入框值不变
            if (num < 1 || isNaN(num)) {
                obj.value = buyNum;
            } else if (num !== buyNum) {
                /*window.location.href = "${pageContext.request.contextPath}/shopCarServlet?foodId=" + foodId + "&dinnerTableId=" + dinnerTableId + "&buyNum=" + Math.ceil(num) + "&foodTypeId=" + foodTypeId + "&method=update";*/
                window.location.href = "${pageContext.request.contextPath}/shopCarServlet?foodId=" + foodId + "&dinnerTableId=${dinnerTable.id}&buyNum=" + Math.ceil(num) + "&foodTypeId=" + foodTypeId + "&method=update";
            }
        }


        //删除购物车的菜品
        function deleteFn(dinnerTableId, foodId, foodTypeId) {
           /* window.location.href = "${pageContext.request.contextPath}/shopCarServlet?dinnerTableId=" + dinnerTableId + "&foodId=" + foodId + "&foodTypeId=" + foodTypeId + "&method=delete";*/
            window.location.href = "${pageContext.request.contextPath}/shopCarServlet?dinnerTableId=${dinnerTable.id}&foodId=" + foodId + "&foodTypeId=" + foodTypeId + "&method=delete";
        }

        //占位/取消占位
        function orderDinner(dinnerTableId, tableStatus) {
           /* window.location.href = "${pageContext.request.contextPath}/dinnerTableStatusServlet?dinnerTableId=" + dinnerTableId + "&tableStatus=" + tableStatus;*/
            window.location.href = "${pageContext.request.contextPath}/dinnerTableStatusServlet?dinnerTableId=${dinnerTable.id}&tableStatus=" + tableStatus;
        }

        //下单
        function order(dinnerTableId) {
            if (${total != 0}) {
                /*window.location.href = "${pageContext.request.contextPath}/orderServlet?dinnerTableId=" + dinnerTableId + "&total=${total}&method=order";*/
                window.location.href = "${pageContext.request.contextPath}/orderServlet?dinnerTableId=${dinnerTable.id}&total=${total}&method=order";
            } else {
                alert("购物车为空！")
            }
        }

        //价格排序
        function priceSort() {

            //获取餐桌id和菜品类型id
            var foodTypeId = $("#foodTypeId").val();
            var dinnerTableId = $("#dinnerTableId").val();
            window.location.href = "${pageContext.request.contextPath}/indexServlet?method=sort&id=" + dinnerTableId + "&foodTypeId=" + foodTypeId;
        }

    </script>


    <style>
        img {
            object-fit: cover;
        }

        .col-xs-4 {
            overflow: hidden;
            margin: 0;
        }

        .list1 > div > ul > li > a {
            text-align: center;
            color: black;
        }

        .col-xs-2 {
            padding: 0;
        }

        .nothing {
            height: 50px;
            background: #1C1C1C;
            margin-top: 10px;
            border-radius: 6px;
        }

        .nothing > div > div > h1 {
            color: gray;
            font-size: small;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation" id="mynav" style="margin: 0">
    <div class="container ">
        <div class="navbar-header">
            <a class="navbar-brand">
                订餐系统
            </a>
            <span></span>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/index_1Servlet">选择餐桌</a></li>
                <li><a href="${pageContext.request.contextPath}/indexServlet?id=${dinnerTable.id}">主页</a></li>
                <li>
                    <a href="${pageContext.request.contextPath}/orderServlet?dinnerTableId=${dinnerTable.id}&method=checkOrder">我的订单</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/newsFindServlet?method=homefind">新闻中心</a></li>
                <li><a href="${pageContext.request.contextPath}/commentList_2.jsp">评论区</a></li>
            </ul>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown">
                        用户
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/findUserServlet?id=${user.ID}">个人中心</a></li>
                        <%--<li><a href="#">购物车</a></li>--%>
                        <%--<li><a href="#">设置</a></li>--%>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/userLogOfServlet">退出登录</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/admin_login.jsp">商家中心</a></li>
            </ul>
        </div>
    </div>
</nav>
<div id="myCarousel" class="carousel slide container"
     style="background-attachment: fixed ;background-position: center;height: 512px; overflow: hidden ;padding: 0; margin-top: 10px">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <c:forEach items="${foods_1s}" var="food_1" varStatus="s">
            <li data-target="#myCarousel" data-slide-to="${s.count}"></li>
        </c:forEach>

        <%--<li data-target="#myCarousel" data-slide-to="2"></li>--%>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="http://p1.meituan.net/codeman/826a5ed09dab49af658c34624d75491861404.jpg" style="width: 100%"
                 alt="First slide">
        </div>
        <c:forEach items="${foods_1s}" var="food_1">
            <div class="item">
                <a href="#" class="thumbnail">
                    <img src="${pageContext.request.contextPath}/upload/food/${food_1.img}" style=" width: 800px;height: 500px"
                         alt="Second slide">
                </a>>
            </div>
        </c:forEach>


    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container" style="margin-top: 10px">
    <div class="row" style="background:whitesmoke;padding: 10px;height:725px; border-radius: 6px">
        <div class="col-xs-2 " style="height: 100%">
            <div class="list1 panel panel-default" style="margin-bottom: 0;height: 300px">
                <div class="panel-heading" style="text-align: center;">全部分类</div>
                <div class="panel-body" style="height:260px;overflow-y: scroll">

                    <ul class="nav nav-pills nav-stacked ">

                        <c:forEach items="${foodTypes}" var="foodType">
                            <li>
                                <a href="${pageContext.request.contextPath}/indexServlet?foodTypeId=${foodType.id}&id=${dinnerTable.id}">${foodType.type_name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="list1 panel panel-default" style="margin-bottom: 0; height: 400px;">
                <div class="panel-heading" style="height: 10%; text-align: center;">${dinnerTable.table_Name}的购物车</div>
                <div class="panel-body" style="height: 60%; overflow-y:scroll;padding: 0">
                    <ul class="list-group">
                        <c:if test="${empty foodList}">
                            <p style="text-align: center;color: red">
                                <br>
                                购物车为空 ╮（╯＿╰）╭
                            </p>
                        </c:if>

                        <c:if test="${not empty foodList}">
                            <c:forEach items="${foodList}" var="foodList" varStatus="s">
                                <li class="list-group-item" style="padding: 12px 2px 2px">
                                    <div class="row-fluid">
                                        <a href="#" style="font-size: 13px">${foodList.food_name}</a>
                                        <div class="pull-right">
                                            <a><strong style="font-size: 13px;color: red">￥<fmt:formatNumber
                                                    value="${foodList.price * foodList.discount * foodList.buyNum}"
                                                    pattern="0.00"/></strong></a>
                                        </div>
                                    </div>
                                    <div class="row-fluid" style="padding-left: 80px;margin-top: 10px">
                                            <input name="id" value="${foodList.id}" type="hidden">
                                            <input name="buyNum" value="${foodList.buyNum}"
                                                   onblur="blurFn(this,${foodList.id},${foodList.buyNum},${dinnerTable.id},${foodList.foodType_id})"
                                                   style="width: 40px;height:20px;border-radius: 3px;border: 1px solid #a3a3a3; text-align: left;padding: 2px 4px;">
                                            份
                                        <button type="button" class="btn btn-default" style="padding: 2px;" onclick="deleteFn(${dinnerTable.id},${foodList.id},${foodList.foodType_id});">
                                            <img src="images/delete.svg" alt="删除" style="width: 15px;height: 15px">
                                        </button>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
                <div class="panel-footer" style=" height: 30%;width: 100%;margin-top: 10px">
                    总金额：￥<fmt:formatNumber value="${total}" pattern="0.00"/><br>
                    <%--餐桌id   餐桌状态 1正在使用，0空闲--%>
                    <c:if test="${dinnerTable.table_status == 1}">
                        <input type="button" onclick="orderDinner(${dinnerTable.id},0)" value="取消占位"
                               style="margin-top: 5px">
                        <%--dinnerTable--%>
                        <input type="button" onclick="order(${dinnerTable.id})" value="下单"
                               style="margin-top: 5px; float: right">
                    </c:if>
                    <c:if test="${dinnerTable.table_status == 0}">
                        <input type="button" onclick="orderDinner(${dinnerTable.id},1)" value="占位" style="float: right">
                    </c:if>


                </div>
            </div>
        </div>
        <div class="col-xs-10">
            <div class="panel panel-default">
                <div class="panel-heading" style="padding: 0">
                    <nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0">
                        <div class="container-fluid">
                            <div>
                                <ul class="nav navbar-nav">
                                    <li><a href="#">默认</a></li>
                                    <%--<li><a onclick="priceSort()">价格</a></li>--%>
                                    <li><a href="${pageContext.request.contextPath}/indexServlet?method=sort&id=${dinnerTable.id}">价格▼</a></li>

                                </ul>
                            </div>


                            <form action="${pageContext.request.contextPath}/indexServlet?method=leftRight&id=${dinnerTable.id}" class="navbar-form navbar-left" role="search" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="leftPrice" style="width: 70px"  placeholder="0.00">
                                    ~
                                    <input type="text" class="form-control" name="rightPrice" style="width: 70px"  placeholder="199.00">
                                </div>
                                <button type="submit" class="btn btn-default">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </form>


                            <form action="${pageContext.request.contextPath}/indexServlet?method=search&id=${dinnerTable.id}" class="navbar-form navbar-right" role="search" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="searchName" placeholder="搜索">
                                </div>
                                <button type="submit" class="btn btn-default">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </form>
                        </div>
                    </nav>
                </div>

                <div class="row" style="height: 648px;overflow-y: scroll">
                    <c:if test="${not empty foods}">
                    <c:forEach items="${foods}" var="food">
                        <div class="col-xs-6 col-md-3" style="width: 25%;">
                                <%--<div style="width: 100%;height: 100%">
                                    <div style="width: 100%; height: 80%;">
                                    <a href="${pageContext.request.contextPath}/findFoodDetailServlet?dinnerTableId=${dinnerTable.id}&foodID=${food.id}" class="thumbnail">
                                            <img src="${pageContext.request.contextPath}/upload/food/${food.img}" alt="${food.food_name}" width="100%"; height="80%"/>
                                    </a>
                                    </div>
                                    <div style="width: 100% ;height: 20%">

                                            <input type="hidden" id="dinnerTableId" name="dinnerTableId" value="${dinnerTable.id}">
                                            <input type="hidden" id="foodTypeId" name="foodTypeId" value="${food.foodType_id}">

                                            <h5>${food.food_name}</h5> <button type="button" onclick="addShopCar(${food.id})">加入购物车</button>
                                    </div>

                                </div>--%>
                            <div class="panel panel-default">
                                <div class="page-heading" style="padding-top: 15px">
                                    <a href="${pageContext.request.contextPath}/findFoodDetailServlet?dinnerTableId=${dinnerTable.id}&foodID=${food.id}"
                                       class="thumbnail" style="margin-bottom: 0">
                                        <img src="${pageContext.request.contextPath}/upload/food/${food.img}"
                                             alt="${food.food_name}" style="width: 100%;height: 120px"/>
                                    </a>
                                </div>
                                <div class="panel-body" style="padding: 10px 0 0">
                                    <input type="hidden" id="dinnerTableId" name="dinnerTableId"
                                           value="${dinnerTable.id}">
                                    <input type="hidden" id="foodTypeId" name="foodTypeId" value="${food.foodType_id}">
                                    <div style="width: 100%;height: 30px;padding-left: 10px">
                                        <div style="float: left">
                                            <span style="color: red;margin-top: 5px;font-size: 20px">
                                                <span style="font-size: 14px">￥</span>
                                                    ${food.price*food.discount}
                                            </span>
                                        </div>
                                        <div style="float: left;margin: 6px 5px 0">
                                            <s style="color: #0f0f0f;font-size: 14px">
                                                ￥${food.price}
                                            </s>
                                        </div>
                                    </div>
                                    <div>
                                        <div style="margin: 10px;">${food.food_name}</div>
                                        <div class="pull-right">
                                            <button type="button" class="btn btn-default"
                                                    onclick="addShopCar(${food.id})" style="border: 0">
                                                <img src="images/ShoppingCart.png" alt="加入购物车"
                                                     style="width: 20px;height: 20px">
                                                <span style="font-size: 13px">加入购物车</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </c:if>

                    <c:if test="${empty foods}">
                        神马也没有
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="height: 100px">

</div>

<div class="container-fluid " style="height: 120px;background: #1C1C1C">
    <div class="row">
        <div class="col-xs-12">
            <h1>网页尾部</h1>
        </div>
    </div>
</div>
</body>
</html>