import javax.swing.JOptionPane;
int r, g, b;
int menu;
int colores[][] = new int[10][3];
String [][] historicoPrueba;
String [][] pedidosPrueba;
String [][] prueba2020;
Table table, demanda, final2020;
void setup ()
{
  menu();
  table = loadTable("historico.csv", "header");
  demanda = loadTable("Ventas.csv","header");
  historicoPrueba = new String[table.getRowCount()][table.getColumnCount()];
  pedidosPrueba = new String[demanda.getRowCount()][demanda.getColumnCount()];
  switch (menu) {
  case 1:
  
    break;
  case 2: 
    break;
  case 3:
    break;
  case 4:
    break;
  case 0:
    break;
  default:
    break;
  }
  for (int x = 0; x < colores.length; x++) {
    colores[x][0] = (int)(random(150, 255));
    colores[x][1] = (int)(random(100, 200)); 
    colores[x][2] = (int)(random(100, 200));
  }
  fullScreen();
  datos();
}

void draw()
{
  background(255);
  grafica();
  puntos();
  guia();
}

void grafica() {
  strokeWeight(4);
  line(100, (height - 100) + 20, 100, 100);
  line(95, 120, 100, 100);
  line(105, 120, 100, 100);

  line(100, (height - 100) + 20, 1200 + 100, (height - 100) + 20);
  line(1180 + 100, (height - 95) + 20, 1200 + 100, (height - 100) + 20);
  line(1180 + 100, (height - 105) + 20, 1200 + 100, (height - 100) + 20);
}

void puntos() {
  int y = 200;

  for (int n=0; n<10; n++) {

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
}

void datos() {
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
  for () {
  
  }
}

void guia()
{
  for (int i = 0; i < width; i++) {
    line(i * 50, 0, i * 50, height);
  }
  for (int i = 0; i < height; i++) {
    line(0, i * 50, width, i*50);
  }
}


void menu() {
  menu = Integer.parseInt(JOptionPane.showInputDialog("Bienvenido al graficador de demanda: \n" + 
    "1. Graficar demanda presupuestada 2019\n"+
    "2. Graficar historico ventas 2019\n"+
    "3. Graficar demanda 2020\n" + 
    "4. Generar tabla" + 
    "0. Salir"));
}
