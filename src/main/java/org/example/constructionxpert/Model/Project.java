package org.example.constructionxpert.Model;

import java.util.Date;

public class Project {
    private int id;
    private String name;
    private String description;
    private Date startDate;
    private Date endDate;
    private double budget;

    // Constructeurs
    public Project() {}
    public Project(String name, String description, Date startDate, Date endDate, double budget) {
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.budget = budget;
    }

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public java.sql.Date getStartDate() { return (java.sql.Date) startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    public java.sql.Date getEndDate() { return (java.sql.Date) endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
    public double getBudget() { return budget; }
    public void setBudget(double budget) { this.budget = budget; }
}