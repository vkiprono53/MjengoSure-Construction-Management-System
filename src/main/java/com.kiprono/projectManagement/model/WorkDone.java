package com.kiprono.projectManagement.model;

import com.kiprono.hr.model.Employee;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "work_done")
public class WorkDone implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private Employee employee;
    @OneToOne
    private Task task;
    private BigDecimal work;

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

    public WorkDone() {
    }

    public long getId() {
        return id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public BigDecimal getWork() {
        return work;
    }

    public void setWork(BigDecimal work) {
        this.work = work;
    }
}