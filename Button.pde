class Button {

  private boolean btn_disabled;
  int x, y; 
  String txt;

  Button(int x, int y, String txt) {
    this.x=x;
    this.y=y;
    this.txt=txt;
  }

  void init(){
     button(x, y,txt);
  }
  boolean button(int x, int y, String txt) {
    noStroke();
    int l=txt.length()*10;
    l=l>100?l:100;
    if (btn_disabled) {
      fill(#bf5830);
    } else if (mouseOver(x, y, l, 40)) {
      fill(#d93b3d);
      if (mousePressed) {
        delay(100);
        return true;
      }
    } else {
      fill(#dd3727);
    }
    rect(x, y, l, 40, 100); 
    fill(255);
    textFont(font);
    textAlign(CENTER, CENTER);
    text(txt, x, y, l, 40);
    return false;
  }
  
  boolean state(){
    return button(x,y,txt);
  }
    
  void disable() {
    btn_disabled=true;
  }

  void enable() {
    btn_disabled=false;
  }
}
