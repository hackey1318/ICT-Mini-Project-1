package com.ict.rs.service;

import java.util.List;

import com.ict.rs.vo.NotificationVO;

public interface NotificationService {

    int getNotificationCount(String userId);

    List<NotificationVO> getNotificationList(String userId);

    int readNotification(String userId, List<Integer> notificationNoList);
}
