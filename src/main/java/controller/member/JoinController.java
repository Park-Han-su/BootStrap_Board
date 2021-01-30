package controller.member;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dto.member.Member;
import spring.service.member.MemberService;

@Controller
@RequestMapping("/member/")
public class JoinController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@GetMapping("/join")
	public String MemberJoinPage() {
		return "/member/join";
	}
	
	@PostMapping("/join")
	public String MemberJoin(@Valid Member member, HttpServletRequest request) {
		String FormPass = member.getPassword();
		String BCryptpwd = pwdEncoder.encode(FormPass);
		member.setPassword(BCryptpwd);
		int joinMember = memberService.memberJoin(member);
		if(joinMember==1) {
			request.setAttribute("msg", "등록완료");
			request.setAttribute("uri", request.getContextPath()+"/board/list");
		}
		return "common/alert";
	}
}
