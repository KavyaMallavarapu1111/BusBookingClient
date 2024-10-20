package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class SearchBuses {
	private String fromLocation;
	private String toLocation;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate DOJ;
	private Integer noOfTickets;
	public SearchBuses() {
		super();
	}
	public SearchBuses(String fromLocation, String toLocation, LocalDate dOJ, Integer noOfTickets) {
		super();
		this.fromLocation = fromLocation;
		this.toLocation = toLocation;
		DOJ = dOJ;
		this.noOfTickets = noOfTickets;
	}
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}
	public LocalDate getDOJ() {
		return DOJ;
	}
	public void setDOJ(LocalDate dOJ) {
		DOJ = dOJ;
	}
	public Integer getNoOfTickets() {
		return noOfTickets;
	}
	public void setNoOfTickets(Integer noOfTickets) {
		this.noOfTickets = noOfTickets;
	}
}
