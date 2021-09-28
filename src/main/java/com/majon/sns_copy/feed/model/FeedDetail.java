package com.majon.sns_copy.feed.model;

import java.util.List;

import com.majon.sns_copy.feed.comment.model.Comment;
import com.majon.sns_copy.feed.like.model.Like;

public class FeedDetail {
	
	private Feed feed;
	private List<Comment> commentList;
	private int likeCount;
	private List<Like> likeList;
	
	public Feed getFeed() {
		return feed;
	}
	public void setFeed(Feed feed) {
		this.feed = feed;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public List<Like> getLikeList() {
		return likeList;
	}
	public void setLikeList(List<Like> likeList) {
		this.likeList = likeList;
	}
	
	
}
