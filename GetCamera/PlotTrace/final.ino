#include <SoftwareSerial.h>
#define light A2
#define Ecoh1 13
#define Trig1 12
#define Ecoh2 A1
#define Trig2 A0
#define Ecoh3 17
#define Trig3 16
#define LeftupMotor1 7     //Arduino的3号引脚连接在IN1端口
#define LeftupMotor2 8     //Arduino的4号引脚连接在IN2端口
#define RightupMotor1 5    //Arduino的5号引脚连接在IN3端口
#define RightupMotor2 6    //Arduino的6号引脚连接在IN4端口
#define LeftdownMotor1 2   //Arduino的7号引脚连接在IN1端口
#define LeftdownMotor2 9   //Arduino的8号引脚连接在IN2端口
#define RightdownMotor1 3  //Arduino的3号引脚连接在IN3端口
#define RightdownMotor2 4  //Arduino的4号引脚连接在IN4端口
#define distance 30
#define v 90
#define turn_v 100
SoftwareSerial blue(10, 11);  // RX, TX
float cm1 = 0.0;
float cm2 = 0.0;
float cm3 = 0.0;
void turn_Left() {
  digitalWrite(LeftupMotor1, LOW);
  analogWrite(LeftupMotor2, turn_v);
  analogWrite(RightupMotor1, turn_v);
  digitalWrite(RightupMotor2, LOW);
  digitalWrite(LeftdownMotor1, LOW);
  analogWrite(LeftdownMotor2, turn_v);
  analogWrite(RightdownMotor1, turn_v);
  digitalWrite(RightdownMotor2, LOW);
  digitalWrite(light, HIGH);
  delay(65);
}

void turn_Right() {
  analogWrite(LeftupMotor1, turn_v);
  digitalWrite(LeftupMotor2, LOW);
  digitalWrite(RightupMotor1, LOW);
  analogWrite(RightupMotor2, turn_v);
  analogWrite(LeftdownMotor1, turn_v);
  digitalWrite(LeftdownMotor2, LOW);
  digitalWrite(RightdownMotor1, LOW);
  analogWrite(RightdownMotor2, turn_v);
  digitalWrite(light, HIGH);
  delay(65);
}

void go() {
  analogWrite(LeftupMotor1, v);
  digitalWrite(LeftupMotor2, LOW);
  analogWrite(RightupMotor1, v);
  digitalWrite(RightupMotor2, LOW);
  analogWrite(LeftdownMotor1, v);
  digitalWrite(LeftdownMotor2, LOW);
  analogWrite(RightdownMotor1, v);
  digitalWrite(RightdownMotor2, LOW);
}

void stop() {
  digitalWrite(LeftupMotor1, LOW);
  digitalWrite(LeftupMotor2, LOW);
  digitalWrite(RightupMotor1, LOW);
  digitalWrite(RightupMotor2, LOW);
  digitalWrite(LeftdownMotor1, LOW);
  digitalWrite(LeftdownMotor2, LOW);
  digitalWrite(RightdownMotor1, LOW);
  digitalWrite(RightdownMotor2, LOW);
  digitalWrite(light, HIGH);
}

void back() {
  digitalWrite(LeftupMotor1, LOW);
  analogWrite(LeftupMotor2, v);
  digitalWrite(RightupMotor1, LOW);
  analogWrite(RightupMotor2, v);
  digitalWrite(LeftdownMotor1, LOW);
  analogWrite(LeftdownMotor2, v);
  digitalWrite(RightdownMotor1, LOW);
  analogWrite(RightdownMotor2, v);
}
void setup() {
  // put your setup code here, to run once:

  // 设置引脚模式为输出
  pinMode(LeftupMotor1, OUTPUT);
  pinMode(LeftupMotor2, OUTPUT);
  pinMode(RightupMotor1, OUTPUT);
  pinMode(RightupMotor2, OUTPUT);
  pinMode(LeftdownMotor1, OUTPUT);
  pinMode(LeftdownMotor2, OUTPUT);
  pinMode(RightdownMotor1, OUTPUT);
  pinMode(RightdownMotor2, OUTPUT);
  pinMode(Ecoh1, INPUT);
  pinMode(Trig1, OUTPUT);
  pinMode(Ecoh2, INPUT);
  pinMode(Trig2, OUTPUT);
  pinMode(Ecoh3, INPUT);
  pinMode(Trig3, OUTPUT);

  Serial.begin(9600);  //初始化 Arduino 的硬串口
  blue.begin(9600);    // 初始化软串口与蓝牙模块的通信
}
char val;
void loop() {

  // 触发超声波传感器1
  digitalWrite(light, LOW);
  digitalWrite(Trig1, LOW);  // 给触发脚低电平2微妙
  delayMicroseconds(2);
  digitalWrite(Trig1, HIGH);  // 给触发脚高电平10微妙
  delayMicroseconds(10);
  digitalWrite(Trig1, LOW);  // 给触发脚持续低电平
  cm1 = pulseIn(Ecoh1, HIGH) / 58.0;

  // 触发超声波传感器2
  digitalWrite(Trig2, LOW);  // 给触发脚低电平2微妙
  delayMicroseconds(2);
  digitalWrite(Trig2, HIGH);  // 给触发脚高电平10微妙
  delayMicroseconds(10);
  digitalWrite(Trig2, LOW);  // 给触发脚持续低电平
  cm2 = pulseIn(Ecoh2, HIGH) / 58.0;

  // 触发超声波传感器3
  digitalWrite(Trig3, LOW);  // 给触发脚低电平2微妙
  delayMicroseconds(2);
  digitalWrite(Trig3, HIGH);  // 给触发脚高电平10微妙
  delayMicroseconds(10);
  digitalWrite(Trig3, LOW);  // 给触发脚持续低电平
  cm3 = pulseIn(Ecoh3, HIGH) / 58.0;


  String distanceData = String(cm1) + "," + String(cm2) + "," + String(cm3);
  blue.println(distanceData);

  delay(200);
  // 共八种情形
  //情况一：只允许右转情形
  if (cm1 <= distance && cm2 <= distance && cm3 > distance) {
    turn_Right();
  }
  // 直走路线
  else if (cm1 > distance && cm2 <= distance && cm3 <= distance) {
    go();
  }
  // 只允许左转情形
  else if (cm1 <= distance && cm2 > distance && cm3 <= distance) {
    turn_Left();
  }
  // 进入迷宫终点，进行左转
  else if (cm1 <= distance && cm2 <= distance && cm3 <= distance) {
    stop();
    turn_Left();
  }
  // 左T型路口，直走
  else if (cm1 > distance && cm2 > distance && cm3 <= distance) {
    go();
  }
  // 右T型路口，直走
  else if (cm1 > distance && cm2 <= distance && cm3 > distance) {
    go();
  }
  // T型路口，右转
  else if (cm1 <= distance && cm2 > distance && cm3 > distance) {
    turn_Right();
  } else {
    go();
  }
}
