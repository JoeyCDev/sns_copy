package com.majon.sns_copy.feed.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.sns_copy.feed.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("userId")int userId
			,@Param("feedId")int feedId
			,@Param("userName")String userName
			,@Param("content")String content);
	
	public List<Comment> selectCommentListByFeedId(int feedId);
}


