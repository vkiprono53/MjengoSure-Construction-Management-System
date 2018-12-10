package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudBean;
import com.kiprono.hr.model.Address;
import com.kiprono.hr.model.Client;
import com.kiprono.hr.model.Role;
import com.kiprono.hr.model.User;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateful;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateful
public class ClientBean extends CrudBean<Client> implements ClientI {
    @PostConstruct
    void setEntityClass(){
        this.entityClass = Client.class;

    }

}
