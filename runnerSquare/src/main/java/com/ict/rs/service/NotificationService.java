package com.ict.rs.service;

import java.util.List;

import com.ict.rs.vo.NotificationVO;
import com.ict.rs.vo.RunVO;

public interface NotificationService {

    int getNotificationCount(int userNo);

    List<NotificationVO> getNotificationList(int userNo);

    int readNotification(int userNo, List<Integer> notificationNoList);

    void generateNotification(int userNo, RunVO runVO, String type);
}
