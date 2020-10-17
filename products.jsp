<%@page import = "java.sql.Statement" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "org.json.simple.JSONObject" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "org.json.simple.JSONArray" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%

JSONArray list = new JSONArray();
Connection con;
PreparedStatement pst; 
ResultSet rs;


Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?useSSL=false", "root", "Netid~1853");

String query = "select * from products";
Statement stmt = con.createStatement();

rs = stmt.executeQuery(query);

while(rs.next()){
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String url = rs.getString("imgurl");
    String name = rs.getString("pname");
    String type = rs.getString("ptype");
    String seller = rs.getString("seller");
    String price = rs.getString("price");

    obj.put("url", url);
    obj.put("name", name);
    obj.put("type", type);
    obj.put("seller", seller);
    obj.put("price", price);
    obj.put("id", id);

    list.add(obj);
}

out.print(list.toJSONString());
out.flush();

%>