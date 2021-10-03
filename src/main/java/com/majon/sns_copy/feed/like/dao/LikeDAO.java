package com.majon.sns_copy.feed.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("feedId")int feedId
			,@Param("userId")int userId
			,@Param("userName")String userName);
	
	public int selectLikeCount(int feedId);
	
	public int selectLikeListByfeedIdAndUserId(@Param("feedId")int feedId, @Param("userId") int userId);
	
	public int deleteLike(
			@Param("feedId")int feedId
			,@Param("userId")int userID);
	
	public int deleteLikeByFeedId(@Param("feedId")int feedId);
	
}
