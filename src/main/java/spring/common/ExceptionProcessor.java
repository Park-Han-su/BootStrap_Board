package spring.common;

import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("controller")
public class ExceptionProcessor {
	
	Logger logger = LoggerFactory.getLogger(ExceptionProcessor.class);
	
	@ExceptionHandler(LoginException.class)
	public String loginExcepion(LoginException le, HttpServletRequest request) {
		logger.error(le.getMessage(), le);
		request.setAttribute("uri", request.getContextPath()+"/member/login");
		request.setAttribute("msg", le.getMessage());
		return "common/alert";
	}
	
	@ExceptionHandler(MemberJoinException.class)
	public String MemberJoinExcepion(MemberJoinException me, HttpServletRequest request) {
		logger.error(me.getMessage(), me);
		request.setAttribute("uri", request.getContextPath()+"/member/join");
		request.setAttribute("msg", me.getMessage());
		return "common/alert";
	}
	
	
	@ExceptionHandler(RuntimeException.class)
	public String runtimeException(RuntimeException ex, HttpServletRequest request) {
		logger.error(ex.getMessage(), ex);
		request.setAttribute("uri", request.getContextPath()+"/board/list");
		request.setAttribute("msg", "RuntimeException");
		return "common/alert";
	}
	
	@ExceptionHandler(Exception.class)
	public String sqlException(Exception ex, HttpServletRequest request) {
		logger.error(ex.getMessage(), ex);
		request.setAttribute("uri", request.getContextPath()+"/board/list");
		request.setAttribute("msg", "SQLException");
		return "common/alert";
	}
	
	@ExceptionHandler(BindException.class)
	public String bindException(BindException ex, HttpServletRequest request) {
		logger.error(ex.getMessage(), ex);
		String errorCodes = ex.getBindingResult().getAllErrors()
				.stream()
				.map(error -> (((DefaultMessageSourceResolvable)error.getArguments()[0]).getDefaultMessage()+":"+error.getDefaultMessage()))
				.collect(Collectors.joining("\n"));
		request.setAttribute("uri", request.getContextPath()+"/board/list");
		request.setAttribute("msg", errorCodes);
		return "common/alert";
	}
}