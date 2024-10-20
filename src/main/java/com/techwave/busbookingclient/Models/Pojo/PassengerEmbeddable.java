package com.techwave.busbookingclient.Models.Pojo;

import java.io.Serializable;


public class PassengerEmbeddable  implements Serializable{
	private String passengerId;
	private TicketHistory transactionId;
	public PassengerEmbeddable() {
		super();
	}
	public PassengerEmbeddable(String passengerId, TicketHistory transactionId) {
		super();
		this.passengerId = passengerId;
		this.transactionId = transactionId;
	}
	public String getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(String passengerId) {
		this.passengerId = passengerId;
	}
	public TicketHistory getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(TicketHistory transactionId) {
		this.transactionId = transactionId;
	}
}
