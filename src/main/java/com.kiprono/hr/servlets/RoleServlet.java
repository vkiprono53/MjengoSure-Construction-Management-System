package com.kiprono.hr.servlets;

import com.kiprono.common.servlets.BaseServlet;
import com.kiprono.hr.beans.RoleI;
import com.kiprono.hr.enums.AccessLevel;
import com.kiprono.hr.model.Role;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/roleServlet")
public class RoleServlet extends BaseServlet {

    @EJB
    RoleI roleI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {





        String button = req.getParameter("button");

        //Calls createRole method:
        if (button.equalsIgnoreCase("saveButton")) {
            createRole(req, resp);

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteRole(req, resp);

        }
        else if (button.equalsIgnoreCase("updateButton")){
            getbyIdForUpdate(req,resp);
        }
        else if (button.equalsIgnoreCase("updatingButton")){
            updateRole(req, resp);
        }

    }

    /**
     * doGet method
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }


    /**
     * Method to create a role
     */
    protected void createRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Role role = new Role();

        Map roleMap = getFormParameters(req);

        String roleName = (String) roleMap.get("role");
        String accessLevel = (String) roleMap.get("accessLevel");

        role.setRole(roleName);
        role.setAccessLevel(accessLevel);


        roleI.add(role);

        fetchRole(req, resp);


    }

    /**
     *deleteRole that deletes the role
     */
    public void deleteRole(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {


        long roleId = Long.parseLong(req.getParameter("id"));

        Role role = roleI.findById(roleId);

        role.setId(roleId);
        role.setDeleteFlag(true);

        if (roleI.edit(role) != null) {
            fetchRole(req, resp);

        }


    }

    /**
     * getbyIdForUpdate method that get role by Id and redirect to the editing page
     */
    public void getbyIdForUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

           long roleId = Long.parseLong(req.getParameter("id"));

        HttpSession session = req.getSession();
        session.setAttribute("roleEdit", roleI.findById(roleId));


        req.getRequestDispatcher("roleUpdate.jsp").forward(req, resp);

    }

    /**
     *updateRole method that updates the existing role:
     */
    public void updateRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Role role = new Role();

        Map roleMap = getFormParameters(req);

        String roleName = (String) roleMap.get("role");
        String accessLevel = (String) roleMap.get("accessLevel");

       long roleId = Long.parseLong(String.valueOf(roleMap.get("id")));


       // roleI.findById(roleId);

        role.setRole(roleName);
        role.setId(roleId);
        role.setAccessLevel(accessLevel);

        roleI.edit(role);

        fetchRole(req, resp);

    }

    /**
     *fetchRole method that populate roles in the database
     */
    private void fetchRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("roles", roleI.selectAll());
        req.getRequestDispatcher("role.jsp").forward(req, resp);
    }

}
