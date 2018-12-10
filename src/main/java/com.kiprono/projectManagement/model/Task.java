package com.kiprono.projectManagement.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "task")
public class Task implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String taskCode;
    private String taskName;
    private String taskDescription;
    @ManyToOne
    private Milestone milestone;
    private Date expectedStartDate;
    private Date expectedEndDate;
    private long expectedDuration;
    private Date actualStartDate;
    private Date actualEndDate;
    private long actualDuration;
    @Column(name="deleted")
    private boolean deleteFlag;

    public void setId(long id) {
        this.id = id;
    }

    public boolean isDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    @OneToMany
    private List<Task> taskList;
   // private HashMap<Resource, BigDecimal> resource;     //{ where Resource has already been           defined in the Resource Module and Quantity is of type BigDecimal}
   // private HashMap<Service, BigDecimal> service ; //where Service is a custom Object already defined within the module and Quantity is of type BigDecimal

    public Task() {
    }

    public long getId() {
        return id;
    }

    public String getTaskCode() {
        return taskCode;
    }

    public void setTaskCode(String taskCode) {
        this.taskCode = taskCode;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public Milestone getMilestone() {
        return milestone;
    }

    public void setMilestone(Milestone milestone) {
        this.milestone = milestone;
    }

    public Date getExpectedStartDate() {
        return expectedStartDate;
    }

    public void setExpectedStartDate(Date expectedStartDate) {
        this.expectedStartDate = expectedStartDate;
    }

    public Date getExpectedEndDate() {
        return expectedEndDate;
    }

    public void setExpectedEndDate(Date expectedEndDate) {
        this.expectedEndDate = expectedEndDate;
    }

    public long getExpectedDuration() {
        return expectedDuration;
    }

    public void setExpectedDuration(long expectedDuration) {
        this.expectedDuration = expectedDuration;
    }

    public Date getActualStartDate() {
        return actualStartDate;
    }

    public void setActualStartDate(Date actualStartDate) {
        this.actualStartDate = actualStartDate;
    }

    public Date getActualEndDate() {
        return actualEndDate;
    }

    public void setActualEndDate(Date actualEndDate) {
        this.actualEndDate = actualEndDate;
    }

    public long getActualDuration() {
        return actualDuration;
    }

    public void setActualDuration(long actualDuration) {
        this.actualDuration = actualDuration;
    }

    public List<Task> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<Task> taskList) {
        this.taskList = taskList;
    }

/*    public HashMap<Resource, BigDecimal> getResource() {
        return resource;
    }*/

   /* public void setResource(HashMap<Resource, BigDecimal> resource) {
        this.resource = resource;
    }*/
/*
    public HashMap<Service, BigDecimal> getService() {
        return service;
    }

    public void setService(HashMap<Service, BigDecimal> service) {
        this.service = service;
    }*/
}
