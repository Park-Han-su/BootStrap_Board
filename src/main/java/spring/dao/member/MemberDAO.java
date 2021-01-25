package spring.dao.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.dto.member.Member;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	public Member loginCheck(Member member) {
		return sqlSession.selectOne("mappers.MemberMapper.login", member);
	}
	
	public int memberJoin(Member member) {
		return sqlSession.insert("mappers.MemberMapper.memberJoin", member);
	}
}
