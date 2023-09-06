
public class AddrMain {

	public static void main(String[] args) {
		
		Addr addr = new Addr("최윤호","010-0000-0000","choi@gmail.com","서울","친구");
		addr.printInfo();
		
		addr.setGroup("가족");
		System.out.println("----------------\n그룹 정보 변경\n----------------");
		addr.printInfo();
		
	}

}
