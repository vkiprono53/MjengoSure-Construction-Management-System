package com.kiprono.hr.beans;

import com.kiprono.hr.model.User;

import javax.ejb.Local;
import javax.ejb.Remote;

@Local
public interface AuthI<T> {
    User login(String username, String password);
    boolean logout(T t);
}
