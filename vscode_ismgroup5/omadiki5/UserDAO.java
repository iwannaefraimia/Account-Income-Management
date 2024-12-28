package omadiki5;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO provides all the necessary methods related to users.
 * 
 * @author
 *
 */
public class UserDAO {

	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {

		List<User> list = new ArrayList<>();
		DB db = new DB();
		PreparedStatement stmt = null;
		Connection con = null;
		ResultSet rs;
		String query = "SELECT * FROM users;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getString("username"), rs.getString("password"), rs.getString("fullname"),
						rs.getString("email"), rs.getString("phone"));
				list.add(user);
			}
			rs.close();
			stmt.close();
			return list;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {
			if (con != null) {
				db.close();
			}
		}

	} // End of getUsers

	/**
	 * Search user by username
	 * 
	 * @param username, String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {

		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM users WHERE username = ?;";
		try {

			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);

			stmt.setString(1, username);

			ResultSet rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				return null;

			}

			return new User(rs.getString("username"),
					rs.getString("password"),
					rs.getString("fullname"),
					rs.getString("email"),
					rs.getString("phone"));

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}

	} // End of findUser

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {

		DB db = new DB();
		PreparedStatement stmt = null;
		Connection con = null;
		ResultSet rs;
		String query = "SELECT * FROM users WHERE username = ? AND password = ?;";
		try {
			con = db.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				db.close();
				throw new Exception("Wrong username or password");
			}

			User user = new User(rs.getString("username"), rs.getString("password"), rs.getString("fullname"),
					rs.getString("email"), rs.getString("phone"));

			rs.close();
			stmt.close();
			return user;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
		}

	} // End of authenticate

	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {

		int count = 0;
		DB db = new DB();
		Connection con = null;
		String query = "SELECT count(*) FROM users WHERE username = ? OR email = ?;";

		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getEmail());
			try (ResultSet rs = stmt.executeQuery()) {
				rs.next();
				count = rs.getInt(1);
				if (count > 0) {
					rs.close();
					stmt.close();
					throw new Exception("Sorry, username or email already registered");
				}
			}

			PreparedStatement stmt1 = null;
			String query1 = "INSERT INTO users (username, password, fullname, email, phone) VALUES (?,?,?,?,?)";
			try {
				stmt1 = con.prepareStatement(query1);
				stmt1.setString(1, user.getUsername());
				stmt1.setString(2, user.getPassword());
				stmt1.setString(3, user.getFullname());
				stmt1.setString(4, user.getEmail());
				stmt1.setString(5, user.getPhone());
				stmt1.executeUpdate();
				stmt1.close();

			} catch (SQLException e) {
				throw new Exception(e.getMessage());
			}

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
		}

	}// end of register

} // End of class
