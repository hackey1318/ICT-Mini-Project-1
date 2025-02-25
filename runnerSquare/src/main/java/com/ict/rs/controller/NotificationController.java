package com.ict.rs.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/noti")
public class NotificationController {
	/*
	 * private final NotificationService notificationService;
	 *
	 * @GetMapping("/count") public int countNotification(HttpSession session) {
	 *
	 * String userId = (String) session.getAttribute("userId"); userId = "tester";
	 * return notificationService.getNotificationCount(userId); }
	 *
	 * @GetMapping public List<NotificationVO> getNotification(HttpSession session)
	 * {
	 *
	 * String userId = (String) session.getAttribute("userId"); userId = "tester";
	 * return notificationService.getNotificationList(userId); }
	 *
	 * @PatchMapping public int readNotification(@RequestBody List<Integer>
	 * notificationList, HttpSession session) {
	 *
	 * String userId = (String) session.getAttribute("userId"); userId = "tester";
	 * return notificationService.readNotification(userId, notificationList); }
	 */
}
