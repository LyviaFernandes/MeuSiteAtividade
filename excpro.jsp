<%-- 
    Document   : excpro
    Created on : 5 de mar. de 2025, 14:34:19
    Author     : 2DT
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão</title>
    </head>
    <body>
        <%
            int codigo;
            codigo=Integer.parseInt(request.getParameter("codigo"));
            try{
                //conectar ao banco de dados bancojsp
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/bancojsp";
                String user="root";
                String password="root";
                conecta=DriverManager.getConnection(url,user,password);
                
                String sql="DELETE FROM produto WHERE codigo=?";
                st=conecta.prepareStatement(sql);
                st.setInt(1,codigo);
                int resultado=st.executeUpdate();//executa o comando DELETE
                if (resultado==0){
                out.print("Este produto não está cadastrado no banco");
                

            } else{
                    out.print("O produto de codigo = " + codigo + " foi excluido com sucesso");
                    
            }
        }catch(Exception x){
            String erro = x.getMessage();
            out.print("Entre em contato com o Administrador e informe o erro");
                
            }
            %>
    </body>
</html>
