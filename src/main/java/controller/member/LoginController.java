package controller.member;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dto.auth.AuthInfo;
import spring.dto.member.Member;
import spring.service.member.MemberService;


@Controller
@RequestMapping("/member/")
public class LoginController {

	@Autowired
	MemberService loginService;
	
	@GetMapping("/login")
	public String loginPage() {
		return "/member/login";
	}
	
//	@GetMapping("/loginCheck")
//	public String loginCheckGet() {
//		return "redirect:/member/login";
//	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(Member member, HttpSession session){
		AuthInfo auth = loginService.longinCheck(member);
			if(auth != null) {
				session.setAttribute("member", auth);
				return "redirect:/board/list";
			}else {
				return "/member/loginCheck";
			}
	}
}
