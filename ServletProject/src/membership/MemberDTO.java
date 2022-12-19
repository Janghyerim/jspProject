package membership; //패키지는 소문자로

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MemberDTO { //회원정보 담을 클래스
	private String id;  //멤버변수 선언
	private String pass;
	private String name;
	private String regidate;
}
