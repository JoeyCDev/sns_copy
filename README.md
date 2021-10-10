![header](https://capsule-render.vercel.app/api?type=shark&color=auto&height=300&section=header&text=Monstagram&fontSize=90)

### Tech Stack :computer:
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white) ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)

![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
### 프로젝트 설명 :pencil2:
- Instagram을 복제하는 프로젝트
- 기본적인 로그인 기반의 피드 업로드/피드 보기/댓글 달기 등의 기능
### 설계 :wrench:
- UI 기획
https://ovenapp.io/project/1QwUYCcphI3CotUBZLF0ZGjWplyYrAtB#CQXWg
- 데이터베이스, URL 설계
https://docs.google.com/spreadsheets/d/1cQf42McszJjMSZQvZmZEMQ77QZcAwLdHsKkZ9EYbCdw/edit#gid=0
### 주요기능 :nut_and_bolt:
- 회원가입
    - package: https://github.com/joseph58080/sns_copy/tree/master/src/main/java/com/majon/sns_copy/user
    - view: https://github.com/joseph58080/sns_copy/blob/master/src/main/webapp/WEB-INF/jsp/user/signIn.jsp
- 로그인
    - package: https://github.com/joseph58080/sns_copy/tree/master/src/main/java/com/majon/sns_copy/user
    - view: https://github.com/joseph58080/sns_copy/blob/master/src/main/webapp/WEB-INF/jsp/user/signUp.jsp
- 글쓰기 기능 및 메인화면
    - package: https://github.com/joseph58080/sns_copy/tree/master/src/main/java/com/majon/sns_copy/feed
    - view: https://github.com/joseph58080/sns_copy/blob/master/src/main/webapp/WEB-INF/jsp/feed/Main.jsp
- 댓글
    - package: https://github.com/joseph58080/sns_copy/tree/master/src/main/java/com/majon/sns_copy/feed/comment
    - view: https://github.com/joseph58080/sns_copy/blob/master/src/main/webapp/WEB-INF/jsp/feed/Main.jsp
- 좋아요
    - package: https://github.com/joseph58080/sns_copy/tree/master/src/main/java/com/majon/sns_copy/feed/like
    - view: https://github.com/joseph58080/sns_copy/blob/master/src/main/webapp/WEB-INF/jsp/feed/Main.jsp
### 데모 :video_camera:
:star: 회원가입/로그인![sign](https://user-images.githubusercontent.com/55569244/136692528-fc18ad34-cc51-4036-b995-d34f187135f9.gif)
:star: 글쓰기/피드삭제/로그아웃/메인화면![feed_main](https://user-images.githubusercontent.com/55569244/136692797-00db7e21-3304-4f34-bff4-916b7a88fc10.gif)
:star: 댓글 쓰기![Comment](https://user-images.githubusercontent.com/55569244/136692816-66fea2d8-8619-4cce-8df6-c9e47e7c7efb.gif)
:star: 좋아요 기능![Like](https://user-images.githubusercontent.com/55569244/136692826-4ddd3dd0-2036-48f3-b14c-b049e4c6a07f.gif)
### 외부 라이브러리 라이센스 :book:
- Tomcat https://www.apache.org/licenses/LICENSE-2.0
- MySql https://www.gnu.org/licenses/gpl-3.0.html
- Spring Framework https://www.apache.org/licenses/LICENSE-2.0
- Mybatis https://www.apache.org/licenses/LICENSE-2.0
- Bootstrap https://opensource.org/licenses/MIT
- jQuery https://opensource.org/licenses/MIT
- 이미지 출처 https://pixabay.com/ko/
### 향후 계획 :satellite:
- 팔로우/팔로워 기능 추가
- 프로필 편집기능 추가
- 게시물 저장 기능 추가
