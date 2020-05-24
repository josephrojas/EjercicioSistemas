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
  ///////////////////////////////////////////////////////////OPCION 1//////////////////////////////////////////////////
  if (mouseX >= menu.x - 50 && mouseX <= (menu.x + 50) && mouseY >= menu.y - 50 && mouseY <= menu.y && changing == 1) {
    changing = 2;
  }
  //////////////////////////////////////////////////////////OPCION 2///////////////////////////////////////////////////
  if (mouseX >= menu.x - 50 && mouseX <= (menu.x + 50) && mouseY >= menu.y + 10 && mouseY <= menu.y + 60 && changing == 1) {
    changing = 3;
  }
  /////////////////////////////////////////////////////////OPCION 3////////////////////////////////////////////////////
  if (mouseX >= menu.x - 50 && mouseX <= (menu.x + 50) && mouseY >= menu.y + 70 && mouseY <= menu.y + 120 && changing == 1) {
    changing = 4;
  }
  /////////////////////////////////////////////////////////OPCION 4///////////////////////////////////////////////////
  if (mouseX >= menu.x - 50 && mouseX <= (menu.x + 50) && mouseY >= menu.y + 130 && mouseY <= menu.y + 180 && changing == 1) {
    changing = 5;
  }
}
