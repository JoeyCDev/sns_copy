package com.majon.sns_copy.feed.model;

import java.util.List;

import com.majon.sns_copy.feed.comment.model.Comment;

public class FeedDetail {
	
	private Feed feed;
	private List<Comment> commentList;
	private int likeCount;
	private boolean liked;
	
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
	public boolean isLiked() {
		return liked;
	}
	public void setLiked(boolean liked) {
		this.liked = liked;
	}
	
	
	
}
