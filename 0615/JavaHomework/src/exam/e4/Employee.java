package exam.e4;
//inner class 試試看?
public class Employee {
	public Employee(int empno,String name,long salary){
		this.empno = empno;
		this.name = name;
		this.salary = salary;
	}

    private int empno;
    private String name;
    private long salary;
	public int getEmpno() {
		return empno;
	}
	public String getName() {
		return name;
	}
	public long getSalary() {
		return salary;
	}
}

