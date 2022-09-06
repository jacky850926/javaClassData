package exam.e8;

import java.io.*;
import org.apache.commons.csv.*;
import java.lang.*;



public class ParseCSV {
    public static void main(String[] args) {
    	try(FileInputStream fis = new FileInputStream("c:\\java\\Employees.csv");
				InputStreamReader isr = new InputStreamReader(fis,"MS950");
				BufferedReader br = new BufferedReader(isr);
    		) {
    		Iterable<CSVRecord> records = CSVFormat.RFC4180.withHeader("員工編號", "姓名", "薪水", "年齡").parse(br);
    		for (CSVRecord record : records) {
    		    String id = record.get("員工編號");
    		    String name = record.get("姓名");
    		    String salary = record.get("薪水");
    		    String age = record.get("年齡");
    		    System.out.println(id+"\t"+name+"\t"+salary+"\t"+age+"\t");
    		}

    		
    	} catch (FileNotFoundException e) {
			System.err.println("檔案讀取失敗");
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("ERROR!");
			e.printStackTrace();
		}
        /*
        將exam/e8/Employee.csv Copy至c:\java
        只能利用Commons csv library來處理csv檔案,注意cvs檔案編碼為MS950
        網址如下  https://commons.apache.org/proper/commons-csv/
        1.下載commons-csv-1.9-bin.zip，解壓縮後將jar放至lib目錄
        2.eclipse中設定library
        3.參考官方的User Guide處理此csv
        4.所有有實作AutoCloseable的物件都必須close
        5.不可自行將csv中的千分號移除，不可以改動csv中的內容
        取得薪水的加總
         */


    }
}
