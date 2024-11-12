<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="JavaBeans.Usuario" %>
<% 
    Usuario user = new Usuario();
    if ( !(user.statusSQL == null) ) 
        out.println(user.statusSQL);
    
    user.nome = request.getParameter("nome");
    user.idade = request.getParameter("idade");
    user.email = request.getParameter("email");
    user.senha = request.getParameter("senha");
    
    user.incluir();
    if ( !(user.statusSQL == null) ) 
        out.println(user.statusSQL);
    else
    {
      String sHTML="<center>Usuário criado com Sucesso!<br>"
       + "<a href = '../index.html'> Voltar </a></center>";
       out.println(sHTML);
      }
%>
