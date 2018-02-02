/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
123
 */
 
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
NetAddress AbletonliveLocation;
int ValueNote = 0;
int ValueVelocity = 0;
int[] LaunchPadMatrix = new int[64]; 
int MatrixHeight = 8;                
int MatrixWidth = 8;
int SlotSize = 100;
int SlotGapX = 145;
int SlotGapY = 40;
String Str1 = "/Velo";
String Str2 = "/Note";  
int tempVelocity = 0;
int tempNote = 0;
int Left = 50;
int Top = 50;
String DeviceType = "";
PShape HeartShap;  // The PShape object
PImage img,HeartImage; 

void setup() {
  //size(800,800,P3D);
  //size(950,950);
  background(30);
  surface.setResizable(true);
  
  fullScreen(1);

  
  frameRate(50);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
  AbletonliveLocation = new NetAddress("127.0.0.1",8000);
  
  noStroke(); // no border line
  //for(int i = 0;i < 64; i++)
    //LaunchPadMatrix[i] = 200;  
  /*
  translate(-200, -20);
  scale(8.0); 
  fill(255, 0, 0);
  HeartShap = createShape();
  HeartShap.beginShape();
  HeartShap.vertex(50, 15);
  HeartShap.bezierVertex(50, -5, 75, 5, 50, 45);
  HeartShap.vertex(50, 15);
  HeartShap.bezierVertex(50, -5, 25, 5, 50, 45);
  HeartShap.endShape(CLOSE);
  */
  
  //HeartShap.setFill(color(0,255,0));
  
  HeartShap = createShape();
  HeartShap.beginShape();
  HeartShap.noStroke();
  HeartShap.fill(255,0,0);
  HeartShap.vertex(50, 15); 
  HeartShap.bezierVertex(50, -5, 90, 5, 50, 40); 
  HeartShap.vertex(50, 15); 
  HeartShap.bezierVertex(50, -5, 10, 5, 50, 40); 
  HeartShap.endShape(); 
  
  //HeartImage = loadImage("2000px-Love_Heart.png");
  //img = loadImage("test.PNG");
  
  //size(displayWidth, displayHeight)
}

void draw() {

  background(50);


  int Init_rectX = 0;
  for(int BeginValue = 0;BeginValue < 64; BeginValue+=32)
  {
    int rectX = Init_rectX;
    int rectY = MatrixHeight*SlotSize+(SlotGapY*MatrixHeight);
    for(int i = BeginValue;i < 32+BeginValue; i++)
    {
      if(i % 4 == 0)
      {
        rectX = Init_rectX;
        rectY = rectY - SlotSize - SlotGapY; 
      }
      else
      {
        rectX = rectX + SlotSize + SlotGapX;
      }
        
        SetLaunchPadMiniColor(LaunchPadMatrix[i]);
        ellipse(rectX+Left, rectY+Top, SlotSize, SlotSize);
        //rect(rectX+Left,rectY+Top,SlotSize,SlotSize,20);
        //println("i"+i+"x:"+rectX+"y:"+rectY);
        
        //if(LaunchPadMatrix[i]!=0)
       //   shape(HeartShap,rectX+Left,rectY+Top,SlotSize,SlotSize);
          //image(HeartImage,rectX+Left,rectY+Top,SlotSize,SlotSize);
          
    } 
    Init_rectX = (SlotSize*MatrixWidth/2)+(SlotGapX*(MatrixWidth/2));
  }

  //image(img, 0, 0);
 // shape(HeartShap, 100,100);
  
  //heart shape
  /*
  //smooth();
  noStroke();
  fill(255,0,0);
  beginShape();
  vertex(50, 15); 
  bezierVertex(50, -5, 90, 5, 50, 40); 
  vertex(50, 15); 
  bezierVertex(50, -5, 10, 5, 50, 40); 
  endShape();
  */
  
 //shape(HeartShap,300,300,100,100);
}

