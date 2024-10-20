package com.techwave.busbookingclient.Models.Pojo;

import jakarta.validation.constraints.NotBlank;

public class RouteInfo {
	@NotBlank(message="required")
	private String routeId;
	@NotBlank(message="required")
	private String fromLocation;
	@NotBlank(message="required")
	private String toLocation;
	public RouteInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RouteInfo(String routeId, String fromLocation, String toLocation) {
		super();
		this.routeId = routeId;
		this.fromLocation = fromLocation;
		this.toLocation = toLocation;
	}
	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
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
}
