package com.majon.sns_copy.feed.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.majon.sns_copy.common.FileManagerService;
import com.majon.sns_copy.feed.comment.bo.CommentBO;
import com.majon.sns_copy.feed.comment.model.Comment;
import com.majon.sns_copy.feed.dao.FeedDAO;
import com.majon.sns_copy.feed.like.bo.LikeBO;
import com.majon.sns_copy.feed.model.Feed;
import com.majon.sns_copy.feed.model.FeedDetail;

@Service
public class FeedBO {

	@Autowired
	private FeedDAO feedDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
			
			String imagePath = null;
			if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			if(imagePath == null) {
				return 0;
			}
		}
			
			return feedDAO.insertPost(userId, userName, content, imagePath);
		}
	public List<FeedDetail> getFeed(){
		
		List<Feed> feedList = feedDAO.selectPost();
		
		List<FeedDetail> feedDetailList = new ArrayList<>();
		
		// feed 하나당 댓글,좋아요 가져오기
		for(Feed feed:feedList) {
			// 해당하는 feed의 댓글 가져오기
			List<Comment>commentList = commentBO.getCommentListByFeedId(feed.getId());
			// 해당하는 feed의 좋아요 갯수 가져오기
			int likeCount = likeBO.countLike(feed.getId());
			FeedDetail feedDetail = new FeedDetail();
			feedDetail.setFeed(feed);
			feedDetail.setCommentList(commentList);
			feedDetail.setLikeCount(likeCount);
			
			feedDetailList.add(feedDetail);
		}
		
		return feedDetailList;
		
	}
	
	
	
}
