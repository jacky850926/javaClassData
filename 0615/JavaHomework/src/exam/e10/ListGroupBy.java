package exam.e10;

import java.util.*;

public class ListGroupBy {
    public static void main(String[] args) {
        List<String> classes = Arrays.asList("Java", ".Net", "CISCO", "iPhone App", "Python","AI智慧");
        Map<Integer,List<String>> map = new HashMap<>();
        for(String e1 : classes) {
        	Integer l1 = e1.length();
        	if(map.get(l1)==null) {
        		List<String> list = new ArrayList<String>();
        		list.add(e1);
        		map.put(l1, list);
        	}else {
        		List<String> list = map.get(l1);
        		list.add(e1);
        		map.put(l1, list);
        	}
        }
        Set key = map.keySet();
        for(Object k : key) {
        	Integer name = (Integer) k;
        	System.out.println("長度有"+name+"個字的有: "+map.get(k).toString());
        }
        
        /*
        重新分類產生一個Map，Key值是文字的長度,value型態則是List<String>
        例如:key值是4的，會有"Java",".Net","AI智慧"
            key值是5的，會有"CISCO"
            並按照字的長度依序列印出來，例如4=[Java,.Net,AI智慧],5=[CISCO]
        請注意，不是要你產生以下程式，而是要利用程式邏輯重新組合原有的list
        List<String> words = Arrays.asList("Java",".Net","AI智慧");
        List<String> words1 = Arrays.asList("CISCO");
        List<String> words2 = Arrays.asList("Python");
        List<String> words3 = Arrays.asList("iphone App");
         */

    }
}
