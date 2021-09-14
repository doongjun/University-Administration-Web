package kr.co.metanet.university.service.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

@Service
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	UserDbService userDbService;
	
	@Override
	public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException {
		UserEntity customUser = userDbService.getUser(loginId);
		if(customUser == null)
			throw new UsernameNotFoundException("사용자가 입력한 아이디에 해당하는 사용자를 찾을 수 없습니다.");
		
		// 해당 정보를 CustomUserDetails객체에 저장한다.
		CustomUserDetails customUserDetails = new CustomUserDetails();
		customUserDetails.setUsername(customUser.getLoginUserId());
		customUserDetails.setPassword(customUser.getPassword());
		
		List<UserRoleEntity> customRoles = userDbService.getUserRoles(loginId);
		
		//로그인한 사용자의 권한 정보를 GrantedAuthority를 구현하고 있는 SimpleGrantedAuthority객체에 담아 리스트에 추가한다.
		//MemberRole 이름은 "ROLE_"로 시작되어야 한다.
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		if(customRoles != null) {
			for(UserRoleEntity customRole : customRoles) {
				authorities.add(new SimpleGrantedAuthority(customRole.getRoleName()));
			}
		}
		
		//CustomUserDetails 객체에 권한 목록 (authorities)를 설정한다.
		customUserDetails.setAuthorities(authorities);
		customUserDetails.setEnabled(true);
		customUserDetails.setAccountNonExpired(true);
		customUserDetails.setAccountNonLocked(true);
		customUserDetails.setCredentialsNonExpired(true);
		return customUserDetails;
	}

}
