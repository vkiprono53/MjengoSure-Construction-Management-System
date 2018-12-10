package com.kiprono.common.beans;

import com.kiprono.hr.model.Client;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import java.util.List;

public class CrudBean<T> implements CrudI<T> {
    @PersistenceContext
    EntityManager em;
    protected Class<T> entityClass;

    @Override
    public T add(T t) {

        try {
            em.persist(t);

        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }

        return null;
    }

    @Override
    public T edit(T t) {
        try {

            return em.merge(t);

        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }

        return null;
    }


    @Override
    public Boolean delete(T t) {
        try {
            t = em.merge(t);
            em.remove(t);
            return true;

        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }

        return false;
    }

    @Override
    public T findById(long id) {
        try {
            return em.find(entityClass, id);

        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    @Override
    public List<T> selectAll() {

        try {

            return em.createQuery("SELECT t FROM " + entityClass.getSimpleName() + " t" + " WHERE deleteFlag  = 'false'").getResultList() ;
        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {

        }
        return null;
    }

    @Override
    public List selectAll(Client client) {
        try {

            return em.createQuery("SELECT t FROM " + entityClass.getSimpleName() + " t" + " WHERE t.client like :t")
                    .setParameter("t", client )
                    .getResultList() ;
        } catch (PersistenceException e) {
            e.printStackTrace();
        } finally {

        }
        return null;

    }
}
