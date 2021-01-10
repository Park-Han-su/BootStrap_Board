package spring.sql;

import org.apache.ibatis.annotations.Mapper;

import spring.dto.member.Member;

@Mapper
public interface MemberMapper {

	public Member login(Member member);
	public Member memberJoin(Member member);
}
