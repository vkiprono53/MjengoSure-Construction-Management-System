package com.kiprono.hr.webservice;/*
package com.kiprono.hr.webservice;

import com.kiprono.hr.beans.ClientI;
import com.kiprono.hr.model.Client;

import javax.ejb.EJB;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/getClients")
public class ClientData {
    @EJB
   private ClientI clientI;
    //ClientBean clientBean = new ClientBean();


    @POST
    @Path("/clients")
    @Produces(MediaType.APPLICATION_JSON)


    public List<Client> getMsg(){
        return clientI.findAll();
            }

}
*/
