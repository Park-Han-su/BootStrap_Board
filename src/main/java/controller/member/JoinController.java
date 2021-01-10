package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("/join")
	public String MemberJoinPage() {
		return "/member/join";
	}
	
	@PostMapping("/join")
	public String MemberJoin(Member meber) {
		memberService.memberJoin(meber);
		return "redirect:/board/list";
	}
}
