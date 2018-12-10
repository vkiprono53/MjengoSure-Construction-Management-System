package com.kiprono.hr.beans;

import com.kiprono.hr.model.User;

import javax.ejb.Stateful;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Stateless
public class AuthBean<T> implements AuthI<T> {
    @PersistenceContext
    EntityManager em;


    @Override
    public User login(String username, String password) {
        return (User) em.createNamedQuery("User.fetchUser").setParameter("username", username).setParameter("password", password).getSingleResult();
     //   return query.getResultList().size() > 0 ? true : false;
    }

    @Override
    public boolean logout(T t) {
        return false;
    }
}
