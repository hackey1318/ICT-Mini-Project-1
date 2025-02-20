package com.ict.rs.service;

import com.ict.rs.dao.NotificationDAO;
import com.ict.rs.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final NotificationDAO notificationDAO;

    @Override
    public int getNotificationCount(String userId) {

        // TODO : 회원 조회 기능 추가 후 연결
        // MemberVO user = this.getMember(userId);
        MemberVO user = new MemberVO();
        user.setNo(1);
        return notificationDAO.getReadableNotificationCountForUser(user.getNo());
    }

}
