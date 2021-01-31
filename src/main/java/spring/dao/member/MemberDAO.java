package spring.dao.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.dto.member.Member;
import spring.security.CustomMemberDetails;
import spring.security.CustomMemberDetailService;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	public CustomMemberDetails login(String email) {
		CustomMemberDetails users = sqlSession.selectOne("mappers.MemberMapper.login", email);
		return users;
	}
	
	public Member loginCheck(Member member) {
		return sqlSession.selectOne("mappers.MemberMapper.selectMember", member);
	}
	
	public int memberJoin(Member member) {
		return sqlSession.insert("mappers.MemberMapper.memberJoin", member);
	}
	
	public Member emailCheck(Member member) {
		return sqlSession.selectOne("mappers.MemberMapper.selectMember", member);
	}
}
