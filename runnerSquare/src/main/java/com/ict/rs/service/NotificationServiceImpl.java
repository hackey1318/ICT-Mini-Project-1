package com.ict.rs.service;

import com.ict.rs.dao.NotificationDAO;
import com.ict.rs.vo.MemberVO;
import com.ict.rs.vo.NotificationVO;
import com.ict.rs.vo.RunVO;
import com.ict.rs.vo.constant.notification.NotificationStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final MemberService memberService;
    private final NotificationDAO notificationDAO;

    @Override
    public int getNotificationCount(int userNo) {

        MemberVO user = this.getMember(userNo);
        return notificationDAO.getReadableNotificationCountForUser(user.getNo());
    }

    @Override
    public List<NotificationVO> getNotificationList(int userNo) {

        MemberVO user = this.getMember(userNo);
        return notificationDAO.getReadableNotificationListForUser(user.getNo());
    }

    @Override
    public int readNotification(int userNo, List<Integer> notificationNoList) {
        MemberVO user = this.getMember(userNo);
        return notificationDAO.readNotification(user.getNo(), notificationNoList);
    }

    @Override
    public void generateNotification(int userNo, RunVO runVO, String type) {
        String message = "";
        if ("참여".equals(type)) {
            message += "[" + runVO.getName() + "] " + type + " 신청 완료 되었습니다.";
        } else {
            message += "[" + runVO.getName() + "] " + type + " 완료 되었습니다.";
        }
        notificationDAO.createNotification(userNo, message, NotificationStatus.READABLE.name().toLowerCase());
    }

    private MemberVO getMember(int userNo) {

        MemberVO user = memberService.getUser(userNo);
        if (user == null) {
            throw new RuntimeException("사용자가 없습니다.");
        }
        return user;
    }
}
