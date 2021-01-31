package spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import spring.dao.member.MemberDAO;

@Component
public class CustomMemberDetailService implements UserDetailsService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		CustomMemberDetails users = memberDAO.login(email);
		if(users == null) {
			 throw new UsernameNotFoundException("useremail " + email + " not found");
		}
		System.out.println("**************Found user***************");
		System.out.println("email : " + users.getUsername());
		return users;
	}

}
