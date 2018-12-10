package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudI;
import com.kiprono.hr.model.Employee;

import javax.ejb.Local;

@Local
public interface EmployeeI extends CrudI<Employee> {

}
