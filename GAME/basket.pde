class basket{
  int basketX;
  public int basketY = 470;
  public int basketW = 50;
  public int basketH = 50;

basket() {

 }
 
 void showBasket() {
   basketX = mouseX;
   
   ellipse(basketX,500,basketW,basketH);
   image(character, basketX - 45, basketY, 80, 60);
 }

}
