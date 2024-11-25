<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="JavaBeans.Usuario"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>stand out.</title>
        <link rel="stylesheet" href="estilo.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
            rel="stylesheet">
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="destaque">stand out.</h1>
                <nav>
                    <ul>
                        <ol>
                            <a href="index.html"><strong>Home</strong></a>
                        </ol>
                        <ol>
                            <a href="descubra.html"><strong>Descubra</strong></a>
                        </ol>
                        <ol>
                            <a href="crie.html"><strong>Crie</strong></a>
                        </ol>
                        <ol>
                            <a href="conexoes.html"><strong>Conexões</strong></a>
                        </ol>
                        <ol>
                            <a href="login.jsp"><strong>Seu Perfil</strong></a>
                        </ol>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <form action="jsp/login.jsp" name=formperfil enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>Email:</td>
                        <td><input type="email" name="email" placeholder="Email"></td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><input type="password" name="senha" placeholder="Senha"></td>
                    </tr>
                </table>
                <input type="submit" value="Logar">
                <input type="button" value="Cadastrar" onclick = "window.location.assign('cadastrar.html');">
            </form>
        </main>

        <footer>
            <div class="destaque">
                <h2>
                    stand<br>out.
                </h2>
            </div>
            <nav>
                <ul>
                    <p>MARCA</p>
                    <ol>
                        <p>Sobre</p>
                    </ol>
                    <ol>
                        <p>Missão</p>
                    </ol>
                    <ol>
                        <p>Contato</p>
                    </ol>
                </ul>
            </nav>
            <p class="termos">
                Todos os direitos reservados a empresa "stand out."<br>Termos e
                Condições | Privacidade
            </p>
        </footer>
    </body>
</html>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>

<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(); // A variável session deve ser inicializada corretamente
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://localhost:3306/contas";
        String user = "root";
        String pass = "";
        con = DriverManager.getConnection(url, user, pass);

        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, senha);
        rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("nome", rs.getString("nome"));
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("foto", rs.getBlob("foto"));
            session.setAttribute("pkuser", rs.getInt("pkuser"));
            
            response.sendRedirect(request.getContextPath() + "/indexlogado.html");
        } else {
            out.println("<script>alert('Email ou senha incorretos!');</script>");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('Erro ao conectar com o banco de dados!');</script>");
    }
%>



