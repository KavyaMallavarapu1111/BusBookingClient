package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDateTime;


public class Passenger {
	private PassengerEmbeddable passengerKey;
	private String passengerName;
	private int age;
	private String gender;
	private String status;
	private LocalDateTime transactionDate;
	public Passenger() {}
	public Passenger(PassengerEmbeddable passengerKey, String passengerName, int age, String gender, String status,
			LocalDateTime transactionDate) {
		super();
		this.passengerKey = passengerKey;
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.status = status;
		this.transactionDate = transactionDate;
	}
	public PassengerEmbeddable getPassengerKey() {
		return passengerKey;
	}
	public void setPassengerKey(PassengerEmbeddable passengerKey) {
		this.passengerKey = passengerKey;
	}
	public String getPassengerName() {
		return passengerName;
	}
	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDateTime getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(LocalDateTime transactionDate) {
		this.transactionDate = transactionDate;
	}
}