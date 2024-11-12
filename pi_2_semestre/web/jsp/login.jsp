<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="JavaBeans.Usuario"%>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    Usuario usuario = new Usuario();

    usuario.email = email;
    usuario.senha = senha;
    if (email == "" || senha == "") {
        String saida = "<script>alert('Por favor, preencha os campos com o seu cadastro correto.');"
                + "window.location.assign('../perfil.html');</script>";
        out.println(saida);
    } else if (usuario.checarLogin() == true) {
        response.sendRedirect("../index.html");
    } else {
        String saida = "<center>Login ou senha não encontrados. Faça o cadastro para prosseguir."
                + "<a href = '../perfil.html'> Voltar </a></center>";
        out.println(saida);
    }

%>

