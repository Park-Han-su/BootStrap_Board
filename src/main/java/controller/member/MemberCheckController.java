package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import spring.dto.member.Member;
import spring.service.member.MemberService;

@RestController
@RequestMapping("/member")
public class MemberCheckController {

	@Autowired
	MemberService memberSerivice;
	
	@GetMapping(value="/emailCheck")
	public ResponseEntity ReadComment(Member member) {
		Member check = member;
		return ResponseEntity.ok(memberSerivice.emailCheck(member));
	}
}
