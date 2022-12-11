class Screen{
  color backgroundColor;
  ArrayList widgets;
  
  Screen(color backgroundColor, ArrayList widgets){
    this.backgroundColor = backgroundColor;
    this.widgets = widgets;
  }
  
  int getEvent(int mX, int mY){
    int event = EVENT_NULL;
    for(int i = 0; i<widgets.size(); i++){
       Widget aWidget = (Widget) widgets.get(i);
       event = aWidget.getEvent(mX,mY);
       if (event != EVENT_NULL) return event;
    }
    return EVENT_NULL;
  }
  
  void draw(){
    background(backgroundColor);
    for(int i = 0; i<widgets.size(); i++){
      Widget aWidget = (Widget) widgets.get(i);
      aWidget.draw();
    }
  }
  
  void addWidget(Widget aWidget){
    widgets.add(aWidget);
  }
  
  Widget getWidget(int index){
    return (Widget) widgets.get(index);
  }
}
