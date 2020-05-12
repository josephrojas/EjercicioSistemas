import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import javax.swing.JOptionPane; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GermanMotos extends PApplet {


int r, g, b;
int menu;
int colores[][] = new int[10][3];
String [][] historicoPrueba;
String [][] pedidosPrueba;
String [][] prueba2020;
Table table, demanda, final2020;
public void setup ()
{
  table = loadTable("historico.csv", "header");
  demanda = loadTable("Ventas.csv", "header");
  final2020 = new Table();
  historicoPrueba = new String[table.getRowCount()][table.getColumnCount()];
  pedidosPrueba = new String[demanda.getRowCount()][demanda.getColumnCount()];
  prueba2020 = new String[table.getRowCount()][demanda.getColumnCount()];
  datos();
  menu();
  for (int x = 0; x < colores.length; x++) {
    colores[x][0] = (int)(random(150, 255));
    colores[x][1] = (int)(random(100, 200)); 
    colores[x][2] = (int)(random(100, 200));
  }
  
}

public void draw()
{
  background(255);
  grafica();
  guia();
  puntos();
}

public void grafica() {
  strokeWeight(4);
  line(100, (height - 100) + 20, 100, 100);
  line(95, 120, 100, 100);
  line(105, 120, 100, 100);

  line(100, (height - 100) + 20, 1200 + 100, (height - 100) + 20);
  line(1180 + 100, (height - 95) + 20, 1200 + 100, (height - 100) + 20);
  line(1180 + 100, (height - 105) + 20, 1200 + 100, (height - 100) + 20);
  fill(0);
  text("Enero",100,(height - 100) + 40);
  text("Febrero",200,(height - 100) + 40);
  text("Marzo",300,(height - 100) + 40);
  text("Abril",400,(height - 100) + 40);
  text("Mayo",500,(height - 100) + 40);
  text("Junio",600,(height - 100) + 40);
  text("Julio",700,(height - 100) + 40);
  text("Agosto",800,(height - 100) + 40);
  text("Septiembre",900,(height - 100) + 40);
  text("Octubre",1000,(height - 100) + 40);
  text("Noviembre",1100,(height - 100) + 40);
  text("Diciembre",1200,(height - 100) + 40);
}

public void puntos() {
  int y = 200;

  switch(menu) {
  case 1:
    for (int n=0; n<10; n++) {
      fill(0);
      textSize(10);
      text(historicoPrueba[n][0],10,y +(2*Float.parseFloat(historicoPrueba[n][1])));
      for (int i = 1; i < historicoPrueba[n].length; i++) {
        strokeWeight(0);
        fill(colores[n][0], colores[n][1], colores[n][2], 255);
        circle((100*i), y +(2*Float.parseFloat(historicoPrueba[n][i])), 10);
        if ((i+1) < 13) {
          strokeWeight(2);
          fill(0);
          line((100*i), y +(2*Float.parseFloat(historicoPrueba[n][i])), 100*(i+1), y +(2*Float.parseFloat(historicoPrueba[n][i + 1])));
        }
      }
      y += 50;
    }
    break;
  case 2:
     y = 100;
    for (int n=0; n<10; n++) {
      fill(0);
      textSize(10);
      text(historicoPrueba[n][0],10,y +(2*Float.parseFloat(pedidosPrueba[n][1])));
      for (int i = 1; i < pedidosPrueba[n].length; i++) {
        strokeWeight(0);
        fill(colores[n][0], colores[n][1], colores[n][2], 255);
        circle((100*i), y +(2*Float.parseFloat(pedidosPrueba[n][i])), 10);
        if ((i+1) < 13) {
          strokeWeight(2);
          fill(0);
          line((100*i), y +(2*Float.parseFloat(pedidosPrueba[n][i])), 100*(i+1), y +(2*Float.parseFloat(pedidosPrueba[n][i + 1])));
        }
      }
      y += 50;
    }
    break;
  case 3:
    y = 100;
    for (int n=0; n<10; n++) {
      fill(0);
      textSize(10);
      text(prueba2020[n][0],10,y +(2*Float.parseFloat(prueba2020[n][1])));
      for (int i = 1; i < prueba2020[n].length; i++) {
        strokeWeight(0);
        fill(colores[n][0], colores[n][1], colores[n][2], 255);
        circle((100*i), y +(2*Float.parseFloat(prueba2020[n][i])), 10);
        if ((i+1) < 13) {
          strokeWeight(2);
          fill(0);
          line((100*i), y +(2*Float.parseFloat(prueba2020[n][i])), 100*(i+1), y +(2*Float.parseFloat(prueba2020[n][i + 1])));
        }
      }
      y += 50;
    }
    break;
  }

}

public void datos() {
  int i = 0;
  //////////////////////////////////////////////////proyeccion/////////////////////////////////////////////////////////
  for (TableRow tab : table.rows()) {
    historicoPrueba[i][0] = tab.getString("ID");
    historicoPrueba[i][1] = tab.getString("Enero");
    historicoPrueba[i][2] = tab.getString("Febrero");
    historicoPrueba[i][3] = tab.getString("Marzo");
    historicoPrueba[i][4] = tab.getString("Abril");
    historicoPrueba[i][5] = tab.getString("Mayo");
    historicoPrueba[i][6] = tab.getString("Junio");
    historicoPrueba[i][7] = tab.getString("Julio");
    historicoPrueba[i][8] = tab.getString("Agosto");
    historicoPrueba[i][9] = tab.getString("Septiembre");
    historicoPrueba[i][10] = tab.getString("Octubre");
    historicoPrueba[i][11] = tab.getString("Noviembre");
    historicoPrueba[i][12] = tab.getString("Diciembre");
    i++;
  }
  i = 0;
  ///////////////////////////////////////////////HISTORICO//////////////////////////////////////////////////////////////
  for (TableRow tab2 : demanda.rows()) {
    pedidosPrueba[i][0] = tab2.getString("ID");
    pedidosPrueba[i][1] = tab2.getString("Enero");
    pedidosPrueba[i][2] = tab2.getString("Febrero");
    pedidosPrueba[i][3] = tab2.getString("Marzo");
    pedidosPrueba[i][4] = tab2.getString("Abril");
    pedidosPrueba[i][5] = tab2.getString("Mayo");
    pedidosPrueba[i][6] = tab2.getString("Junio");
    pedidosPrueba[i][7] = tab2.getString("Julio");
    pedidosPrueba[i][8] = tab2.getString("Agosto");
    pedidosPrueba[i][9] = tab2.getString("Septiembre");
    pedidosPrueba[i][10] = tab2.getString("Octubre");
    pedidosPrueba[i][11] = tab2.getString("Noviembre");
    pedidosPrueba[i][12] = tab2.getString("Diciembre");
    i++;
  }
  ////////////////////////////////////////demanda current ///////////////////////////////////////////////////////////////////
  for (int x = 0; x < prueba2020.length;x++) {
    prueba2020[x][0] = pedidosPrueba[x][0];
    for (int y = 1; y < prueba2020[x].length;y++) {
        prueba2020[x][y] = ""+(Float.parseFloat(pedidosPrueba[x][y]) + Float.parseFloat(historicoPrueba[x][y]));
    }
  }
}

public void guia(){
  strokeWeight(0);
  for (int i = 0; i < width; i++) {
    line(i * 50, 0, i * 50, height);
  }
  for (int i = 0; i < height; i++) {
    line(0, i * 50, width, i*50);
  }
  fill(255,0,0);
  rect(1000, 0, width, 100);
  textSize(40);
  fill(0);
  text("MENU",1100,50);
}


public void menu() {
  menu = Integer.parseInt(JOptionPane.showInputDialog("Bienvenido al graficador de demanda: \n" + 
    "1. Graficar demanda presupuestada 2019\n"+
    "2. Graficar historico ventas 2019\n"+
    "3. Graficar demanda 2020\n" + 
    "4. Generar tabla\n" + 
    "0. Salir"));
    switch(menu) {
      case 4:
        guardarTabla();
        JOptionPane.showMessageDialog(null,"Su tabla se ha guardado en la carpeta data :)");
        exit();
      break;
      case 0:
        exit();
      break;
    }
}

public void guardarTabla () {
  final2020.addColumn("ID");
  final2020.addColumn("Enero");
  final2020.addColumn("Febrero");
  final2020.addColumn("Marzo");
  final2020.addColumn("Abril");
  final2020.addColumn("Mayo");
  final2020.addColumn("Junio");
  final2020.addColumn("Julio");
  final2020.addColumn("Agosto");
  final2020.addColumn("Septiembre");
  final2020.addColumn("Octubre");
  final2020.addColumn("Noviembre");
  final2020.addColumn("Diciembre");
  for (int i = 0; i <prueba2020.length;i++) {
    TableRow newRow = final2020.addRow();
    newRow.setString("ID",prueba2020[i][0]);
    newRow.setString("Enero",prueba2020[i][1]);
    newRow.setString("Febrero",prueba2020[i][2]);
    newRow.setString("Marzo",prueba2020[i][3]);
    newRow.setString("Abril",prueba2020[i][4]);
    newRow.setString("Mayo",prueba2020[i][5]);
    newRow.setString("Junio",prueba2020[i][6]);
    newRow.setString("Julio",prueba2020[i][7]);
    newRow.setString("Agosto",prueba2020[i][8]);
    newRow.setString("Septiembre",prueba2020[i][9]);
    newRow.setString("Octubre",prueba2020[i][10]);
    newRow.setString("Noviembre",prueba2020[i][11]);
    newRow.setString("Diciembre",prueba2020[i][12]);
  }
  saveTable(final2020,"data/Demanda2020.csv");
}
public void keyPressed() {
  if (mouseX >= 1000 && mouseX <= width && mouseY >= 0 && mouseY < 100) {
    setup();
  }
}

  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "GermanMotos" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
