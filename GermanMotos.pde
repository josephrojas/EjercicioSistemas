 int n=0, cont=0, opcion=0, value=0;
 int promedio[] = new int[10];
 int aumento[] = new int[10];
 int demanda[] = new int[10];
 PImage accidente, clima, convenio, policia, proveedores, tendencia, todo;

void setup ()
{
  size(1300,600);
  imagenes();
  datos();
}

void draw()
{
  background(255);
  
  if(value==0){
  indicadores();
  }else{

  
  grafica();
  puntos();
  texto();
  guia();
  }
}
void indicadores(){
  image (todo,0,0);
}

void mouseClicked() {
  if (value == 0 && mouseX > 1000) {
   value =1;
  } else {
    value = 0;
  }
}

void grafica(){
  strokeWeight(4);
  line(100,500,100,100);
  line(95,120,100,100);
  line(105,120,100,100);
  
  line(100,500,1200,500);
  line(1180,505,1200,500);
  line(1180,495,1200,500);
}

void puntos(){
  
  for(n=0;n<10;n++){
    strokeWeight(0);
    fill(0,0,255);
    circle(200+100*n,500-promedio[n],10);
    fill(255,0,0);
    circle(200+100*n,500-demanda[n],10);
  
    if(n<9){
      strokeWeight(2);
      fill(0);
      line(200+100*n,500-promedio[n],200+100*(n+1),500-promedio[n+1]);
      fill(255,0,0);
      line(200+100*n,500-demanda[n],200+100*(n+1),500-demanda[n+1]);
    }
  }
}

void texto(){
  opcion=opcion();
  strokeWeight(1);
  fill(255);
  rect(780,30,400,110);
  textSize(25);
  
  if(opcion!=10){
  fill(255,0,0);
  text("Demanda real:           "+demanda[opcion], 800, 60);
  fill(0,0,255);
  text("Demanda esperada:   "+promedio[opcion], 800, 120);
  } else{
  fill(255,0,0);
  text("Demanda real:           "+0, 800, 60);
  fill(0,0,255);
  text("Demanda esperada:   "+0, 800, 120);
  }
}









void datos(){
promedio[0]=142;
   promedio[1]=191;
   promedio[2]=20;
   promedio[3]=27;
   promedio[4]=16;
   promedio[5]=15;
   promedio[6]=28;
   promedio[7]=16;
   promedio[8]=110;
   promedio[9]=40;
   
   aumento[0]=99;
   aumento[1]=-38;
   aumento[2]=-20;
   aumento[3]=1;
   aumento[4]=2;
   aumento[5]=23;
   aumento[6]=15;
   aumento[7]=-8;
   aumento[8]=35;
   aumento[9]=6;
   
   demanda[0]=promedio[0]+aumento[0];
   demanda[1]=promedio[1]+aumento[1];
   demanda[2]=promedio[2]+aumento[2];
   demanda[3]=promedio[3]+aumento[3];
   demanda[4]=promedio[4]+aumento[4];
   demanda[5]=promedio[5]+aumento[5];
   demanda[6]=promedio[6]+aumento[6];
   demanda[7]=promedio[7]+aumento[7];
   demanda[8]=promedio[8]+aumento[8];
   demanda[9]=promedio[9]+aumento[9];
}

void imagenes(){
  accidente = loadImage("accidente.jpg");
  clima = loadImage("clima.jpg");
  convenio = loadImage("convenio.png");
  policia = loadImage("policia.jpg");
  proveedores = loadImage("proveedores.jpg");
  tendencia = loadImage("tendencia.jpg");
  todo = loadImage("Todo.png");
}
void guia()
{
  strokeWeight(1);
  line(100,0,100,600);
  line(200,0,200,600);
  line(300,0,300,600);
  line(400,0,400,600);
  line(500,0,500,600);
  line(600,0,600,600);
  line(700,0,700,600);
  line(800,0,800,600);
  line(900,0,900,600);
  line(1000,0,1000,600);
  line(1100,0,1100,600);
  line(1200,0,1200,600);
  
  line(0,100,1300,100);
  line(0,200,1300,200);
  line(0,300,1300,300);
  line(0,400,1300,400);
  line(0,500,1300,500);
}

int opcion(){
  
  if(mouseX>150 && mouseX<250){
    opcion=0;
  }
  if(mouseX>250 && mouseX<350){
    opcion=1;
  }
  if(mouseX>350 && mouseX<450){
    opcion=2;
  }
  if(mouseX>450 && mouseX<550){
    opcion=3;
  }
  if(mouseX>550 && mouseX<650){
    opcion=4;
  }
  if(mouseX>650 && mouseX<750){
    opcion=5;
  }
  if(mouseX>750 && mouseX<850){
    opcion=6;
  }
  if(mouseX>850 && mouseX<950){
    opcion=7;
  }
  if(mouseX>950 && mouseX<1050){
    opcion=8;
  }
  if(mouseX>1050 && mouseX<1150){
    opcion=9;
  }
  if(mouseX>1150 || mouseX<150){
    opcion=10;
  }
    
return opcion;
}
