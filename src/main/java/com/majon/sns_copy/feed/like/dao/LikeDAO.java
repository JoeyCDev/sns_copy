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
}