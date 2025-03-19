package org.example.constructionxpert.Model;

import java.util.Date;
import java.util.List;

public class Task {
    private int id;
    private int projectId;
    private String description;
    private Date startDate;
    private Date endDate;
    private List<Resource> resources; // Add this field

    // Constructors
    public Task() {}

    // Getters and setters
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
    public List<Resource> getResources() { return resources; }
    public void setResources(List<Resource> resources) { this.resources = resources; }
}