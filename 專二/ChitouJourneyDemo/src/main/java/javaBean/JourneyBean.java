package javaBean;

import java.io.Serializable;

public class JourneyBean implements Serializable {
	private int jID;
	private String jName;
	private int memberID;
	private String jAlterDate;
	private String jStartDate;
	private String jEndDate;
	
	public JourneyBean() {
		
	}

	public JourneyBean(int jID, String jName, int memberID, String jAlterDate, String jStartDate, String jEndDate) {
		super();
		this.jID = jID;
		this.jName = jName;
		this.memberID = memberID;
		this.jAlterDate = jAlterDate;
		this.jStartDate = jStartDate;
		this.jEndDate = jEndDate;
	}

	public int getjID() {
		return jID;
	}

	public void setjID(int jID) {
		this.jID = jID;
	}

	public String getjName() {
		return jName;
	}

	public void setjName(String jName) {
		this.jName = jName;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public String getjAlterDate() {
		return jAlterDate;
	}

	public void setjAlterDate(String jAlterDate) {
		this.jAlterDate = jAlterDate;
	}

	public String getjStartDate() {
		return jStartDate;
	}

	public void setjStartDate(String jStartDate) {
		this.jStartDate = jStartDate;
	}

	public String getjEndDate() {
		return jEndDate;
	}

	public void setjEndDate(String jEndDate) {
		this.jEndDate = jEndDate;
	}
	
	
	
	
}
