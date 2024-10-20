package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDateTime;
import java.util.List;


public class TicketHistory {
	private String transactionId;
	private Customer customerId;
	private LocalDateTime transctionDate;
	private ScheduleInfo scheduleId;
	private int noOfTickets;
	private String ticketId;
	private String status;
	private double totalFare;
	public TicketHistory() {
		super();
	}
	public TicketHistory(String transactionId, Customer customerId, LocalDateTime transctionDate,
			ScheduleInfo scheduleId, int noOfTickets, String ticketId, String status, double totalFare) {
		super();
		this.transactionId = transactionId;
		this.customerId = customerId;
		this.transctionDate = transctionDate;
		this.scheduleId = scheduleId;
		this.noOfTickets = noOfTickets;
		this.ticketId = ticketId;
		this.status = status;
		this.totalFare = totalFare;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public Customer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Customer customerId) {
		this.customerId = customerId;
	}
	public LocalDateTime getTransctionDate() {
		return transctionDate;
	}
	public void setTransctionDate(LocalDateTime transctionDate) {
		this.transctionDate = transctionDate;
	}
	public ScheduleInfo getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(ScheduleInfo scheduleId) {
		this.scheduleId = scheduleId;
	}
	public int getNoOfTickets() {
		return noOfTickets;
	}
	public void setNoOfTickets(int noOfTickets) {
		this.noOfTickets = noOfTickets;
	}
	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(double totalFare) {
		this.totalFare = totalFare;
	}
}
