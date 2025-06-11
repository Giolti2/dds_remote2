#define UP 13
#define OK 27
#define LEFT 33
#define RIGHT 15
#define DOWN 14
#define BACK 22
#define HOME 32
#define SIDEBAR 4

#define HOLDTIME 1500

bool lock = false;
bool press = false;
bool holding = false;

int timer = 0;

void setup() {
  Serial.begin(115200);

  pinMode(UP, INPUT_PULLUP);
  pinMode(OK, INPUT_PULLUP);
  pinMode(LEFT, INPUT_PULLUP);
  pinMode(RIGHT, INPUT_PULLUP);
  pinMode(DOWN, INPUT_PULLUP);
  pinMode(BACK, INPUT_PULLUP);
  pinMode(HOME, INPUT_PULLUP);
  pinMode(SIDEBAR, INPUT_PULLUP);
}

void loop() {

  press = false;

  if(digitalRead(UP) == LOW){
    sendMessage("up");
  }

  if(digitalRead(LEFT) == LOW){
    sendMessage("left");
  }

  if(digitalRead(RIGHT) == LOW){
    sendMessage("right");
  }

  if(digitalRead(DOWN) == LOW){
    sendMessage("down");
  }

  if(digitalRead(BACK) == LOW){
    sendMessage("back");
  }

  if(digitalRead(HOME) == LOW){
    sendMessage("home");
  }

  if(digitalRead(SIDEBAR) == LOW){
    sendMessage("sidebar");
  }

  if(digitalRead(OK) == LOW){
    press = true;

    if(!holding && !lock){
     timer = millis();
     holding = true;
    }
    else if(holding && ((millis() - timer) > HOLDTIME)){
      holding = false;
      Serial.println("hold");
    }
  }
  else if(holding){
    holding = false;
    if((millis() - timer) > HOLDTIME){
      Serial.println("hold");
    }
    else{
      Serial.println("ok");
    }
  }

  lock = press;
  delay(100);
}

void sendMessage(String msg){
  if(!lock){
      Serial.println(msg);
  }
  press = true;
}
