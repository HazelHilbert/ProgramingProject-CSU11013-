PFont stdFont;
Widget redWidget, greenWidget, blueWidget, widget1, widget2, fowardWidget, backwardWidget;
Widget checkbox, radiobutton1, radiobutton2, radiobutton3, slider;
ArrayList widgetList0, widgetList1, widgetList2, widgetList3, widgetList4;
Screen currentScreen, screen0, screen1, screen2, screen3, screen4;
color squareColor = (50);
int counter = 1;

void setup(){
  stdFont=loadFont("Chalkboard-30.vlw");
  textFont(stdFont);
  size(400, 400);

  redWidget=new Widget(50, 50, 150, 40, "red", RED, stdFont, EVENT_RED_BUTTON);
  greenWidget=new Widget(50, 150, 150, 40, "green", GREEN, stdFont, EVENT_GREEN_BUTTON);
  blueWidget=new Widget(50, 250, 150, 40, "blue", BLUE, stdFont, EVENT_BLUE_BUTTON);
  widgetList0 = new ArrayList();
  widgetList0.add(redWidget); widgetList0.add(greenWidget); widgetList0.add(blueWidget);

  widget1=new Widget(100, 100, 180, 40, "Button 1", RED, stdFont, EVENT_BUTTON1);
  fowardWidget=new Widget(100, 200, 180, 40, "Foward", GREEN, stdFont, EVENT_FOWARD_BUTTON);
  widgetList1 = new ArrayList();
  widgetList1.add(widget1); widgetList1.add(fowardWidget);
  
  widget2=new Widget(100, 100, 180, 40, "Button 2", DARK_BLUE, stdFont, EVENT_BUTTON2);
  backwardWidget=new Widget(100, 200, 180, 40, "Backward", BLUE, stdFont, EVENT_BACKWARD_BUTTON);
  widgetList2 = new ArrayList();
  widgetList2.add(widget2); widgetList2.add(backwardWidget);
  
  checkbox=new Widget(50, 50, 20, 20, "", (255), stdFont, EVENT_CHECKBOX);
  radiobutton1=new Widget(200, 50, 20, 20, "", (255), stdFont, EVENT_RADIOBUTTON1);
  radiobutton2=new Widget(200, 85, 20, 20, "", (255), stdFont, EVENT_RADIOBUTTON2);
  radiobutton3=new Widget(200, 120, 20, 20, "", (255), stdFont, EVENT_RADIOBUTTON3);
  widgetList3 = new ArrayList();
  widgetList3.add(checkbox); 
  widgetList3.add(radiobutton1); widgetList3.add(radiobutton2); widgetList3.add(radiobutton3);
  
  slider=new Widget(30, 30, 25, 15, "", (0), stdFont, EVENT_SLIDER);
  widgetList4 = new ArrayList();
  widgetList4.add(slider); 
  
  
  screen0 = new Screen((200), widgetList0);
  screen1 = new Screen((200), widgetList1);
  screen2 = new Screen((125), widgetList2);
  screen3 = new Screen((200), widgetList3);
  screen4 = new Screen((200), widgetList4);

  //change screen here
  currentScreen = screen4;
}

void draw(){    
  currentScreen.draw();
  
  fill(squareColor);
  stroke(0);
  if (currentScreen == screen0) rect(300, 150, 40, 40);
  noFill();
  if (currentScreen == screen4){
    rect(30, 30, 25, 340);
    textSize(40);
    text(counter, 200, 200);
  }
}

void mouseMoved(){
  int event = currentScreen.getEvent(mouseX,mouseY);
  switch(event) {
    case EVENT_BUTTON1:
      currentScreen.getWidget(0).borderColor = (255);
      break;
    case EVENT_FOWARD_BUTTON:
      currentScreen.getWidget(1).borderColor = (255);
      break;
    case EVENT_BUTTON2:
      currentScreen.getWidget(0).borderColor = (255);
      break;
    case EVENT_BACKWARD_BUTTON:
      currentScreen.getWidget(1).borderColor = (255);
      break;
    case EVENT_RED_BUTTON:
      currentScreen.getWidget(0).borderColor = (255);
      break;
    case EVENT_GREEN_BUTTON:
      currentScreen.getWidget(1).borderColor = (255);
      break;
    case EVENT_BLUE_BUTTON:
      currentScreen.getWidget(2).borderColor = (255);
      break;
    case EVENT_CHECKBOX:
      break;
    default:
      if (currentScreen == screen3 || currentScreen == screen4) break;
      currentScreen.getWidget(0).borderColor = (0);
      currentScreen.getWidget(1).borderColor = (0);
      if (currentScreen == screen0) currentScreen.getWidget(2).borderColor = (0);
    } 
}

void mousePressed(){
  int event = currentScreen.getEvent(mouseX,mouseY);
  switch(event) {
    case EVENT_BUTTON1:
      println("Button 1 was pressed!");
      break;
    case EVENT_FOWARD_BUTTON:
      currentScreen = screen2; println("foward!");
      break;
    case EVENT_BUTTON2:
      println("Button 2 was pressed!");
      break;
    case EVENT_BACKWARD_BUTTON:
      currentScreen = screen1; println("backward!");
      break;
    case EVENT_RED_BUTTON:
      squareColor = RED; println("red button!");
      break;
    case EVENT_GREEN_BUTTON:
      squareColor = GREEN; println("green button!");
      break;
    case EVENT_BLUE_BUTTON:
      squareColor = BLUE; println("blue button!");
      break;
    case EVENT_CHECKBOX:
      if (checkbox.widgetColor == (255)) checkbox.widgetColor = (75);
      else checkbox.widgetColor = (255);
      break;
    case EVENT_RADIOBUTTON1:
      if (radiobutton1.widgetColor == (255)) {
        radiobutton1.widgetColor = (75);
        radiobutton2.widgetColor = (255); radiobutton3.widgetColor = (255);
      }
      else radiobutton1.widgetColor = (255);
      break;
    case EVENT_RADIOBUTTON2:
      if (radiobutton2.widgetColor == (255)) {
        radiobutton2.widgetColor = (75);
        radiobutton1.widgetColor = (255); radiobutton3.widgetColor = (255);
      }
      else radiobutton2.widgetColor = (255);
      break;
    case EVENT_RADIOBUTTON3:
      if (radiobutton3.widgetColor == (255)) {
        radiobutton3.widgetColor = (75);
        radiobutton1.widgetColor = (255); radiobutton2.widgetColor = (255);
      }
      else radiobutton3.widgetColor = (255);
      break;
    case EVENT_SLIDER:
      break;
  }  
}

void mouseDragged(){
  if (slider.y >= 30 && slider.y <= 355 && mouseY >= 30 && mouseY <= 355){
    slider.y = mouseY;
    counter = (slider.y-30)/3;
  }
}
