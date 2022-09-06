package exam.e9;

import java.util.Arrays;
import java.util.List;

public class SortList {
    public static void main(String[] args) {
        Employee e1 = new Employee("001",10000,300);
        Employee e2 = new Employee("002",10000,200);
        Employee e3 = new Employee("003",20000,200);
        Employee e4 = new Employee("004",30000,200);

        List<Employee> list = Arrays.asList(e1, e2, e3, e4);
        //請利用List中的sort方法重新排序e1..e4，排序時薪水(salary)大的排前面，如果薪水一樣則commission小的排前面
        list.sort((o1,o2)-> {
        	int s1 = o1.getSalary();
        	int s2 = o2.getSalary();
        	int c1 = o1.getCommission();
        	int c2 = o2.getCommission();
        	System.out.printf("O1=%d,O2=%d%n",s1,s2);
        	if( s1 < s2 ) {
    			return 1;
    		}else if( s1 > s2 ) {
    			return -1;
    		}else {
    			if( c1 < c2) {
    				return 1;
    			}else if( c1 > c2) {
    				return -1;
    			}else {
    				return 0;
    			}
    		}
        });
        
        System.out.println(list);

    }
}
