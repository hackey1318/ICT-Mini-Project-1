package com.ict.rs.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.ict.rs.vo.constant.member.MemberRole;
import com.ict.rs.vo.constant.member.MemberStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	public int no;

	@NotBlank
	@JsonProperty("id")
	@Size(min = 5, max = 10)
	@Pattern(regexp = "^[A-Za-z][A-Za-z0-9_$]{4,9}$", message = "아이디는 5~10자이며, 첫 문자는 영문자로 시작해야 합니다.")
	public String id;

	@NotBlank
	@JsonProperty("pw")
	@Size(min = 8, max = 16)
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,16}$",
			message = "비밀번호는 8~16자이며, 영문 대소문자, 숫자, 특수문자(!@#$%^&*)를 포함해야 합니다.")
	public String pw;

	@JsonProperty("name")
	public String name;

	@JsonProperty("nickName")
	public String nickName;

	@JsonProperty("email")
	public String email;

	@JsonProperty("tel")
	public String tel;
	
	public String tel1;
	public String tel2;
	public String tel3;

	@JsonProperty("addr")
	public String addr;

	@JsonProperty("birth")
	public String birth;

	@JsonProperty("gender")
	public boolean gender;

	@JsonProperty("preferPace")
	public String preferPace;	// 선호페이스

	private String role = MemberRole.USER.name().toLowerCase();

	public String status = MemberStatus.ACTIVE.name().toLowerCase();	// 상태  -> active

	public String createdAt;	// 생성일

	public String updatedAt;	// 수정일

	public String passwordLastModifiedAt;	// 패스워드 변경일

}
