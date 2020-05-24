class Menu {
  int x = width/2;
  int y = height/2;
  public Menu () {
  }

  public void drawing () {
    background(#FA9292);
    ///////////////////DEMANDA/////////////////////////////////
    rect(x - 75, (y - 50), 150, 50);
    textSize(20);
    fill(0);
    text("Demanda", x - 50, y - 20);
    fill(255);
    ///////////////////PREDICCIÓN////////////////////////////////
    rect(x - 75, (y + 10), 150, 50);
    fill(0);
    text("Predicción", x - 50,(y + 40));
    fill(255);
    //////////////////RECETAS//////////////////////////////
    rect(x - 75, (y + 70), 150, 50);
    fill(0);
    text("Recetas", x - 50,(y + 100));
    fill(255);
    //////////////////MRP1//////////////////////////////
    rect(x - 75, (y + 130), 150, 50);
    fill(0);
    text("MRP1", x - 50, (y - 50 + 210));
    fill(255);
  }
}
