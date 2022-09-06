package exam.e4;

public class Manager extends Employee {
	public Manager(int empno,String name,long salary,long bonus) {
		super(empno,name,salary);
		this.bonus = bonus;
		salary += bonus;
		managerSalary = salary;
	}
	long managerSalary = 0;
	private long bonus;

	public long getSalary() {
		return managerSalary;
	}

	public long getBonus() {
		return bonus;
	}
	
}
