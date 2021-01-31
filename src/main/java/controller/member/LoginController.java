package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dto.member.Member;
import spring.dto.securityUser.AuthInfo;
import spring.service.member.MemberService;


@Controller
@RequestMapping("/member/")
public class LoginController {

	@Autowired
	MemberService loginService;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
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
			if(auth == null) {
				return "/common/alert";
			}else {
				session.setAttribute("member", auth);
				return "redirect:/board/list";
			}
	}
	
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		System.out.println("로그아웃 컨트롤러>>>>>");
//		return "redirect:/board/list";
//	}
}
