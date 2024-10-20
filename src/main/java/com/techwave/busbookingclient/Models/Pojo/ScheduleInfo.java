package com.techwave.busbookingclient.Models.Pojo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.format.annotation.DateTimeFormat;

public class ScheduleInfo implements Serializable{
	private String sId;
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime scheduleTime;
	private RouteInfo routeId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@DOJValidatorInterface
	private LocalDate dateOfJourney;
	private Double cost;
	private Integer availableSeats;
	private BusInfo busId;

	public ScheduleInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public LocalTime getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(LocalTime scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public RouteInfo getRouteId() {
		return routeId;
	}

	public void setRouteId(RouteInfo routeId) {
		this.routeId = routeId;
	}

	public LocalDate getDateOfJourney() {
		return dateOfJourney;
	}

	public void setDateOfJourney(LocalDate dateOfJourney) {
		this.dateOfJourney = dateOfJourney;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public Integer getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(Integer availableSeats) {
		this.availableSeats = availableSeats;
	}

	public BusInfo getBusId() {
		return busId;
	}

	public void setBusId(BusInfo busId) {
		this.busId = busId;
	}

	public ScheduleInfo(String sId, LocalTime scheduleTime, String routeno, RouteInfo routeId, LocalDate dateOfJourney,
			Double cost, Integer availableSeats, String busno, BusInfo busId) {
		super();
		this.sId = sId;
		this.scheduleTime = scheduleTime;

		this.routeId = routeId;
		this.dateOfJourney = dateOfJourney;
		this.cost = cost;
		this.availableSeats = availableSeats;

		this.busId = busId;
	}

}
