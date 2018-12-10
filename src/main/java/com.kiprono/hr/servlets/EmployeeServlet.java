package com.kiprono.hr.servlets;

import com.kiprono.common.servlets.BaseServlet;
import com.kiprono.hr.beans.EmployeeI;
import com.kiprono.hr.beans.UserI;
import com.kiprono.hr.model.Client;
import com.kiprono.hr.model.Employee;
import com.kiprono.hr.model.Role;
import com.kiprono.hr.model.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/employeeServlet")
public class EmployeeServlet extends BaseServlet {
    @EJB
    EmployeeI employeeI;

    @EJB
    UserI userI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");

        //Calls createEmployee method:
        if (button.equalsIgnoreCase("saveButton")) {
            createEmployee(req, resp);

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteEmployee(req, resp);

        } else if (button.equalsIgnoreCase("updateButton")) {
            getbyIdForUpdate(req, resp);
        } else if (button.equalsIgnoreCase("updatingButton")) {
            updateEmployee(req, resp);
        }
    }


    /**
     * Method to create an Employee
     */
    private void createEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Role role = new Role();
        User user = new User();
        Employee employee = new Employee();
        // Client client = new Client();
        Client client = (Client) session.getAttribute("clientId");

        Map employeeMap = getFormParameters(req);

        String name = (String) employeeMap.get("name");
        String phone = (String) employeeMap.get("phoneNumber");

        //Role
        long employeeRole = Long.parseLong(employeeMap.get("role").toString());

        String username = (String) employeeMap.get("username");
        String password = (String) employeeMap.get("password");

        //Employee:
        employee.setName(name);
        employee.setPhoneNumber(phone);

        employee.setClient(client);
        //User:
      //  employee.setClient();

        //Role:
        role.setId(employeeRole);
        //Setting User:

        user.setRole(role);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmployee(employee);

        employeeI.add(employee);
        userI.add(user);

        getEmployees(req, resp);

    }

    /**
     * deleteEmployee that deletes the Employee
     */
    private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        long employeeId = Long.parseLong(req.getParameter("id"));

        Employee id = employeeI.findById(employeeId);

        if (employeeI.delete(id)) {
            getEmployees(req, resp);
        }

    }

    /**
     * getbyIdForUpdate method that get Employee by Id and redirect to the editing page
     */
    private void getbyIdForUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long employeeId = Long.parseLong(req.getParameter("id"));

        HttpSession session = req.getSession();
        session.setAttribute("employeeEdit", employeeI.findById(employeeId));

        req.getRequestDispatcher("employeeUpdate.jsp").forward(req, resp);

    }

    /**
     * updateEmployee method that updates the existing role:
     */
    private void updateEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Employee employee = new Employee();
        Role role = new Role();
        User user = new User();
        Client client = (Client) req.getAttribute("clientId");

        Map employeeMap = getFormParameters(req);

        String name = (String) employeeMap.get("name");
        String phone = (String) employeeMap.get("phone");

        //Role
        long employeeRole = Long.parseLong(employeeMap.get("employeeRole").toString());

        //User:
        String username = (String) employeeMap.get("username");
        String password = (String) employeeMap.get("password");

        //Role:
        role.setId(employeeRole);
        client.setId(user.getClient().getId());

        //Setting User:
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);

        //Employee:
        employee.setName(name);
        employee.setPhoneNumber(phone);

       employee.setClient(client);


        long id = Long.parseLong(String.valueOf(employeeMap.get("id")));
        employee.setId(id);

        employeeI.edit(employee);
        getEmployees(req, resp);

    }


    private void getEmployees(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
/*        HttpSession session = req.getSession();
       session.setAttribute("employees", employeeI.selectAll((Client) req.getSession().getAttribute("client")));
        req.getRequestDispatcher("employee.jsp").forward(req, resp);*/


        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");
        session.setAttribute("employees", employeeI.selectAll(client));
        req.getRequestDispatcher("employee.jsp").forward(req, resp);
    }
}

