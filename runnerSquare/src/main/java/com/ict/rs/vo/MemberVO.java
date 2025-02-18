package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	public int no;
	public String id;
	public String pw;
	public String name;
	public String nickName;
	public String role;	// 권한

	public String email;
	public String tel;
	public String tel1;
	public String tel2;
	public String tel3;
	public String addr;

	public String birth;
	public String gender;
	public String preferPace;	// 선호페이스
	public String status;	// 상태
	public String createdAt;	// 생성일
	public String updatedAt;	// 수정일
	public String passwordLastModifiedAt;	// 패스워드 변경일

}
