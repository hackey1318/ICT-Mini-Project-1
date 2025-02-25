package com.ict.rs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.rs.service.RunService;
import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;

@Controller
public class RunController {
	@Inject
	RunService service;

	@GetMapping("/run/runSearch")
	public String runSearch() {
		return "run/runSearch";
	}

	@PostMapping("/run/ajaxObject")
	@ResponseBody
	public  ResponseEntity<Map<String, Object>> ajaxObject(RunVO vo) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            service.runInsert(vo);
            result.put("status", "success");
            result.put("message", "������ ��� ����");
            result.put("no", vo.getNo()); // ������ run_no�� ���信 ����
            result.put("message", vo.getNo());
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "������ ��� ����: " + e.getMessage()); // ���� �޽��� ����
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@GetMapping("/run/ajaxList")
	@ResponseBody
	public ResponseEntity<List<RunVO>> runList(RunSelectVO sVO) {
	    System.out.println(sVO.toString());

	    try {
	        List<RunVO> runList = service.runList(sVO); // RunService�� runList() �޼��� ȣ��
	        if (runList == null || runList.isEmpty()) {
	            return new ResponseEntity<List<RunVO>>(HttpStatus.NO_CONTENT); // �����Ͱ� ���� ��� 204 No Content ��ȯ
	        }
	        return new ResponseEntity<List<RunVO>>(runList, HttpStatus.OK); // �����Ͱ� ���� ��� 200 OK�� �Բ� ������ ��ȯ
	    } catch (Exception e) {
	        e.printStackTrace(); // ���� �߻� �� �ֿܼ� ���� ��� (�α� ����)
	        return new ResponseEntity<List<RunVO>>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 Internal Server Error ��ȯ
	    }
	}

	@GetMapping("/run/ajaxInfo")
	@ResponseBody
	public RunVO runInfo(@RequestParam("no") int no) {
	    RunVO runInfo = service.runInfo(no);
	    return runInfo;
	}

	@GetMapping("/run/ajaxparticipantsDelete")
	@ResponseBody
	public int participantsDelete(int runningno) {
		System.out.println("������ ���� ������ �ο� ����-> "+runningno);
		return service.participantsDelete(runningno);
	}
	
	@GetMapping("/run/ajaxDelete")
	@ResponseBody
	public int runDelete(int no) {
		System.out.println("������ �� ��ȣ-> "+ no);
	    return service.runDelete(no);
	}

	@GetMapping("/run/ajaxUpdate")
	@ResponseBody
	public int runUpdate(RunVO vo) {
	    int runUpdate = service.runUpdate(vo);
	    return runUpdate;
	}

	@GetMapping("/run/ajaxJoin")
	@ResponseBody
	public int runJoin(int runningno, int userno) {
		System.out.println("�� ���� runningno, userno ->"+runningno+","+ userno);
		return service.runJoin(runningno, userno);
	}

	@GetMapping("run/ajaxLeave")
	@ResponseBody
	public int runLeave(int runningno, int userno) {
		System.out.println("�� ���� ���� runningno, ownerno ->"+runningno+","+userno);
		return service.runLeave(runningno, userno);
	}

	@GetMapping("/run/ajaxcheckJoined")
	@ResponseBody
	public int checkJoined(int runningno, int userno) {
		System.out.println("���� ���� üũ->"+runningno+","+userno);
		return service.checkJoined(runningno, userno);
	}

	@GetMapping("/run/ajaxcheckPersonNum")
	@ResponseBody
	public int checkPersonNum(String runningno) {
		System.out.println("���� �ο� Ȯ���� runningno ->"+runningno);
		return service.checkPersonNum(Integer.parseInt(runningno));
	}

	@GetMapping("run/ajaxpersonNumInsert")
	@ResponseBody
	public int personNumInsert(int no, int joinednum) {
		System.out.println("���� �ο��� ���� run_no->"+no+" �����ο�->"+joinednum);
		return service.personNumInsert(no,joinednum);
	}

}
