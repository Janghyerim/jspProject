package utils;

public class BoardPage { //바로가기 HTML 코드생성
	public static String pagingStr(int totalCount, int pageSize, int blockPage, 
			int pageNum, String reqUrl) {
		String pagingStr = "";
		
		//단계3 : 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));
		
		//단계4 : '이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if(pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";  //BoardModel2paging/list.do  => uri
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
					+"'>[이전 블록]</a>";
		}
		
		//단계5 : 각 페이지 번호 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				//현재 페이지는 링크를 걸지 않음
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp 
							+ "'>" + pageTemp + "</a>&nbsp;"; 
			}
			pageTemp++;  //1,2,3,4,5,6
			blockCount++;  //1,2,3,4,5,6
		}
		
		//단계6 : '다음 페이지 블록 바로가기' 출력
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
						+ "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages
						+ "'>[마지막 페이지]</a>";
		}
		return pagingStr;
	}
}
