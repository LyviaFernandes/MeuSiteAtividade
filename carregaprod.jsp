<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
        <%
        //recebe o código do produto a ser alterado e armazena na variavel.
        int codigo;
        codigo=Integer.parseInt(request.getParameter("codigo"));
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/bancojsp";
        String user="root";
        String password="root";
        
        conecta = DriverManager.getConnection(url,user,password);
        //Buscar o produto pelo código recebido
        String sql = ("SELECT * FROM produto WHERE codigo=?");
        st=conecta.prepareStatement(sql);
        //ResultSet serve para guardar aquilo que é trazido do BD
        st.setInt(1,codigo);
        ResultSet resultado = st.executeQuery();
        //Verifica se o prduto do código informado foi encontrado
        if (!resultado.next()) {
            out.print("Este produto não foi localizado");
            } else{ // se encontrou o produto na tabela, vamos carregar estes dados dentro de um formulario
            
        %>
        
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código: </label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo")%>" readonly>
                <!-- readonly: propriedade somente leitura, não permite alteração no campo -->
            </p>
            <p>
                <label for="nome" >Nome do produto: </label>
                <input type="text" name="nome" id="nome" value="<%= resultado.getString("nome")%>"> 
            </p>
            <P>
                <label for="marca" >Marca: </label>
                <input type:"text" name="marca" id="marca" value="<%= resultado.getString("marca")%>">
            </P>
            <P>
                <label for="preco" >Preço: </label>
                <input type:"number" name="preco" id="preco" value="<%= resultado.getString("preco")%>">
            </P>
            <p>
                <input type="submit" value="Salvar alterações">
            </p>
        </form>
                <%
                    }
                %>
    </body>
</html>
