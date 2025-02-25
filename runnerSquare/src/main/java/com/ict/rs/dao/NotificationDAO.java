package com.ict.rs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ict.rs.vo.NotificationVO;

@Mapper
@Repository
public interface NotificationDAO {

    int getReadableNotificationCountForUser(int userNo);

    List<NotificationVO> getReadableNotificationListForUser(int userNo);

    int readNotification(int userNo, List<Integer> notificationNoList);
}
