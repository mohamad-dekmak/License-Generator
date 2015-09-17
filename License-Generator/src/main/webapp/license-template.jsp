<%@page import="m.dekmak.Encryptor"%><%@page import="m.dekmak.Database"%><%
    String download = request.getParameter("download");
    String id = request.getParameter("id");
    String client = request.getParameter("client");
    if (download != null && download.toString().equalsIgnoreCase("YES") && id != null && client != null) {
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "inline; filename=license-" + client + ".txt");
    }
    String license = "";
    Database db = new Database();
    license = db.downloadLicense(id);
    out.println(license);
%>