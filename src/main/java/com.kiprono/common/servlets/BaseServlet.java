package com.kiprono.common.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/baseServlet")
public class BaseServlet extends HttpServlet {

    /**
     * Method to get all the Parameters from the form:
     */
    protected Map getFormParameters(HttpServletRequest req) throws ServletException, IOException {
        Enumeration paramNames = req.getParameterNames();

        Map<String, String> map = new HashMap<>();

        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            //Get each request parameter value:
            String paramValue = req.getParameter(paramName);

            map.put(paramName, paramValue);

        }
        return map;
    }


}
