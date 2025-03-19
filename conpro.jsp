<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
        //recebe o nome do produto digitado no formulario conpro.html
        String n;
        //n vai receber o nome do produto
        n=request.getParameter("nome");
        
        try{
        //fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url="jdbc:mysql://localhost:3306/bancojsp";
            String user="root";
            String password="root";
            
            conecta=DriverManager.getConnection(url,user,password);
            //Lista o dado da tabela produto do Banco de Dados
            String sql=("SELECT * FROM produto WHERE nome LIKE ?");
            
            st=conecta.prepareStatement(sql);
            //na linha abaixo estamos dizendo que vai dentro do ponto de interrogação, que será concatenado com % para poder pegar qualquer parte do nome do produto salvo no banco
            st.setString(1,"%" + n + "%");
            //ResultSet serve para guardar aquilo que é trazido do Banco de Dados
            ResultSet rs=st.executeQuery();
            //Enquanto não chegar no final do Banco de Dados ele vai executar o que estiver dentro do while. Vamos montar uma tabela html, criando o títuli da tabela e encerrar o código Java
            %>
            <table>
                <tr>
                    
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Marca</th>
                    <th>Preço</th>
               
                </tr>
                <%
                    while(rs.next()){
                %>
                
                <tr>
                    <td>
                        <%=rs.getString("codigo")%>
                    </td>
                    <td>
                        <%=rs.getString("nome")%>
                    </td>
                    <td>
                        <%=rs.getString("marca")%>
                    </td>
                    <td>
                        <%=rs.getString("preco")%>
                    </td>
                    
                </tr>
                <%
                }
            %>
            </table>
            <%
                }catch (Exception x){
                    out.print("Mensagem de erro: " + x.getMessage());
                }
            %>     
    </body>
</html>
