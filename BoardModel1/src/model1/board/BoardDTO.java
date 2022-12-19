package model1.board;

import lombok.Getter;
import lombok.Setter;

//2. getter / setter 설정
@Getter
@Setter

public class BoardDTO {
	//1. 멤버 변수 선언
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate; 
	private String visitcount;
	private String name;
	
}

