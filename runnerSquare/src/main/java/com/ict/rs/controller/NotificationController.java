package com.ict.rs.controller;

import com.ict.rs.service.NotificationService;
import com.ict.rs.vo.NotificationVO;
import org.springframework.web.bind.annotation.*;

import lombok.RequiredArgsConstructor;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/noti")
public class NotificationController {

	private final NotificationService notificationService;

	@GetMapping("/count")
	public int countNotification(HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		return notificationService.getNotificationCount(userNo);
	}

	@GetMapping
	public List<NotificationVO> getNotification(HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		return notificationService.getNotificationList(userNo);
	}

	@PatchMapping
	public int readNotification(@RequestBody List<Integer> notificationList, HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		return notificationService.readNotification(userNo, notificationList);
	}

}
