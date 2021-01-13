package spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.dto.auth.AuthInfo;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		AuthInfo auth = (AuthInfo)session.getAttribute("member");
		
		String requestURI = request.getRequestURI();
		
		//세션체크 예외 페이지
        if (requestURI.indexOf("/board/list") > -1) { 
            return true;
        }else if(requestURI.indexOf("/board/detail") > -1){
        	return true;
        }
		
		if(auth == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		return true;
	}
	
}
