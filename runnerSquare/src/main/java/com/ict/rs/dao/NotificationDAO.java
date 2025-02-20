package com.ict.rs.dao;

import com.ict.rs.vo.NotificationVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface NotificationDAO {

    int getReadableNotificationCountForUser(int userNo);

    List<NotificationVO> getReadableNotificationListForUser(int userNo);
}
