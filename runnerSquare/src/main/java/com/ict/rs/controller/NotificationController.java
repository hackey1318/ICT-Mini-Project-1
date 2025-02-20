package com.ict.rs.controller;

import com.ict.rs.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@RequestMapping("/noti")
public class NotificationController {

    private final NotificationService notificationService;

    @GetMapping("/count")
    public int countNotification(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        userId = "tester";
        return notificationService.getNotificationCount(userId);
    }
}
