package spring.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.common.MemberJoinException;
import spring.dao.member.MemberDAO;
import spring.dto.auth.AuthInfo;
import spring.dto.member.Member;

@Service
public class MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	public AuthInfo longinCheck(Member member) {
		Member DbMember = memberDAO.loginCheck(member);
		if(DbMember == null) 
			throw new spring.common.LoginException("아이디를 확인하세요");
		if(!DbMember.getPassword().equals(member.getPassword()))
			throw new spring.common.LoginException("비밀번호를 확인하세요");
		return new AuthInfo(DbMember.getId(), DbMember.getEmail(), DbMember.getName()); 
	}
	
	public int memberJoin(Member member) {
		Member checkMember = memberDAO.loginCheck(member);
		if(checkMember!=null) {
			throw new MemberJoinException("동일한 이메일이 존재합니다.");
		}
		return memberDAO.memberJoin(member);
	}
}
