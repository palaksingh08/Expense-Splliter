package model;

import java.util.Date;

public class Expense {

    private int id;
    private double amount;
    private String paidBy;
    private int participants;
    private double share;
    private String tripName;
    private String description;
    private String participantsList; // Comma-separated list of participant names
    private Date expenseDate;
    private String category; // Food, Travel, Hotel, Shopping, etc.

    // No-argument constructor
    public Expense() {
        this.expenseDate = new Date();
    }

    // Parameterized constructor
    public Expense(double amount, String paidBy, int participants, double share) {
        this.amount = amount;
        this.paidBy = paidBy;
        this.participants = participants;
        this.share = share;
        this.expenseDate = new Date();
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaidBy() {
        return paidBy;
    }

    public void setPaidBy(String paidBy) {
        this.paidBy = paidBy;
    }

    public int getParticipants() {
        return participants;
    }

    public void setParticipants(int participants) {
        this.participants = participants;
    }

    public double getShare() {
        return share;
    }

    public void setShare(double share) {
        this.share = share;
    }

    public String getTripName() {
        return tripName;
    }

    public void setTripName(String tripName) {
        this.tripName = tripName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getParticipantsList() {
        return participantsList;
    }

    public void setParticipantsList(String participantsList) {
        this.participantsList = participantsList;
    }

    public Date getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(Date expenseDate) {
        this.expenseDate = expenseDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
