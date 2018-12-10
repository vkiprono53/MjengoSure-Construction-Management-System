package com.kiprono.projectManagement.beans;

import com.kiprono.common.beans.CrudBean;
import com.kiprono.projectManagement.model.Milestone;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class MilestoneBean extends CrudBean<Milestone> implements MilestoneI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass = Milestone.class;
    }

}
