<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num1 = 3;
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");  
pageContext.setAttribute("num4", "8");  
%>    
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 연산자</title></head>
<body>
    <h3>변수 선언 및 할당</h3>
    스크립틀릿에서 선언한 변수 : ${ num1 }  <br />    
    page 영역에 저장된 변수 : ${ num2 } <br />
    변수 할당 및 즉시 출력 : ${ num1 = 7 } <br />
    <!--할당과 동시에 출력이 되므로 ;''을 써서 출력을 방지한다.  -->
    변수 할당 및 별도 출력 : ${ num2 = 8;'' } => ${ num2 } <br /> 
    num1 = ${ num1 }, num2 = ${ num2 }, num3 = ${ num3 }, num4 = ${ num4 }
    
    <h3>산술 연산자</h3>
    num1 + num2 : ${ num1 + num2 } <br />
    num1 - num2 : ${ num1 - num2 } <br />
    num1 * num2 : ${ num1 * num2 } <br />
    num3 / num4 : ${ num3 / num4 } <br />  
    <!-- 나눗셈은 /와 %대신에 div, mod를 사용할 수 있다.  -->  
    num3 div num4 : ${ num3 div num4 }  <br />
    num3 % num4 : ${ num3 % num4 } <br />  
    num3 mod num4 : ${ num3 mod num4 }
   
    <h3>+ 연산자는 덧셈만 가능. 연결(concat)은 안됨</h3>  
    num1 + "34" : ${ num1 + "34" } <br />
    num2 + "이십" : \${num2 + "이십" }  <br /> 
    "삼십" + "사십" : \${"삼십" + "사십" } 
    
    
    <!-- 
    
    > : gt (Greater Than)
    > =: ge (Greater than Equal)
    < : lt (Less Than )
    <= : le (Less than Equal)
    == : eq (EQual)
    ! = ne 	(Not Equal)
    
    -->
    <h3>비교 연산자</h3>
    num4 > num3 : ${ num4 gt num3 } <br />
    num1 < num3 : ${ num1 lt num3 } <br />
    num2 >= num4 : ${ num2 ge num4 } <br />
    num1 == num4 : ${ num1 eq num4 } 

    <h3>논리 연산자</h3>
    num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 } <br />
    num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }
</body>
</html>
