// \lkj20180323
var canGetCookie = 1;//是否支持存储Cookie 0 不支持 1 支持
var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
//默认账号密码

var truelogin = "admin";
var truepwd = "admin123";

var CodeVal = '';
Code();
function Code() {
	$.post(basePath+"/code", function (data) {
        CodeVal = data;
        showCheck(data);
    });
}
function showCheck(a) {
    CodeVal = a;
    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, 1000, 1000);
    ctx.font = "80px 'Hiragino Sans GB'";
    ctx.fillStyle = "#E8DFE8";
    ctx.fillText(a, 0, 100);
}
$(document).keypress(function (e) {
    // 回车键事件
    if (e.which == 13) {
        $('input[type="button"]').click();
    }
});
//粒子背景特效
$('body').particleground({
    dotColor: '#E8DFE8',
    lineColor: '#1b3273'
});
$('input[name="pwd"]').focus(function () {
    $(this).attr('type', 'password');
});
$('input[type="text"]').focus(function () {
    $(this).prev().animate({ 'opacity': '1' }, 200);
});
$('input[type="text"],input[type="password"]').blur(function () {
    $(this).prev().animate({ 'opacity': '.5' }, 200);
});
$('input[name="login"],input[name="pwd"]').keyup(function () {
    var Len = $(this).val().length;
    if (!$(this).val() == '' && Len >= 5) {
        $(this).next().animate({
            'opacity': '1',
            'right': '30'
        }, 200);
    } else {
        $(this).next().animate({
            'opacity': '0',
            'right': '20'
        }, 200);
    }
});
var open = 0;
layui.use('layer', function () {
    $('input[type="button"]').click(function () {
    	var flag = checkParams();
    	if(flag != false){
            //认证中..
            fullscreen();
            $('.login').addClass('test'); //倾斜特效
            setTimeout(function () {
                $('.login').addClass('testtwo'); //平移特效
            }, 300);
            setTimeout(function () {
                $('.authent').show().animate({ right: -320 }, {
                    easing: 'easeOutQuint',
                    duration: 600,
                    queue: false
                });
                $('.authent').animate({ opacity: 1 }, {
                    duration: 200,
                    queue: false
                }).addClass('visible');
            }, 500);
            //登陆
//            var JsonData = { userName: login, pwd: pwd, code: code };
            console.log(JSON.stringify($('#loginForm').serializeJSON()))
            
            	
        	$.ajax({
        		url: basePath+"/login_auth",
    			contentType: "application/json;charset=UTF-8",
        		type: "POST",
        		datType: "JSON",
        		data: JSON.stringify($('#loginForm').serializeJSON()),
        		async: false,
        		success: function (data) {
					 setTimeout(function () {
		                 $('.authent').show().animate({ right: 90 }, {
		                     easing: 'easeOutQuint',
		                     duration: 600,
		                     queue: false
		                 });
		                 $('.authent').animate({ opacity: 0 }, {
		                     duration: 200,
		                     queue: false
		                 }).addClass('visible');
		                 $('.login').removeClass('testtwo'); //平移特效
		             }, 2000);
		             setTimeout(function () {
		                 $('.authent').hide();
		                 $('.login').removeClass('test');
		                 if (data.code == '200') {
		
		                     //登录成功
		                     $('.login div').fadeOut(100);
		                     $('.success').fadeIn(1000);
		                     $('.success').html("登陆成功<br /><br />跳转到首页");
		                      window.location.href=basePath+"/index";
		                     // //跳转操作
		
		                 } else {
		                     AjaxErro(data);
		                 }
		             }, 2400);
                	
        		}
    		});
        }
        return false;
    })
})
var fullscreen = function () {
    elem = document.body;
    if (elem.webkitRequestFullScreen) {
        elem.webkitRequestFullScreen();
    } else if (elem.mozRequestFullScreen) {
        elem.mozRequestFullScreen();
    } else if (elem.requestFullScreen) {
        elem.requestFullscreen();
    } else {
        //浏览器不支持全屏API或已被禁用
    }
}
if(ajaxmockjax == 1){
    $.mockjax({
        url: 'Ajax/Login',
        status: 200,
        responseTime: 50,
        responseText: {"Status":"ok","Text":"登陆成功<br /><br />欢迎回来"}
    });
    $.mockjax({
        url: 'Ajax/LoginFalse',
        status: 200,
        responseTime: 50,
        responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
    });
}
function checkParams(){
    //  校验
    var username = $(".username").val();
    var password = $(".passwordNumder").val();
    var code = $(".ValidateNum").val();
    if(username == ''){
    	ErroMsg("用户名不能为空！！");
    	$(".username").focus();
        return false;
    }
    if(password == ''){
    	ErroMsg("密码不能为空！！");
    	$(".passwordNumder").focus();
        return false;
    }
    if(code == '' || code.length != 4){
    	ErroMsg("输入4位验证码！！");
    	$(".passwordNumder").focus();
        return false;
    }
    if("ok"!=ValidateUtils.checkUserName(username) || "ok"!=ValidateUtils.checkSimplePassword(password)){
    	ErroMsg("请您输入正确的用户名和密码");
        return false;
    }
//    if("ok"!=ValidateUtils.checkPicCode(CodeVal)){
//        //tips层-右
//        layer.tips(ValidateUtils.checkPicCode(CodeVal), '.ValidateNum', {
//            tips: [2, '#78BA32'], //还可配置颜色
//            tipsMore: true
//        });
//        return false;
//    }
//    if(picCode.toLowerCase()!=code.toLowerCase()){
//        //tips层-右
//        layer.tips("请您输入正确的验证码", '.ValidateNum', {
//            tips: [2, '#78BA32'], //还可配置颜色
//            tipsMore: true
//        });
//        return false;
//    }
    
    
    
    
    
    
//    if("ok"!=ValidateUtils.checkUserName(username) || "ok"!=ValidateUtils.checkSimplePassword(password)){
//        layer.alert("请您输入正确的用户名和密码");
//        return false;
//    }
//    if("ok"!=ValidateUtils.checkMobile(mobile)){
//        //tips层-右
//        layer.tips(ValidateUtils.checkMobile(mobile), '#mobile', {
//            tips: [2, '#78BA32'], //还可配置颜色
//            tipsMore: true
//        });
//        return false;
//    }
//    if("ok"!=ValidateUtils.checkPicCode(code)){
//        //tips层-右
//        layer.tips(ValidateUtils.checkPicCode(code), '#canvas', {
//            tips: [2, '#78BA32'], //还可配置颜色
//            tipsMore: true
//        });
//        return false;
//    }
//    if(picCode.toLowerCase()!=code.toLowerCase()){
//        //tips层-右
//        layer.tips("请您输入正确的验证码", '#canvas', {
//            tips: [2, '#78BA32'], //还可配置颜色
//            tipsMore: true
//        });
//        return false;
//    }
}
