package com.hotel;

import java.sql.*;

public class Hotel {
	
	private String hotelName;
	private String comments;
	public Hotel(String hotelName, float rating, String meals, float expectedPrice, int numberOfAvailableRooms,
			String startAvDate, String endAvDate, String location, String contactInformation, String hotelFacilities,
			String otherBranches, String comments) {
		super();
		this.hotelName = hotelName;
		this.rating = rating;
		this.meals = meals;
		this.expectedPrice = expectedPrice;
		this.numberOfAvailableRooms = numberOfAvailableRooms;
		this.startAvDate = startAvDate;
		this.endAvDate = endAvDate;
		this.location = location;
		this.contactInformation = contactInformation;
		this.hotelFacilities = hotelFacilities;
		this.otherBranches = otherBranches;
		this.comments= comments;
	}
	public Hotel(String location, String startAvDate, String endAvDate ) {
		
		this.location = location;
		this.startAvDate = startAvDate;
		this.endAvDate = endAvDate;
		
	}
	@Override
	public String toString() {
		return "Hotel [hotelName=" + hotelName + ", comments=" + comments + ", max_adults=" + max_adults
				+ ", max_children=" + max_children + ", rating=" + rating + ", meals=" + meals + ", expectedPrice="
				+ expectedPrice + ", numberOfAvailableRooms=" + numberOfAvailableRooms + ", startAvDate=" + startAvDate
				+ ", endAvDate=" + endAvDate + ", location=" + location + ", contactInformation=" + contactInformation
				+ ", hotelFacilities=" + hotelFacilities + ", otherBranches=" + otherBranches + ", distance=" + distance
				+ ", stars=" + stars + "]";
	}
	public Hotel(String hotelName,String location, String contactInformation, String hotelFacilities,
			String otherBranches, String meals,  float rating , int stars) {    // samaa 3mlahh string (rating)
		super();
		this.hotelName = hotelName;
		this.rating = rating;
		this.meals = meals;
		this.location = location;
		this.contactInformation = contactInformation;
		this.hotelFacilities = hotelFacilities;
		this.otherBranches = otherBranches;
		this.stars = stars;
	}
	private int max_adults;
	private int max_children;
	private float rating ;
	private String meals ;
	private float expectedPrice ;
	private int numberOfAvailableRooms ;
	private String startAvDate ;
	private String endAvDate ;
	private String location ;
	private String contactInformation ;
	private String hotelFacilities ;
	private String otherBranches ;
	private float distance;
	private int stars;
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getMeals() {
		return meals;
	}
	public void setMeals(String meals) {
		this.meals = meals;
	}
	public float getExpectedPrice() {
		return expectedPrice;
	}
	public void setExpectedPrice(float expectedPrice) {
		this.expectedPrice = expectedPrice;
	}
	public int getNumberOfAvailableRooms() {
		return numberOfAvailableRooms;
	}
	public void setNumberOfAvailableRooms(int numberOfAvailableRooms) {
		this.numberOfAvailableRooms = numberOfAvailableRooms;
	}
	public String getStartAvDate() {
		return startAvDate;
	}
	public void setStartAvDate(String startAvDate) {
		this.startAvDate = startAvDate;
	}
	public String getEndAvDate() {
		return endAvDate;
	}
	public void setEndAvDate(String endAvDate) {
		this.endAvDate = endAvDate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContactInformation() {
		return contactInformation;
	}
	public void setContactInformation(String contactInformation) {
		this.contactInformation = contactInformation;
	}
	public String getHotelFacilities() {
		return hotelFacilities;
	}
	public void setHotelFacilities(String hotelFacilities) {
		this.hotelFacilities = hotelFacilities;
	}
	public String getOtherBranches() {
		return otherBranches;
	}
	public void setOtherBranches(String otherBranches) {
		this.otherBranches = otherBranches;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Hotel() {
	
	}
	public int getMax_adults() {
		return max_adults;
	}
	public void setMax_adults(int max_adults) {
		this.max_adults = max_adults;
	}
	public int getMax_children() {
		return max_children;
	}
	public void setMax_children(int max_children) {
		this.max_children = max_children;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}

}
