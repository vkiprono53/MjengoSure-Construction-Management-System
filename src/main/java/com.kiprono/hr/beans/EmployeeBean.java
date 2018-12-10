package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudBean;



import com.kiprono.hr.model.Employee;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class EmployeeBean extends CrudBean<Employee> implements EmployeeI {

    @PostConstruct
    void setEntityClass(){
        this.entityClass = Employee.class;

    }
    @EJB
    private AuthI<Employee> authBean;

    Employee e;

    public boolean clientLogin(){
       // authBean.login();
        return false;
    }
}
