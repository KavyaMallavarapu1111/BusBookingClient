package com.techwave.busbookingclient.Models.Pojo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

public class BusInfo {
	@NotBlank(message = "required")
	private String busId;
	@NotBlank(message = "required")
	private String busName;
	@NotBlank(message = "required")
	private String type;
	@NotNull(message = "required")
	private Integer capacity;
	public BusInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BusInfo(String busId, String busName, String type, Integer capacity) {
		super();
		this.busId = busId;
		this.busName = busName;
		this.type = type;
		this.capacity = capacity;
	}
	public String getBusId() {
		return busId;
	}
	public void setBusId(String busId) {
		this.busId = busId;
	}
	public String getBusName() {
		return busName;
	}
	public void setBusName(String busName) {
		this.busName = busName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getCapacity() {
		return capacity;
	}
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}
}
