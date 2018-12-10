package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudBean;
import com.kiprono.hr.model.Employee;
import com.kiprono.hr.model.User;

import javax.annotation.PostConstruct;
import javax.ejb.Stateful;

@Stateful
public class UserBean extends CrudBean<User> implements UserI {
    @PostConstruct
    void setEntityClass() {
        this.entityClass = User.class;
    }
}
