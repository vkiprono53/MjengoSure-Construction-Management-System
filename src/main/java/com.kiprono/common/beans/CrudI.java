package com.kiprono.common.beans;

import com.kiprono.hr.model.Client;

import java.util.List;

public interface CrudI<T> {
    T add(T t);

    T edit(T t);

    Boolean delete(T t);

    T findById(long id);

    List<T> selectAll();

    List selectAll(Client client);
}
