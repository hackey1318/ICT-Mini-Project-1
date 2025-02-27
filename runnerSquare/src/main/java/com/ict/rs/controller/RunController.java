package com.ict.rs.controller;

import com.ict.rs.service.RunService;
import com.ict.rs.vo.RunSelectVO;
import com.ict.rs.vo.RunVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public ResponseEntity<Map<String, Object>> ajaxObject(RunVO vo) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            service.runInsert(vo);
            result.put("status", "success");
            result.put("message", "번개런 신청 완료");
            result.put("no", vo.getNo());
            result.put("message", vo.getNo());
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "번개런 신청 오류" + e.getMessage());
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/run/ajaxList")
    @ResponseBody
    public ResponseEntity<List<RunVO>> runList(RunSelectVO sVO) {
        System.out.println(sVO.toString());
        try {
            List<RunVO> runList = service.runList(sVO); // RunService�쓽 runList() 硫붿꽌�뱶 �샇異�
            if (runList == null || runList.isEmpty()) {
                return new ResponseEntity<List<RunVO>>(HttpStatus.NO_CONTENT); // �뜲�씠�꽣媛� �뾾�쓣 寃쎌슦 204 No Content 諛섑솚
            }
            return new ResponseEntity<List<RunVO>>(runList, HttpStatus.OK); // �뜲�씠�꽣媛� �엳�쓣 寃쎌슦 200 OK�� �븿猿� �뜲�씠�꽣 諛섑솚
        } catch (Exception e) {
            e.printStackTrace(); // �삁�쇅 諛쒖깮 �떆 肄섏넄�뿉 �뿉�윭 異쒕젰 (濡쒓퉭 沅뚯옣)
            return new ResponseEntity<List<RunVO>>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 Internal Server Error 諛섑솚
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
        System.out.println(runningno);
        return service.participantsDelete(runningno);
    }

    @GetMapping("/run/ajaxDelete")
    @ResponseBody
    public int runDelete(int no) {
        System.out.println(no);
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
        System.out.println(runningno + "," + userno);
        return service.runJoin(runningno, userno);
    }

    @GetMapping("run/ajaxLeave")
    @ResponseBody
    public int runLeave(int runningno, int userno) {
        System.out.println(runningno + "," + userno);
        return service.runLeave(runningno, userno);
    }

    @GetMapping("/run/ajaxcheckJoined")
    @ResponseBody
    public int checkJoined(int runningno, int userno) {
        System.out.println(runningno + "," + userno);
        return service.checkJoined(runningno, userno);
    }

    @GetMapping("/run/ajaxcheckPersonNum")
    @ResponseBody
    public int checkPersonNum(String runningno) {
        System.out.println(runningno);
        return service.checkPersonNum(Integer.parseInt(runningno));
    }

    @GetMapping("/run/ajaxpersonNumInsert")
    @ResponseBody
    public int personNumInsert(int no, int joinednum) {
        System.out.println(no + ", " + joinednum);
        return service.personNumInsert(no, joinednum);
    }
    
    @GetMapping(value = "/run/ajaxgetCrewName", produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String getCrewName(int no, HttpServletResponse response) {
        System.out.println("crewno->" + no);
        response.setCharacterEncoding("UTF-8");
        return service.getCrewName(no);
    }
    
}
