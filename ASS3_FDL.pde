/*
 * Slider Example
 *
 *   This example is of a slider that sends a value in the range of 0 to 1023.  
 *   Click and drag the mouse to move the slider.
 * 
 */

import spacebrew.*;

String b1 ;

String server="188.166.209.56";
String name="fdl";
String description ="Client that sends and receives range messages. Range values go from 0 to 1023.";


Spacebrew sb;

// Keep track of our current place in the range
int local_slider_val = 512;
int remote_slider_val = 512;

void setup() {
  size(375, 667);
  background(0);

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your publishers

  sb.addPublish( "b1", "string", b1 ); 
  //sb.addPublish( "b2", "boolean", true );
  //sb.addPublish( "b3", "boolean", true );

  // declare your subscribers
  //	sb.addSubscribe( "remote_slider", "range" );

  // connect!
  sb.connect(server, name, description );
}

void draw() {
  background(50);
  stroke(0);

  // White box containing slider
  fill(255);
  rect(0, height/2, width, height/2);

  drawButton();
  // Local Slider
}
//////////////
void drawButton() {
  pushMatrix();
  if (mousePressed&&mouseX<(width/2-20)&&mouseX>10&&mouseY<(height*3/4-10)&&mouseY>height/2)
  {
    fill(255, 255, 0);
    stroke(200, 0, 0);
    rect(10, (height/2) + 5, width/2-20, (height/4) - 10);
    b1 = "1";
    sb.send("b1", b1);
 
  } else {
    fill(255, 0, 0);
    stroke(200, 0, 0);
    rect(10, (height/2) + 5, width/2-20, (height/4) - 10);
    b1 = "0";
  }
  popMatrix();

  pushMatrix();
  if (mousePressed&&mouseX<(width-20)&&mouseX>width/2&&mouseY<(height*3/4-10)&&mouseY>height/2)
  {
    fill(255, 255, 0);
    stroke(200, 0, 0);
    rect(width/2, (height/2) + 5, width/2-20, (height/4) - 10);
    b1 = "2";
    sb.send("b1", b1);

  } else {
    fill(255, 0, 0);
    stroke(200, 0, 0);
    rect(width/2, (height/2) + 5, width/2-20, (height/4) - 10);
    b1 = "0";
  }
  popMatrix();

  pushMatrix();
  if (mousePressed&&mouseX<(width/2-20)&&mouseX>10&&mouseY<(height-10)&&mouseY>height*3/4)
  {
    fill(255, 255, 0);
    stroke(200, 0, 0);
    rect(10, (height*3/4), width/2-20, (height/4) - 10);
    b1 = "3";
    sb.send("b1", b1);

  } else {
    fill(255, 0, 0);
    stroke(200, 0, 0);
    rect(10, (height*3/4), width/2-20, (height/4) - 10);
    b1 = "0";
  }
  popMatrix();
}


/////////////////



void onRangeMessage( String name, int value ) {
  println("got range message " + name + " : " + value);
  remote_slider_val = value;
}