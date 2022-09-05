package exam.e5;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart2 {
    public static void main(String[] args) {

        //實作1.加入二台Notebook("Asus",30000),Notebook("Acer",20000),Food("Cookie",200)到shoppingList中
        List<Product> shoppingList = new ArrayList<Product>();
        shoppingList.add(new Notebook("Asus", 30000));
        shoppingList.add(new Food("Cookie", 200));
        
        //實作2.利用for迴圈，計算shoppingList中的總金額,並印在Console中
        int total = 0;
        for (Product product : shoppingList) {
        	System.out.printf("商品:%s\t價格:%d%n",product.getName(),product.getPrice());
        	total+=product.getPrice();
        }
        System.out.printf("總金額:%d%n",total);

        //實作3.利用for迴圈，計算shoppingList中是Notebook型態的總金額,並印在Console中        
        int noteTotal = 0;
        for (Product product : shoppingList) {
        	if(product instanceof Notebook) {
        		Notebook nbgood = (Notebook) product;
        		System.out.printf("notebook類商品:%s%n價格:%d%n",product.getName(),product.getPrice());
        		noteTotal += nbgood.getPrice();
        	}else {
				continue;
			}
        }
        System.out.printf("notebook總金額:%d%n",noteTotal);


    }
}
