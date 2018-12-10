package com.kiprono.projectManagement.model;

import com.kiprono.hr.model.Employee;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "task_assignment")
public class TaskAssignment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    private Task task;
    @OneToOne
    private Employee employee;
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

    public TaskAssignment() {
    }

    public long getId() {
        return id;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
