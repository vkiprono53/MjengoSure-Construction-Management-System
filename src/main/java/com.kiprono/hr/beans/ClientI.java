package com.kiprono.hr.beans;

import com.kiprono.common.beans.CrudI;
import com.kiprono.hr.model.Client;

import javax.ejb.Local;
import javax.ejb.Remote;
import java.util.List;

@Local
public interface ClientI extends CrudI<Client> {



}
