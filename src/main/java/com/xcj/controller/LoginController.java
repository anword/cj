package com.xcj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xcj.config.Const;
import com.xcj.pojo.User;
import com.xcj.utils.ResponseMsg;

@Controller
public class LoginController {

	private static Logger log = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping("/login")
	public String signin() {
		return "thymeleaf/login";
	}
	
	@RequestMapping("/infoSysUser")
	public String infoSysUser() {
		return "thymeleaf/view/login";
	}

	@RequestMapping("/main")
	public String main(ModelMap map) {
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		map.addAttribute(Const.SESSION_USERNAME, session.getAttribute(Const.SESSION_USERNAME));
		return "thymeleaf/main";
	}

	@RequestMapping("/code")
	@ResponseBody
	public String code() {
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute("code", "abce");
		return "abce";
	}

	public static void main(String[] args) {
		String hashAlgorithmName = "MD5";
		String credentials = "administrator";
		int hashIterations = 1024;
		ByteSource credentialsSalt = ByteSource.Util.bytes("admin");
		Object obj = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);
		System.out.println(obj);
	}
	
	@ResponseBody
	@RequestMapping(value = "/code/auth")
	public ResponseMsg codeAuth(@RequestParam("code") String code) {
		
		// 获取当前的Subject
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		if (!session.getAttribute("code").equals(code)) {
			return ResponseMsg.errorMsg("请输入正确的验证码！！");
		}
		return ResponseMsg.ok();
	}

	@ResponseBody
	@RequestMapping(value = "/login_auth")
	public ResponseMsg login_auth(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) {
//		logger.info(">>>>>>>>>>>>>>>>用户信息： " + sysUser.getUserName() + " & " + sysUser.getUserPwd());
		String userName = user.getUsername();
		String userPwd = user.getPassword();
		// 获取当前的Subject
		Subject currentUser = SecurityUtils.getSubject();
	
		Session session = currentUser.getSession();
//		session.setAttribute(Const.SESSION_USER, sysUser);
		session.setAttribute(Const.SESSION_USERNAME, userName);
		

		if (!currentUser.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(userName, userPwd);
			// token.setRememberMe(true);
			try {
				log.info("对用户[" + userName + "]进行登录验证..验证开始");

				currentUser.login(token);

				log.info("对用户[" + userName + "]进行登录验证..验证通过");
			} catch (UnknownAccountException uae) {
				log.error("对用户[" + userName + "]进行登录验证..验证未通过,未知账户");
				return ResponseMsg.errorMsg("未知账户");
			} catch (IncorrectCredentialsException ice) {
				log.error("对用户[" + userName + "]进行登录验证..验证未通过,错误的凭证");
				return ResponseMsg.errorMsg("对用户[" + userName + "]进行登录验证..验证未通过,错误的凭证");
			} catch (LockedAccountException lae) {
				log.error("对用户[" + userName + "]进行登录验证..验证未通过,账户已锁定");
				return ResponseMsg.errorMsg("对用户[" + userName + "]进行登录验证..验证未通过,账户已锁定");
			} catch (ExcessiveAttemptsException eae) {
				log.error("对用户[" + userName + "]进行登录验证..验证未通过,错误次数过多");
				return ResponseMsg.errorMsg("对用户[" + userName + "]进行登录验证..验证未通过,错误次数过多");
			} catch (AuthenticationException ae) {
				// 通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
				log.error("对用户[" + userName + "]进行登录验证..验证未通过,堆栈轨迹如下");
				ae.printStackTrace();
				return ResponseMsg.errorMsg("对用户[" + userName + "]进行登录验证..验证未通过,用户名或密码不正确");
			}
		}
		return ResponseMsg.ok();

	}

}
