<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>上上德盛集团MES系统</title>
    <link rel="shortcut icon" href="${APP_PATH}/static/img/sss.ico">
    <link href="${APP_PATH}/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${APP_PATH}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${APP_PATH}/static/css/animate.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/style.min.css?v=4.0.0" rel="stylesheet">
    <script src="${APP_PATH}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${APP_PATH}/static/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${APP_PATH}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${APP_PATH}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${APP_PATH}/static/js/plugins/layer/layer.min.js"></script>
    <script src="${APP_PATH}/static/js/hplus.min.js?v=4.0.0"></script>
    <script src="${APP_PATH}/static/js/contabs.min.js"></script>
    <script>
    $(document).ready(function() {
    	fillChildrenByMenuPid(1, 1);
   		 /* $('.J_menuItem').click(function(){
      		  $(this).addClass('Csanj').parent().siblings().children('.J_menuItem').removeClass('Csanj');
      		  $(this).parent().parent().parent().siblings().find('.Csanj').removeClass('Csanj');
      	  })  */ 
      	$("#side-menu").metisMenu();
      	new Contabs().init();
	});
    var menuList = eval('${pd.menuList}');
    var str = "";
    function fillChildrenByMenuPid(menuPid) {
    	for ( var index in menuList) {
    	    if (menuList[index].parentMenu.menuId == 1) {
    	    	str += "<li>";
	   		  	str += "<a href=\"#\"><i class=\""+menuList[index].iconUrl+"\"></i><span class=\"nav-label\">"+menuList[index].menuName+"</span>";
	   		 	str += "<span class=\"fa arrow\"></span> </a>";
	   		 	if (menuList[index].isLeaf == 0) {
	   		 		str += "<ul class=\"nav nav-second-level\">";
	   		 		courion(menuList[index].menuId);
	   		 		str += "</ul>";
    	    	}
	   		 	str += "</li>";
	   		 $("#side-menu").append(str);
	   		 str = "";
    	    }
        }
    } 
    
    function courion(menuPid){
   		for (var index in menuList) {
   			if(menuList[index].parentMenu.menuId == menuPid) {
	   			if(menuList[index].isLeaf == 0) {
	   				str += "<li>";
		   		  	str += "<a href=\"#\"><i class=\""+menuList[index].iconUrl+"\"></i><span class=\"nav-label\">"+menuList[index].menuName+"</span>";
		   		 	str += "<span class=\"fa arrow\"></span> </a>";
		   		 	str += "<ul class=\"nav nav-second-level\">";
		   		 	courion(menuList[index].menuId);
		   		 	str += "</ul>";
		   		 	str += "</li>";
	   			}else {
	   		  		str += "<li>";
	  				str += "<a class=\"J_menuItem\" target='iframe0' href=\"${APP_PATH}"+menuList[index].menuUrl+"\"><i class=\""+menuList[index].iconUrl+"\"></i>"+menuList[index].menuName+"</a>";	
	  				str += "</li>"; 
	  			}
   			}
   		}
    }
    </script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${APP_PATH}/static/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                               <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${pd.CURRENTUSER.userName }</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li>
                                	<a class="J_menuItem" href="${APP_PATH}/infoSysUser"><i class="fa fa-user"></i> 个人信息</a>
                            	</li>
	                            <li>
	                                <a class="J_menuItem" href="${APP_PATH}/updateSysUserPwd"><i class="fa fa-edit"></i> 修改密码</a>
	                            </li>
	                            <li>
                                	<a class="J_menuItem" href="${APP_PATH}/logout"><i class="fa fa-sign-out"></i> 安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">上上</div>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">0</span>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">0</span>
                            </a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${APP_PATH}/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${APP_PATH}/mgrSysUsers" frameborder="0" data-id="${APP_PATH}/mgrSysUsers" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2016-2017 <a href="#" target="_blank">上上德盛</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">
                <ul class="nav nav-tabs navs-3">
                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3><i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定宽度</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                                     <a href="#" class="s-skin-0">
                                        默认皮肤
                                     </a>
                                </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-1">
                                        蓝色主题
                                    </a>
                                </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-3">
                                        黄色/紫色主题
                                    </a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
	    /**
	     * 在线用户实时监控
	     */
	    var user = "Sinar"; //用于即时通讯（ 当前登录用户）
	    $(function() {
	    	user = "${pd.CURRENTUSER.userName }"; //用于即时通讯（ 当前登录用户）
	    	online(); //连接在线管理
	    });
	
	    /**
	     * 在线用户实时监控
	     */
	    var locat = (window.location + '').split('/');
	    $(function() {
	    	if ('main' == locat[3]) {
	    		locat = locat[0] + '//' + locat[2];
	    	} else {
	    		locat = locat[0] + '//' + locat[2] + '/' + locat[3];
	    	}
	    	//console.log("locat: " + locat);
	    });
	
	    //在线管理
	    var websocket;
	    function online() {
	    	if (window.WebSocket) {
	    		websocket = new WebSocket(encodeURI('ws://127.0.0.1:8889'));
	
	    		websocket.onopen = function() {
	    			//console.log("CurrentUser: " + user);
	    			var dateTime = getNowFormatDate();
	    			//连接成功
	    			websocket.send('[join]' + user + "@" + dateTime);
	    		};
	    		websocket.onerror = function() {
	    			//连接失败
	    		};
	    		websocket.onclose = function() {
	    			//连接断开
	    		};
	    		//消息接收
	    		websocket.onmessage = function(message) {
	    			//console.log(">>>>>>>>>>>>>>>>>>> message = " + JSON.stringify(message));
	    			//console.log(">>>>>>>>>>>>>>>>>>> message.data = " + message.data);
	    			var message = JSON.parse(message.data);
	    			if (message.type == 'count') {
	    				userCount = message.msg;
	    			} else if (message.type == 'goOut') {
	    				goOut("此用户在其它终端已经早于您登录,您暂时无法登录");
	    			} else if (message.type == 'thegoout') {
	    				goOut("您被系统管理员强制下线");
	    			} else if (message.type == 'userlist') {
	    				userlist = message.list;
	    			}
	    		};
	    	}
	    }
	
	    //在线总数
	    var userCount = 0;
	    function getUserCount() {
	    	websocket.send('[count]' + user);
	    	return userCount;
	    }
	
	    //用户列表
	    var userlist = "";
	    function getUserlist() {
	    	websocket.send('[getUserlist]' + user);
	    	return userlist;
	    }
	
	    //强制下线
	    function goOut(msg) {
			alert(msg);
	    	window.location.href = locat + "/logout";
	    }
	
	    //强制某用户下线
	    function goOutUser(theuser) {
	    	websocket.send('[goOut]' + theuser);
	    }
	    
	    function getNowFormatDate() {
	        var date = new Date();
	        var seperator1 = "-";
	        var seperator2 = ":";
	        var month = date.getMonth() + 1;
	        var strDate = date.getDate();
	        var hour = date.getHours();
	        var min = date.getMinutes();
	        var sec = date.getSeconds();
	        if (month >= 1 && month <= 9) {
	            month = "0" + month;
	        }
	        if (strDate >= 0 && strDate <= 9) {
	            strDate = "0" + strDate;
	        }
	        if (hour >= 0 && hour <= 9) {
	        	hour = "0" + hour;
	        }
	        if (min >= 0 && min <= 9) {
	        	min = "0" + min;
	        }
	        if (sec >= 0 && sec <= 9) {
	        	sec = "0" + sec;
	        }
	        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	                + " " + hour + seperator2 + min + seperator2 + sec;
	        return currentdate;
	    }
    </script>
</body>
</html>