package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CrewMemberVO {
	private int crewNo;
	private int userNo;
	private String role;
	private String status;
}
