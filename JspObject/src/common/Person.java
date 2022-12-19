package common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

//형식 : 자바빈 클래스
//역할 : DTO 클래스 : 여러데이터를 하나로묶어서 사용하게끔 하는 클래스 역할
//기본 생성자 : 기본생성자는 탑재되어 있으므로 안만들어도 된다. / 다른 생성자가 생성되면 기본 생성자도 생성 해야함.
public class Person {
	private String name;
	private int age;
	


	
	
	
	
}
