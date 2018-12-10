package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudBean;
import com.kiprono.hr.model.Role;

import javax.annotation.PostConstruct;
import javax.ejb.Stateful;

@Stateful
public class RoleBean extends CrudBean<Role> implements RoleI{
    @PostConstruct
    void setEntityClass(){
        this.entityClass = Role.class;

    }
}
