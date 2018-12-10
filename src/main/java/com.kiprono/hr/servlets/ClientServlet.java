package com.kiprono.hr.servlets;

import com.kiprono.common.servlets.BaseServlet;
import com.kiprono.hr.beans.ClientI;
import com.kiprono.hr.beans.UserI;
import com.kiprono.hr.enums.AccessLevel;
import com.kiprono.hr.model.*;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/ClientServlet")
public class ClientServlet extends BaseServlet {
    @EJB
    ClientI clientI;

    @EJB
    UserI userI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String button = req.getParameter("button");

        //Calls createEmployee method:
        if (button.equalsIgnoreCase("saveButton")) {
            createClient(req, resp);
        }
    }

    protected void createClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Client client = new Client();
        Role role = new Role();
        User user = new User();
        Address address = new Address();


        Map clientMap = getFormParameters(req);

        String name = (String) clientMap.get("name");
        //Address
        String physicalAddress = (String) clientMap.get("physicalAddress");
        String email = (String) clientMap.get("email");
        String phoneNumber = (String) clientMap.get("phoneNumber");
        //User:
        long clientRole = Long.parseLong(clientMap.get("role").toString());
        String username = (String) clientMap.get("username");
        String password = (String) clientMap.get("password");

        //setting Address
        address.setPhysicalAddress(physicalAddress);
        address.setEmail(email);
        address.setPhoneNumber(phoneNumber);
        //Seting role
        role.setId(clientRole);
        //role.setRole(clientRole);
      //  role.setAccessLevel(AccessLevel.CLIENT);

        client.setName(name);
        client.setClientCode("Cl"+ phoneNumber);
        client.setAddress(address);

        user.setRole(role);
        user.setUsername(username);
        user.setPassword(password);
        user.setClient(client);

        clientI.add(client);
        userI.add(user);

        req.setAttribute("user", user);


            resp.sendRedirect("index.jsp");


    }
    private void getClients(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("clients", clientI.selectAll());
       // req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

}
