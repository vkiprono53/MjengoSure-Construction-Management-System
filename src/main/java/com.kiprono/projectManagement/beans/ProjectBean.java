package com.kiprono.projectManagement.beans;

import com.kiprono.common.beans.CrudBean;
import com.kiprono.hr.model.Role;
import com.kiprono.projectManagement.model.Project;

import javax.annotation.PostConstruct;
import javax.ejb.Stateful;
import javax.ejb.Stateless;

@Stateless
public class ProjectBean extends CrudBean<Project> implements ProjectI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass = Project.class;

    }
}
