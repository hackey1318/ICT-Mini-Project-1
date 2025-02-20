package com.ict.rs.service;

import com.ict.rs.dao.NotificationDAO;
import com.ict.rs.vo.MemberVO;
import com.ict.rs.vo.NotificationVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final NotificationDAO notificationDAO;

    @Override
    public int getNotificationCount(String userId) {

        MemberVO user = this.getMember(userId);
        return notificationDAO.getReadableNotificationCountForUser(user.getNo());
    }

    @Override
    public List<NotificationVO> getNotificationList(String userId) {

        MemberVO user = this.getMember(userId);
        return notificationDAO.getReadableNotificationListForUser(user.getNo());
    }

    private MemberVO getMember(String userId) {

        // TODO : 회원 조회 기능 추가 후 연결
        // MemberVO user = memberService.getUser(userId);
        MemberVO user = new MemberVO();
        user.setNo(1);
        if (user == null) {
            throw new RuntimeException("사용자가 없습니다.");
        }
        return user;
    }
}
