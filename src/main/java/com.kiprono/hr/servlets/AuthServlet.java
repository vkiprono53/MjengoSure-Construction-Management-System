package com.kiprono.hr.servlets;

import com.kiprono.hr.beans.AuthI;
import com.kiprono.hr.beans.ClientI;
import com.kiprono.hr.beans.EmployeeI;
import com.kiprono.hr.beans.RoleI;
import com.kiprono.hr.model.User;
import com.kiprono.projectManagement.beans.MilestoneI;
import com.kiprono.projectManagement.beans.ProjectI;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class AuthServlet extends HttpServlet {
    @EJB
    AuthI authI;

    @EJB
    ClientI clientI;

    @EJB
    ProjectI projectI;

    @EJB
    RoleI roleI;

    @EJB
    MilestoneI milestoneI;

    @EJB
    EmployeeI employeeI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = authI.login(username, password);

        if (user !=null){
            HttpSession session = req.getSession();

            session.setAttribute("username", username);
            session.setAttribute("clientId", user.getClient());
            session.setAttribute("roles", roleI.selectAll());
            session.setAttribute("projects", projectI.selectAll(user.getClient()));
            session.setAttribute("milestones", milestoneI.selectAll());
           session.setAttribute("employees", employeeI.selectAll(user.getClient()));
            resp.sendRedirect("dashboard.jsp");

        }

         else {

            out.print("<h2>Wrong username or password, Please try again:</h2>");

            req.getRequestDispatcher("index.jsp").include(req, resp);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Removing the session and all the data:
        HttpSession session = req.getSession();
        session.removeAttribute("username");
        session.removeAttribute("clientId");
        session.removeAttribute("roles");
        session.removeAttribute("projects");

        session.invalidate();
        //Redirecting to the login page:
        resp.sendRedirect("index.jsp");
    }
}
