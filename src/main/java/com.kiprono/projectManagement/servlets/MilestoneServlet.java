package com.kiprono.projectManagement.servlets;

import com.kiprono.common.servlets.BaseServlet;
import com.kiprono.projectManagement.beans.MilestoneI;
import com.kiprono.projectManagement.beans.ProjectI;
import com.kiprono.projectManagement.model.Milestone;
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


@WebServlet("/milestoneServlet")

public class MilestoneServlet extends BaseServlet{

    @EJB
    MilestoneI milestoneI;

    @EJB
    ProjectI projectI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String button = req.getParameter("button");
        if (button.equalsIgnoreCase("saveButton")) {
            try {
                createMilestone(req, resp);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        } else if (button.equalsIgnoreCase("deleteButton")) {
            deleteMilestone(req, resp);

        }
        else if (button.equalsIgnoreCase("updateButton")){
            getbyIdForUpdate(req,resp);
        }
        else if (button.equalsIgnoreCase("updatingButton")){
            try {
                updateMilestone(req, resp);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

    protected void createMilestone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {

        Milestone milestone = new Milestone();
        Map milestoneMap = getFormParameters(req);

        SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");

        milestone.setMilestoneName((String) milestoneMap.get("milestoneName"));
        milestone.setMilestoneDescription((String) milestoneMap.get("milestoneDescription"));
        milestone.setExpectedStartDate(date.parse((String) milestoneMap.get("expectedStartDate")));
        milestone.setExpectedEndDate(date.parse((String) milestoneMap.get("expectedEndDate")));
        milestone.setExpectedDuration(Long.parseLong((String) milestoneMap.get("expectedDuration")));
        milestoneI.add(milestone);

        getMilestones(req, resp);

    }

    /**
     * deleteProject that deletes the role
     */
    public void deleteMilestone(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        long milestoneId = Long.parseLong(req.getParameter("id"));

        Milestone id = milestoneI.findById(milestoneId);

        if (milestoneI.delete(id)) {
            getMilestones(req, resp);
        }
    }


    /**
     * getbyIdForUpdate method that get Employee by Id and redirect to the editing page
     */
    public void getbyIdForUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long milestoneId = Long.parseLong(req.getParameter("id"));

        HttpSession session = req.getSession();
        session.setAttribute("milestoneEdit", milestoneI.findById(milestoneId));

        req.getRequestDispatcher("milestoneUpdate.jsp").forward(req, resp);

    }

    public void updateMilestone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {

        Milestone milestone = new Milestone();

        Map milestoneMap = getFormParameters(req);

        SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");

        String milestoneName = (String) milestoneMap.get("milestoneName");
        String milestoneDescription = (String) milestoneMap.get("milestoneDescription");
        Date expectedStartDate = date.parse((String) milestoneMap.get("expectedStartDate"));
        Date expectedEndDate = date.parse((String) milestoneMap.get("expectedEndDate"));
        long expectedDuration = Long.parseLong((String) milestoneMap.get("expectedDuration"));
        Date actualStartDate = date.parse((String) milestoneMap.get("expectedStartDate"));
        Date actualEndDate = date.parse((String) milestoneMap.get("actualEndDate"));
        long actualDuration = Long.parseLong((String) milestoneMap.get("actualDuration"));

        milestone.setMilestoneName(milestoneName);
        milestone.setMilestoneDescription(milestoneDescription);
        milestone.setExpectedStartDate(expectedStartDate);
        milestone.setExpectedEndDate(expectedEndDate);
        milestone.setExpectedDuration(expectedDuration);
        milestone.setActualStartDate(actualStartDate);
        milestone.setActualEndDate(actualEndDate);
        milestone.setActualDuration(actualDuration);


        long id = Long.parseLong(String.valueOf(milestoneMap.get("id")));
        milestone.setId(id);

        milestoneI.edit(milestone);
         getMilestones(req, resp);


    }


    private void getMilestones(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("milestones", milestoneI.selectAll());
        req.getRequestDispatcher("milestone.jsp").forward(req, resp);
    }
}
