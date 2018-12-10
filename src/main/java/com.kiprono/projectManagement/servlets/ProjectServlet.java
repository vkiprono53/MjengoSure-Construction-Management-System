package com.kiprono.projectManagement.servlets;

import com.kiprono.common.servlets.BaseServlet;
import com.kiprono.hr.beans.EmployeeI;
import com.kiprono.hr.model.Client;
import com.kiprono.hr.model.Employee;
import com.kiprono.hr.model.Role;
import com.kiprono.hr.model.User;
import com.kiprono.projectManagement.beans.ProjectI;
import com.kiprono.projectManagement.model.Project;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet("/projectServlet")
public class ProjectServlet extends BaseServlet {
    @EJB
    ProjectI projectI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");
        if (button.equalsIgnoreCase("saveButton")) {
            try {
                createProject(req, resp);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteProject(req, resp);

        }
        else if (button.equalsIgnoreCase("updateButton")){
            getbyIdForUpdate(req,resp);
        }
        else if (button.equalsIgnoreCase("updatingButton")){
            try {
                updateProject(req, resp);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

    protected void createProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {

        Project project = new Project();

        HttpSession session = req.getSession();
        //Client:
        Client client = (Client) session.getAttribute("clientId");

        Map projectMap = getFormParameters(req);

        SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");

        String projectName = (String) projectMap.get("projectName");
        String projectDescription = (String) projectMap.get("projectDescription");
        String projectLocation = (String) projectMap.get("projectLocation");
        String projectCity = (String) projectMap.get("projectCity");
        String projectCountry = (String) projectMap.get("projectCountry");
        Date expectedStartDate = date.parse((String) projectMap.get("expectedStartDate"));
        Date expectedEndDate = date.parse((String) projectMap.get("expectedEndDate"));
        long expectedDuration = Long.parseLong((String) projectMap.get("expectedDuration"));

        project.setProjectName(projectName);
        project.setProjectDescription(projectDescription);
        project.setProjectLocation(projectLocation);
        project.setProjectCity(projectCity);
        project.setProjectCountry(projectCountry);
        project.setExpectedStartDate(expectedStartDate);
        project.setExpectedEndDate(expectedEndDate);
        project.setExpectedDuration(expectedDuration);

        //Role

      //Client:
        project.setClient(client);

        projectI.add(project);

        getProjects(req, resp);

    }

    /**
     * deleteProject that deletes the role
     */
    public void deleteProject(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        long projectId = Long.parseLong(req.getParameter("id"));

        Project id = projectI.findById(projectId);

        if (projectI.delete(id)) {
            getProjects(req, resp);
        }
    }


    /**
     * getbyIdForUpdate method that get Employee by Id and redirect to the editing page
     */
    public void getbyIdForUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long projectId = Long.parseLong(req.getParameter("id"));

        HttpSession session = req.getSession();
        session.setAttribute("projectEdit", projectI.findById(projectId));

        req.getRequestDispatcher("projectUpdate.jsp").forward(req, resp);

    }

    public void updateProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {

        Project project = new Project();

        Map projectMap = getFormParameters(req);

        SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");

        project.setProjectName((String) projectMap.get("projectName"));
        project.setProjectLocation((String) projectMap.get("projectLocation"));
        project.setProjectDescription((String) projectMap.get("projectDescription"));
        project.setProjectCity((String) projectMap.get("projectCity"));
        project.setProjectCountry((String) projectMap.get("projectCountry"));
        project.setExpectedStartDate(date.parse((String) projectMap.get("expectedStartDate")));
        project.setExpectedEndDate(date.parse((String) projectMap.get("expectedEndDate")));
        project.setExpectedDuration(Long.parseLong((String) projectMap.get("expectedDuration")));
        project.setActualStartDate(date.parse((String) projectMap.get("expectedStartDate")));
        project.setActualEndDate(date.parse((String) projectMap.get("actualEndDate")));
        project.setActualDuration(Long.parseLong((String) projectMap.get("actualDuration")));
        //Role

        long id = Long.parseLong(String.valueOf(projectMap.get("id")));
        project.setId(id);

        projectI.edit(project);

        getProjects(req, resp);


    }


    private void getProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");
        session.setAttribute("projects", projectI.selectAll(client));
        req.getRequestDispatcher("project.jsp").forward(req, resp);

    }
}
