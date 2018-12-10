package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudI;
import com.kiprono.hr.model.Role;

import javax.ejb.Local;
import javax.enterprise.context.RequestScoped;


@Local
public interface RoleI extends CrudI<Role> {
}
