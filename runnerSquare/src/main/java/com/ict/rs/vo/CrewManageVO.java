package com.ict.rs.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrewManageVO {
	public int no;
	public int crewNo;
	public int userNo;
	public String role;
	public String status;
	public String createdAt;
	public String updatedAt;
	public String name; // crewname
	public String city;
	public String district;
	public String runningDay;
	public String nickName;
}
