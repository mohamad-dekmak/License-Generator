<%-- 
    Document   : userBanUnban
    Created on : Aug 23, 2015, 3:13:53 PM
    Author     : mdekmak
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="m.dekmak.Database"%>
<%
    Database db = new Database();
    String strResponse = "";
    int returnString = 1;
    JSONObject returnObj = new JSONObject();
    if (request.getParameter("userAction") != null) {
        if (request.getParameter("userAction").equals("addProduct")) {
            String name = request.getParameter("name");
            strResponse = db.addProduct(name);
        } else if (request.getParameter("userAction").equals("editProduct")) {
            String oldName = request.getParameter("oldName");
            String newName = request.getParameter("newName");
            String responseMsg = db.editProduct(oldName, newName);
            if (responseMsg.equals("success")) {
                strResponse = "Updates changed successfully for product \"" + newName + "\"";
            } else {
                strResponse = responseMsg;
            }
        }else if (request.getParameter("userAction").equals("addClient")) {
            JSONObject postData = new JSONObject();
            postData = new JSONObject(request.getParameter("data"));
            strResponse = db.addClient(postData);
        }else if (request.getParameter("userAction").equals("editClient")) {
            String id = request.getParameter("id");
            JSONObject postData = new JSONObject();
            postData = new JSONObject(request.getParameter("data"));
            strResponse = db.editClient(id, postData);
        }else if (request.getParameter("userAction").equals("addLicense")) {
            JSONObject postData = new JSONObject();
            postData = new JSONObject(request.getParameter("data"));
            strResponse = db.addLicense(postData);
        }
    } else {
        strResponse = "user action not defined";
    }
%>
<%
    JSONObject obj = new JSONObject();
    if (returnString == 1) {
        obj.put("data", strResponse);
    } else {
        obj.put("data", returnObj);
    }
    out.print(obj);
    out.flush();
%>
