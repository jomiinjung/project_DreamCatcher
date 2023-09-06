
public class Addr {
	private String name;
	private String phnNum;
	private String email;
	private String addr;
	private String group;
	
	Addr(String name,String phnNum,String email,String addr,String group){
		this.name = name;
		this.phnNum = phnNum;
		this.email = email;
		this.addr = addr;
		this.group = group;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getPhnNum() {
		return phnNum;
	}
	public void setPhnNum(String phnNum) {
		this.phnNum = phnNum;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	
	public void printInfo() {
		System.out.println("이름 : "+this.name);
		System.out.println("전화번호 : "+this.phnNum);
		System.out.println("이메일 : "+this.email);
		System.out.println("주소 : "+this.addr);
		System.out.println("그룹 : "+this.group);
	}
	
	
}
