package com.ict.rs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

@Mapper
@Repository
public interface RunDAO {
	//������ ���
	public int runInsert(RunVO vo);

	//�� ����(���)
	List<RunVO> runList(RunSelectVO sVO);

	//�� ����
	public RunVO runInfo(int run_no);

	//�� ������Ʈ
	public int runUpdate(RunVO vo);

	//�� ������ ����
	public int participantsDelete(int run_no);
	
	//�� ����
	public int runDelete(int run_no);

	//�� ����
	public int runJoin(int run_no, String userid);

	//�� ���� ����
	public int runLeave(int run_no, String userid);

	//���� ���� Ȯ��
	public int checkJoined(int run_no, String userid);

	//���� �ο� Ȯ��
	public int checkPersonNum(int run_no);

	//���� �ο� db�� �ֱ�
	public int personNumInsert(int run_no, int joinednum);

}
