package com.kiprono.hr.beans;


import com.kiprono.common.beans.CrudI;
import com.kiprono.hr.model.User;

import javax.ejb.Local;

@Local
public interface UserI extends CrudI<User> {
}
