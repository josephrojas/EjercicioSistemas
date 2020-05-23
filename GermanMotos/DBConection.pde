class DBConection {
  public static final String URL = "jdbc:mysql://localhost:3306/german?useSSL=false";
  public static final String USER = "root";
  public DBConection () {
    con();
  }


  void connection () {
    try {
      Connection con = null;
      con = con();
      PreparedStatement ps;
      ResultSet res;

      ps = (PreparedStatement)con.prepareStatement("SELECT * FROM german.carros WHERE idCarros = 1");
      res = ps.executeQuery();
      if (res.next()) {
        println(res.getString("Tipo") + " " + res.getString("Cantidad"));
      }
    }
    catch (Exception e) {
      println(e);
    }
  }
  
  Connection con() {
    Connection con = null;

    try {
      Class.forName("com.mysql.jdbc.Driver");
      con = (Connection) DriverManager.getConnection(URL, USER, "");
    } 
    catch (Exception e) {
      println(e);
    }

    return con;
  }
}
