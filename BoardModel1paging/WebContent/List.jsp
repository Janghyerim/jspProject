<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="utils.BoardPage" %>

<%
	//DAO를 생성해 DB에 연결
	BoardDAO dao = new BoardDAO(application);

	//사용자가 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null){
		param.put("searchField",searchField);
		param.put("searchWord",searchWord);
	}
	
	int totalCount = dao.selectCount(param); //전체 게시물 수 확인
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));  //문자열을 숫자형으로 바꿈 /페이지 기능 구현용
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));  
	int totalPage = (int)Math.ceil((double)totalCount / pageSize); //13.몇 소수점으로 나오기 때문에 인트형으로 캐스팅 하면 13이 나옴
	
	int pageNum = 1;  //기본 값 정의
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(pageTemp);
	}
	
	int start = (pageNum - 1) * pageSize + 1;
	int end = (pageNum * pageSize);
	
	param.put("start", start);
	param.put("end", end);
	
	//List<BoardDTO> boardLists = dao.selectList(param); //게시물 목록받기
	List<BoardDTO> boardLists = dao.selectListPage(param); //페이지 기능 구현용
	dao.close();  //DB연결 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="./Common/Link.jsp" /> <!-- 공통 링크 -->
	<h2>목록 보기(List) - 현재 페이지 : <%=pageNum %>(전체 : <%=totalPage %>)</h2>
	<!-- 검색 폼 -->
	<form method="get">
		<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord" />
				<input type="submit" value="검색하기" />
			</td>
		</tr>
		</table>
	</form>
	
	<!-- 게시물 목록 테이블(표) -->
	<table border="1" width="90%">
		<!-- 각 컬럼의 이름 -->
		<tr>
			<th width="10%">번호</th>		
			<th width="50%">제목</th>	
			<th width="15%">작성자</th>	
			<th width="10%">조회수</th>	
			<th width="150%">작성일</th>	
		</tr>
		<!-- 목록의 내용 -->
<%
	if(boardLists.isEmpty()){
		//게시물이 하나도 없을 때
%>
	<tr>
		<td colspan="5" align="center">
			등록된 게시물이 없습니다^^*
		</td>
	</tr>
<%
	}else{
	//게시물이 있을 때
	int virtualNum = 0; //화면상에서의 게시물 번호 (변동x)
	int countNum = 0; //화면상에서 페이징 처리가 될때 앞쪽에 번호가 바뀌게끔 변수 선언
	for(BoardDTO dto : boardLists)
	{
		//virtualNum = totalCount--;    //기존코드
		virtualNum = totalCount - (((pageNum - 1)* pageSize) + countNum++);  //페이징 처리할때 번호가 바뀌게끔 하는 기능
%>
	<tr align="center">
		<td><%=virtualNum %></td> <!-- 게시물 번호 -->
		<td align="left">
			<a href="View.jsp?num=<%= dto.getNum()%>"><%= dto.getTitle() %></a>
		</td>
		<td align="center"><%=dto.getId() %></td>         <!--작성자 아이디 -->
		<td align="center"><%=dto.getVisitcount() %></td> <!--조회수 -->
		<td align="center"><%=dto.getPostdate() %></td>   <!--작성일 -->
	</tr>
<%
	}
}
%>
	</table>
	<!-- 목록 하단의 [글쓰기]버튼 -->
	<table border="1" width="90%">
		<tr align="center">
			<!-- 페이징 처리 -->
			<td>
				<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
			<!-- 글쓰기 버튼 -->
			<td>
				<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>