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
	public String role;	// ����
	
	public String email;
	public String tel;
	public String tel1;
	public String tel2;
	public String tel3;
	public String addr;
	
	public String birth;
	public String gender;
	public String preferPace;	// ��ȣ ���̽�
	public String status;	// ����
	public String createdAt;	// ������
	public String updatedAt;	// ������
	public String passwordLastModifiedAt;	// �н����� ������
	
}
