package com.kiprono.projectManagement.beans;

import com.kiprono.common.beans.CrudI;
import com.kiprono.projectManagement.model.Project;

import javax.ejb.Local;

@Local
public interface ProjectI extends CrudI<Project> {
}
