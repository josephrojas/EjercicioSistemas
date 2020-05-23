import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
DBConection connection;
int changing;
Menu menu;
void setup () {
  changing = 1;
  connection = new DBConection();
  menu = new Menu();
  fullScreen();
}

void draw () {
  switch (changing) {
  case 1:
    menu.drawing();
    break;
  case 2:
    exit();
    break;
  }
}

void mouseClicked () {
  if (mouseX >= menu.x - 50 && mouseX <= (menu.x + 50) && mouseY >= menu.y - 100 && mouseY <= menu.y && changing == 1) {
    JOptionPane.showMessageDialog(null, "Entró");
    changing = 2;
  }
}
