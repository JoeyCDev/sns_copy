package com.majon.sns_copy.feed.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.sns_copy.feed.comment.dao.CommentDAO;
import com.majon.sns_copy.feed.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;

	public int addComment(int userId, int feedId, String userName, String content) {
		return commentDAO.insertComment(userId, feedId, userName, content);
	}
	
	// postId 에 해당하는 댓글 리스트 가져오기
	public List<Comment> getCommentListByFeedId(int feedId) {
		return commentDAO.selectCommentListByFeedId(feedId);
	}
	
}