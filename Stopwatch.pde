PFont font;

Button b1=new Button(50, 320, "START");
Button b2=new Button(170, 320, "PAUSE");
Button b3=new Button(290, 320, "PLAY");
Button b4=new Button(410, 320, "STOP");
float START_TIME=0.0, END_TIME=0.0;
boolean btn_start, btn_stop, btn_pause, btn_play;

void setup() {
  size(550, 400);
  background(48);
  font =createFont("Segoe Script", 15);
  
  //Initialising the buttons
  b1.init();
  b2.init();
  b3.init();
  b4.init();
  
  //Disabling stop,play,pause Buttons
  b2.disable();
  b3.disable();
  b4.disable();
  
}


void draw() {
  background(48);
  showinfo();
  float t=timer();
  show_timer(t);
  btn_start= b1.state();
  btn_pause= b2.state();
  btn_play = b3.state();
  btn_stop = b4.state();
}

boolean mouseOver(int x, int y, int w, int h) {
  return ((mouseX>=x&&mouseX<=x+w)&&(mouseY>=y&&mouseY<=y+h));
}

void showinfo() {
  fill(#2c6ff2);
  rect(0, 0, width, 100);
  fill(255);
  textFont(font, 42);
  textAlign(CENTER, CENTER);
  text("Stopwatch", width/2, 50);
  textSize(10);
  text("Error of ±0.5 second include error due to reaction time and 100ms delay per click of button.",width/2,height-30);
  textSize(13);
  text("© ASAP Labs",width-65,height-15);
}

void show_timer(float time) {
  fill(#36872a);
  rect(20, 130, width-40, 40, 54);
  fill(255);
  textFont(font);
  textAlign(CENTER, CENTER);
  String dur=duration(time);
  text("Time elapsed : "+dur, width/2, 150);
}

String duration(float time){
  int min=(int)time/60;
  int hour=min/60;
  int days=hour/24;
  float sec=time;
  String dur="";
  if(days>0){
    dur+=days+" Day, ";
    hour%=24;
  }
  if(hour>0){
    dur+=hour+" Hour, ";
    min%=60;
  }
  if(min>0){
    dur+=min+" Minutes, ";
    sec%=60;
  }
  dur+=round(sec*10)/10.0+" ± 0.5 Seconds";
  return dur;
}
boolean start;

float timer() {
  if (btn_start) {
    START_TIME=millis();
    start=true;
    b2.enable();
    b3.disable();
    b4.enable();
  } else if (btn_stop) {
    END_TIME=millis();
    start=false;
    b2.disable();
    b3.disable();
    b4.disable();
  } else if (btn_pause) {
    END_TIME=millis();
    start=false;
    b3.enable();
    b2.disable();
    b4.disable();
  } else if (btn_play) {
    START_TIME+=millis()-END_TIME;
    start=true;
    b2.enable();
    b3.disable();
    b4.enable();
  }

  if (start) {
    return (millis()-START_TIME)/1000.0;
  } else {
    return (END_TIME-START_TIME)/1000.0;
  }
}
