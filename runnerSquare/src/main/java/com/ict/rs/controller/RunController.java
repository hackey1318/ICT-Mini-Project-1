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
            result.put("message", "번개런 등록 성공");
            result.put("no", vo.getNo()); // 생성된 run_no를 응답에 포함
            result.put("message", vo.getNo());
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "번개런 등록 실패: " + e.getMessage()); // 오류 메시지 포함
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

	@GetMapping("/run/ajaxList")
	@ResponseBody
	public ResponseEntity<List<RunVO>> runList(RunSelectVO sVO) {
	    System.out.println(sVO.toString());

	    try {
	        List<RunVO> runList = service.runList(sVO); // RunService의 runList() 메서드 호출
	        if (runList == null || runList.isEmpty()) {
	            return new ResponseEntity<List<RunVO>>(HttpStatus.NO_CONTENT); // 데이터가 없을 경우 204 No Content 반환
	        }
	        return new ResponseEntity<List<RunVO>>(runList, HttpStatus.OK); // 데이터가 있을 경우 200 OK와 함께 데이터 반환
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 콘솔에 에러 출력 (로깅 권장)
	        return new ResponseEntity<List<RunVO>>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 Internal Server Error 반환
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
		System.out.println("삭제할 런에 참여한 인원 삭제-> "+runningno);
		return service.participantsDelete(runningno);
	}
	
	@GetMapping("/run/ajaxDelete")
	@ResponseBody
	public int runDelete(int no) {
		System.out.println("삭제할 런 번호-> "+ no);
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
		System.out.println("런 예약 runningno, userno ->"+runningno+","+ userno);
		return service.runJoin(runningno, userno);
	}

	@GetMapping("run/ajaxLeave")
	@ResponseBody
	public int runLeave(int runningno, int userno) {
		System.out.println("런 예약 해제 runningno, ownerno ->"+runningno+","+userno);
		return service.runLeave(runningno, userno);
	}

	@GetMapping("/run/ajaxcheckJoined")
	@ResponseBody
	public int checkJoined(int runningno, int userno) {
		System.out.println("참석 여부 체크->"+runningno+","+userno);
		return service.checkJoined(runningno, userno);
	}

	@GetMapping("/run/ajaxcheckPersonNum")
	@ResponseBody
	public int checkPersonNum(String runningno) {
		System.out.println("참석 인원 확인할 runningno ->"+runningno);
		return service.checkPersonNum(Integer.parseInt(runningno));
	}

	@GetMapping("run/ajaxpersonNumInsert")
	@ResponseBody
	public int personNumInsert(int no, int joinednum) {
		System.out.println("참석 인원을 넣을 run_no->"+no+" 참석인원->"+joinednum);
		return service.personNumInsert(no,joinednum);
	}

}
