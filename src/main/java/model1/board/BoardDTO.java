package model1.board;

public class BoardDTO {
	
	//멤버변수 : 항상 private으로 선언하고, board테이블의 컬럼명과 동일하게 생성한다.
    private String num;
    private String title;
    private String content;
    private String id;
    private java.sql.Date postdate;
    private String visitcount;
    /*
    board테이블에  name컬럼은 존재하지 않으나, 목록에 작성자의 이름을 
    출력하기 위해 member테이블과의 join을 해야하는 경우가 있으므로 이때는
    멤버변수를 추가할 수 있다. 
    */
    private String name;
    
    //생성자 : 우리가 작성하지 않으므로 디폴트(기본) 생성자가 추가된다. 

    //getter/setter 메서드
    public String getNum() {
        return num;
    }
    public void setNum(String num) {
        this.num = num;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public java.sql.Date getPostdate() {
        return postdate;
    }
    public void setPostdate(java.sql.Date postdate) {
        this.postdate = postdate;
    }
    public String getVisitcount() {
        return visitcount;
    }
    public void setVisitcount(String visitcount) {
        this.visitcount = visitcount;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
