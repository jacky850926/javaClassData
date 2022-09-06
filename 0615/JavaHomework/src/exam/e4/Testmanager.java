package exam.e4;

public class Testmanager {
	public static void main(String[] args) {
		Manager manager1 = new Manager(1, "John", 5, 10);
		System.out.println(manager1.getSalary());
		System.out.println(manager1.getBonus());
	}
}
