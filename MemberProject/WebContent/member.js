function memberChk(){
    if(document.joinform.id.value==""){
     alert("아이디를 입력하세요")
      document.form.id.focus();
      return false;
    }
    if(document.joinform.pass.value==""){
     alert("비밀번호를 입력하세요")
      document.form.pass.focus();
      return false;
    }
    if(document.joinform.name.value==""){
     alert("이름을 입력하세요")
      document.form.name.focus();
      return false;
    }
    if(document.joinform.age.value==""){
     alert("나이를 입력하세요")
      document.form.age.focus();
      return false;
    }
    if(document.joinform.gender.value==""){
     alert("성별을 입력하세요")
      document.form.gender.focus();
      return false;
    }
    if(document.joinform.email.value==""){
     alert("이메일을 입력하세요")
      document.form.email.focus();
      return false;
    }
   
   /*조인폼으로 페이지이동을 해주세요.*/
   document.joinform.submit();
}