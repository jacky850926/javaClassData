package electScooterProject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Test {

	public static void main(String[] args) {
		File file = new File("C:\\Java\\新北市電動機車充電站.csv");
		try(FileInputStream fis = new FileInputStream(file);
				FileReader fr = new FileReader(file);
				BufferedReader br = new BufferedReader(fr);
				) {
			br.readLine();
			String line = null;
			while((line = br.readLine())!=null) {
				String[] splitline = line.split(",");
				for(int i = 0 ; i < splitline.length;i++) {
					System.out.print(splitline[i]);
				}
				System.out.println();
			
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
