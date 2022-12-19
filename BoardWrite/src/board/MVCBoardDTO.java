package board;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor

//게시판용 DTO
public class MVCBoardDTO {  
	//멤버 변수 선언
	private String idx;
	private String name;
	private String title;
	private String content;
	private java.sql.Date postdate ;
	private String ofile;
	private String sfile;
	private int downcount;
	private String pass;
	private int visitcount;
	
}
