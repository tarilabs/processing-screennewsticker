// Global variables
NewsTick[] news;
float totalW = 0;
PFont f;

void setup() {
  
  // Manage the frame attributes
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.setAlwaysOnTop(true);
  frame.setResizable(true);
  frame.setSize(screen.width,50);  
  frame.setLocation(0,screen.height-50);
  frame.addNotify(); 

  f=createFont("Arial", 50);
  
  // Loads the news into the news array
  println("Loading news...");    
  String lines[] = loadStrings("C:\\news.txt");
  news = new NewsTick[lines.length];
  println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) {
    println(lines[i]);
    news[i] = new NewsTick(lines[i]);
  }

  // Determines the totalW global variable
  // as the total width of all the text
  float x = 0;
  for (int i = 0; i < news.length; i++) {
    news[i].setX(x);
    x = x + (news[i].textW()); 
  }
  totalW = x;
}

void draw() {
  frame.setSize(screen.width,50);  
  frame.setLocation(0,screen.height-50);
  background(0);
  fill(255);

  for (int i = 0; i < news.length; i++) {
    news[i].move();
    news[i].display();
  }
}
