package com.kiprono.projectManagement.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "service")
public class Service implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String serviceName;
    private String serviceDescription;
    private String serviceUnits;
    private float serviceCostPerUnit;       //TODO create custom class for currency
    @Column(name="deleted")
    private boolean deleteFlag;

    public void setId(long id) {
        this.id = id;
    }

    public Service() {
    }

    public long getId() {
        return id;
    }


    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getServiceUnits() {
        return serviceUnits;
    }

    public void setServiceUnits(String serviceUnits) {
        this.serviceUnits = serviceUnits;
    }

    public float getServiceCostPerUnit() {
        return serviceCostPerUnit;
    }

    public void setServiceCostPerUnit(float serviceCostPerUnit) {
        this.serviceCostPerUnit = serviceCostPerUnit;
    }
}
