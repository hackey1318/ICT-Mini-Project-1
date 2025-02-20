package com.ict.rs.service;

import com.ict.rs.vo.NotificationVO;

import java.util.List;

public interface NotificationService {

    int getNotificationCount(String userId);

    List<NotificationVO> getNotificationList(String userId);
}
