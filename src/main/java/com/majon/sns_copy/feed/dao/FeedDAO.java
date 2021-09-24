package com.majon.sns_copy.feed.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.sns_copy.model.Comment;
import com.majon.sns_copy.model.Feed;

@Repository
public interface FeedDAO {

	public int insertPost(
			@Param("userId") int userId
			,@Param("userName") String userName
			, @Param("content") String content
			,@Param("imagePath") String imagePath);
	
	public List<Feed> selectPost();
	
	public int insertComment(
			@Param("userId")int userId
			,@Param("feedId")int feedId
			,@Param("userName")String userName
			,@Param("content")String content);
	
	public List<Comment> selectComment();
	
}