void SetLaunchPadMiniColor(int Vocility)
{
  int ColorValue = Vocility;
  int ColorR = 0;
  int ColorG = 0;
  int ColorB = 0;
 
  if(ColorValue >= 64) ColorValue = ColorValue - 64;
  /*
  if(Vocility > 0)
    fill(255,255,0);
  else
    fill(100);
  */

   
  if(ColorValue >= 0 && ColorValue<= 15)
  {
    int type = ColorValue % 4; 
    switch(type) 
    {
      case 0:
      {
        ColorR = 50;
        ColorG = 50;
        ColorB = 50;
        break;  
      }
      case 1:
      {
        ColorR = 153;
        ColorG = 0;
        ColorB = 0;
        break;  
      }
      case 2:
      {
        ColorR = 255;
        ColorG = 51;
        ColorB = 51;
        break;  
      }
      default:
      {
        ColorR = 255;
        ColorG = 204;
        ColorB = 204;
        break;  
      }
    }
  }
  else if(ColorValue >= 16 && ColorValue<= 31)
  {
    int type = ColorValue % 4; 
    switch(type) 
    {
      case 0:
      {
        ColorR = 0;
        ColorG = 153;
        ColorB = 0;
        break;  
      }
      case 1:
      {
        ColorR = 255;
        ColorG = 255;
        ColorB = 204;
        break;  
      }
      case 2:
      {
        ColorR = 255;
        ColorG = 128;
        ColorB = 0;
        break;  
      }
      default:
      {
        ColorR = 255;
        ColorG = 178;
        ColorB = 102;
        break;  
      }
    }
  }
  else if(ColorValue >= 32 && ColorValue<= 47)
  {
    int type = ColorValue % 4; 
    switch(type) 
    {
      case 0:
      {
        ColorR = 102;
        ColorG = 204;
        ColorB = 0;
        break;  
      }
      case 1:
      {
        ColorR = 255;
        ColorG = 255;
        ColorB = 51;
        break;  
      }
      case 2:
      {
        ColorR = 255;
        ColorG = 204;
        ColorB = 153;
        break;  
      }
      default:
      {
        ColorR = 255;
        ColorG = 204;
        ColorB = 153;
        break;  
      }
    }
  }
  else if(ColorValue >= 48 && ColorValue<= 63)
  {
    int type = ColorValue % 4; 
    switch(type) 
    {
      case 0:
      {
        ColorR = 102;
        ColorG = 255;
        ColorB = 102;
        break;  
      }
      case 1:
      {
        ColorR = 178;
        ColorG = 255;
        ColorB = 102;
        break;  
      }
      case 2:
      {
        ColorR = 255;
        ColorG = 255;
        ColorB = 0;
        break;  
      }
      default:
      {
        ColorR = 204;
        ColorG = 204;
        ColorB = 0;
        break;  
      }
    }
  }

  fill(ColorR,ColorG,ColorB);
  
 // HeartShap.setFill(color(ColorR,ColorG,ColorB));
}

void oscEvent(OscMessage theOscMessage) {
  
  String temp_Addr = theOscMessage.addrPattern().substring(0,5);

  if(temp_Addr.equals("/Velo"))
  {
    tempVelocity = theOscMessage.get(0).intValue();     
  }

  if(temp_Addr.equals("/Note"))
  {
    tempNote = theOscMessage.get(0).intValue();      
    AddToMatrix(tempNote,tempVelocity);  
  } 

  //println("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(temp_Addr.substring(0,5));
  //if(theOscMessage.checkAddrPattern("/Note1")==true) 
}

boolean AddToMatrix(int Note,int Volicity)
{
  //println("Note"+Note+",Volicity"+Volicity);
  
  int Index = Note - 36;
  
 // if(Volicity > 0)  //test
 //   Volicity = 255;
  
  if(Index < 64)
    LaunchPadMatrix[Index] = Volicity;
    
  return true;
}  






void drawtest()
{
  fill(255);
  rect(0, 0, 50, 50);  // White rectangle
  
  //pushMatrix();
  translate(30, 20);
  fill(0);  
  rect(0, 0, 50, 50);  // Black rectangle
  //popMatrix();
  
  //fill(100);  
  //rect(15, 10, 50, 50);  // Gray rectangle
  
  println(" drawtest()"); 
}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/test");
  
  int ValueRan = int(random(100));
  float ValueFloat = (float)ValueRan/100;
  //int ValueRan = 1;
  myMessage.add(ValueFloat); /* add an int to the osc message */
  
  /* send the message */
  //oscP5.send(myMessage, myRemoteLocation); 
  
  oscP5.send(myMessage, AbletonliveLocation); 

  //drawtest();
}