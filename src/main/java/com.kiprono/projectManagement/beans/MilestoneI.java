package com.kiprono.projectManagement.beans;

import com.kiprono.common.beans.CrudI;
import com.kiprono.projectManagement.model.Milestone;

import javax.ejb.Local;

@Local
public interface MilestoneI extends CrudI<Milestone> {
}
