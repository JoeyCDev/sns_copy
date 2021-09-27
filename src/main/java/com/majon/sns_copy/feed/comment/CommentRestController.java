package com.majon.sns_copy.feed.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.majon.sns_copy.feed.comment.bo.CommentBO;

@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/feed/comment")
	public Map<String,String>postComment(
			@RequestParam("feedId")int feedId
			,@RequestParam("content")String content
			,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		int count = commentBO.addComment(userId, feedId, userName, content);
		
		Map<String,String>resultMap = new HashMap<>();		
		if(count==1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
}
	/*
	@Service
	public class CommentBO {
		
		@Autowired
		private CommentDAO commentDAO;

		public int addComment(int userId, int feedId, String userName, String content) {
			return commentDAO.insertComment(userId, feedId, userName, content);
		}
		
		public List<Comment> getComment(){
			return commentDAO.selectComment();
		}
		
	}
	
	@Repository
	public interface CommentDAO {

		public int insertComment(
				@Param("userId")int userId
				,@Param("feedId")int feedId
				,@Param("userName")String userName
				,@Param("content")String content);
		
		public List<Comment> selectComment();
	}

	
	<mapper namespace="com.majon.sns_copy.feed.comment.dao.CommentDAO">

	<insert id="insertComment" parameterType="map">
	 		INSERT INTO `comment`
	 		(
	 			`userId`
	 			,`feedId`
	 			,`userName`
	 			,`content`
	 			,`createdAt`
	 			,`updatedAt`
	 		)VALUES(
	 			#{userId}
	 			,#{feedId}
	 			,#{userName}
	 			,#{content}
	 			,now()
	 			,now()
	 		)
	 	</insert>
	 
	 	<select id="selectComment" parameterType="map" resultType="com.majon.sns_copy.model.Comment">
	 		SELECT 
	 			`id`
	 			,`userId`
	 			,`feedId`
	 			,`userName`
	 			,`content`
	 			,`emoji`
	 			,`createdAt`
	 			,`updatedAt`
	 		FROM
	 			`comment`
	 		ORDER BY
	 			`id`;
	 	</select>
	 
	 </mapper>
	
}

*/


