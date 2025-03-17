package org.example.constructionxpert.Model;

import java.util.Date;

public class Task {
    private int id;
    private int projectId;
    private String description;
    private Date startDate;
    private Date endDate;

    // Constructeurs
    public Task() {}
    public Task(int projectId, String description, Date startDate, Date endDate) {
        this.projectId = projectId;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getProjectId() { return projectId; }
    public void setProjectId(int projectId) { this.projectId = projectId; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
}