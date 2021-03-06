package com.majon.sns_copy.feed.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.sns_copy.feed.model.Feed;

@Repository
public interface FeedDAO {

	public int insertPost(
			@Param("userId") int userId
			,@Param("userName") String userName
			, @Param("content") String content
			,@Param("imagePath") String imagePath);
	
	public List<Feed> selectFeedList();

	public Feed selectFeed(@Param("feedId") int feedId,@Param("userId") int userId);
	
	public int deleteFeed(@Param("feedId") int feedId, @Param("userId")int userId);
	
	
}
