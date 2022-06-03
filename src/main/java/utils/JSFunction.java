package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	
	//Javascript함수를 통해 경고창을 띄우고 원하는 페이지로 이동한다. 
	public static void alertLocation(String msg, String url, JspWriter out) {
		/*
		Java클래스에서는 JSP의 내장객체를 사용할 수 없으므로 반드시 매개변수로
		전달받아 사용해야 한다. 
		여기서는 화면에 문자열을 출력하기 위해 out내장객체를 JspWriter 타입으로 
		받은 후 사용하고 있다. 
		*/
        try {
            String script = ""  
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    location.href='" + url + "';"
                          + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }
	//JS를 통해 경고창을 띄우고 뒤로 이동한다. 
    public static void alertBack(String msg, JspWriter out) {
        try {
            String script = ""
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    history.back();"
                          + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }
    public static String alertMsg(String msg, JspWriter out) {
        String script = "";
    	try {
            script = ""  
                    + "<script>"
                    + "    alert('" + msg + "');"
                    + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    	
    	return script;
    }
}
