package JavaBeans;

import java.sql.SQLException;

public class Usuario extends Conexao {
	public int pkuser;
	public String nome;
	public String idade;
	public String email;
	public String senha;

	public boolean checarLogin() {
		try {
			sql = "select * from usuarios where email = ? and senha = ?";
			ps = con.prepareStatement(sql); // prepara SQL
			ps.setString(1, email); // Configura Parametros
			ps.setString(2, senha); // Configura Parametros
			tab = ps.executeQuery(); // Executa comando SQL
			if (tab.next())
				return true;
			this.statusSQL = null; // armazena null se deu tudo certo
		} catch (SQLException ex) {
			this.statusSQL = "Erro ao tentar buscar Usuário! Tente novamente! " + ex.getMessage();
		}
		return false;
	}

	public void incluir() {
		try {
			sql = "insert into usuarios (nome, idade, email, senha) " + "values (?,?,?,?) ";
			ps = con.prepareStatement(sql); // prepara SQL
			ps.setString(1, nome); // Configura Parametros
			ps.setString(2, idade); // Configura Parametros
			ps.setString(3, email);
			ps.setString(4, senha); // Configura Parametros
			ps.executeUpdate(); // executa comando SQL
			this.statusSQL = null; // armazena null se deu tudo certo
		} catch (SQLException ex) {
			this.statusSQL = "Erro ao incluir usuario! Tente novamente mais tarde! <br> " + ex.getMessage();
		}
	}

	public void alterar() {
		try {
			sql = "update usuarios set nome=?, email=?," + " senha=?, where email=? ";
			ps = con.prepareStatement(sql); // prepara SQL
			ps.setString(1, nome); // Configura Parametros
			ps.setString(2, idade); // Configura Parametros
			ps.setString(3, email);
			ps.setString(4, senha); // Configura Parametros
			ps.executeUpdate(); // executa comando SQL
			this.statusSQL = null; // armazena null se deu tudo certo
		} catch (SQLException ex) {
			this.statusSQL = "Erro ao Alterar usuario ! <br> " + ex.getMessage();
		}
	}
}
