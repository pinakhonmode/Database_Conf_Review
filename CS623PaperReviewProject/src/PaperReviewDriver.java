import java.sql.*;
import java.util.Scanner;

public class PaperReviewDriver {

	
	public static void executeQuery1(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT Author.EmailAddr,Author.Firstname, Author.Lastname, Paper.ID, Paper.Title, Paper.Abstract FROM Author inner join Paper on Author.EmailAddr=Paper.AuthorEmail");
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= columnsNumber; i++) {
					if (i > 1)
						System.out.print(",  ");
					String columnValue = rs.getString(i);
					System.out.print(columnValue + " " + rsmd.getColumnName(i));
				}
				System.out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void executeQuery2(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(" SELECT * FROM Review WHERE Recommendation='Publish'");
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= columnsNumber; i++) {
					if (i > 1)
						System.out.print(",  ");
					String columnValue = rs.getString(i);
					System.out.print(columnValue + " " + rsmd.getColumnName(i));
				}
				System.out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void executeQuery3(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(" SELECT count(ID) FROM Paper");
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= columnsNumber; i++) {
					if (i > 1)
						System.out.print(",  ");
					String columnValue = rs.getString(i);
					System.out.print(columnValue + " " + rsmd.getColumnName(i));
				}
				System.out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	static void Query4Insert(String Email, String Firstname, String Lastname, Connection con) {

		try {
			String sqlQuery = " INSERT INTO Author values (?,?,?)";
			PreparedStatement preparedInsert = con.prepareStatement(sqlQuery);
			preparedInsert.setString(1, Email);
			preparedInsert.setString(2, Firstname);
			preparedInsert.setString(3, Lastname);
			int status = preparedInsert.executeUpdate();
			if (status == 1) {
				System.out.println("Record inserted in table Author");
			} else {
				System.out.println("Error while inserting");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	static void Query4Insertpaper(String Title, String Filename, String abstrct, String emailid, Connection con) {

		try {

			String sqlQuery1 = " INSERT INTO Paper(Title,Abstract,Filename,AuthorEmail) values (?,?,?,?);";
			PreparedStatement preparedInsert1 = con.prepareStatement(sqlQuery1);
			preparedInsert1.setString(1, Title);
			preparedInsert1.setString(2, abstrct);
			preparedInsert1.setString(3, Filename);
			preparedInsert1.setString(4, emailid);

			int status1 = preparedInsert1.executeUpdate();
			if (status1 == 1) {
				System.out.println("Record inserted in table Paper");
			} else {
				System.out.println("Error while inserting");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}


	public static void executeQuery5(Connection con) {
		try {
			Statement stmt = con.createStatement();
			int rs = stmt.executeUpdate("DELETE FROM Author WHERE EmailAddr = 'jkrowling@def.com'");
			if (rs == 1) {
				System.out.println("Record Deleted");
			} else {
				System.out.println("Record Not Deleted");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Record Not Deleted as it violates Entity and referal key constraints!");
		}

	}

	public static void main(String args[]) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Review_Conference?&serverTimezone=UTC", "root", "pinak");

			System.out.println("This is the ouput of Query one:");
			executeQuery1(con);
			System.out.println("\nThis is the ouput of Query two:");
			executeQuery2(con);
			System.out.println("\nThis is the ouput of Query three:");
			executeQuery3(con);
			System.out.println("\nThis is the ouput of Query four:");

			Scanner scanner = new Scanner(System.in);
			System.out.println("Enter the Email Address: ");
			String EmailAddr = scanner.nextLine();
			System.out.println("Enter the First Name: ");
			String Firstname = scanner.nextLine();
			System.out.println("Enter the Last Name: ");
			String Lastname = scanner.nextLine();
			Query4Insert(EmailAddr, Firstname, Lastname, con);

			Scanner scanner1 = new Scanner(System.in);
			System.out.println("Enter the Title: ");
			String Title = scanner1.nextLine();
			System.out.println("Enter the File Name: ");
			String Filename = scanner1.nextLine();
			System.out.println("Enter the Abstract: ");
			String abstrct = scanner1.nextLine();
			System.out.println("Enter the Email Address: ");
			String emailid = scanner.nextLine();
			Query4Insertpaper(Title, Filename, abstrct, emailid, con);

			System.out.println("\nThis is the ouput of Query five:");
			executeQuery5(con);

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
