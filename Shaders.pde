// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/FGAwi7wpU8c

import peasy.*;
Planet sun;
Planet mercury;
Planet venus;
Planet earth;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptune;

PeasyCam cam;

PShader nebShader;
PShader allLightShader;
PShader speclightShader;
PShader texShader;
PShader diflightShader;
PShader ambientlightShader;
PShader specdiflightShader;
PShader selShader;

PShader hueShader;
PShader edgesShader;
PShader invertShader;
PShader channelsShader;
PShader modcolorShader;

PShape sunShape;
PImage sunTexture;
PImage earthTexture;
PImage marsTexture;
PImage mercuryTexture;
PImage jupiterTexture;
PImage saturnTexture;
PImage uranusTexture;
PImage venusTexture;
PImage space;
Planet[] planets = new Planet[3];
PImage[] textures = new PImage[3];

PGraphics pg;
void setup() {
  size(800, 600, P3D);
  //colorMode(HSB, 360, 100, 100, 100);
  sunTexture = loadImage("sun.jpg");
  marsTexture = loadImage("mars.jpg");
  earthTexture = loadImage("earth.jpg");
  mercuryTexture = loadImage("mercury.jpg");
  jupiterTexture = loadImage("jupiter.jpg");
  uranusTexture = loadImage("urano.jpg");
  saturnTexture = loadImage("saturno.jpg");
  venusTexture = loadImage("venus.jpg");
  space = loadImage("space.jpg");
  textures[0] = loadImage("mars.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("saturno.jpg");
  
  cam = new PeasyCam(this, 600);
  sun = new Planet(80, 0, 0, sunTexture);
  mercury = new Planet(20, 140, 0.08, mercuryTexture);
  venus = new Planet(25, 150, 0.07, venusTexture);
  earth = new Planet(35, 160, 0.05, earthTexture);
  mars = new Planet(25,170, 0.04, marsTexture);
  jupiter = new Planet(50,210, 0.03, jupiterTexture);
  saturn = new Planet(40,220, 0.02, saturnTexture);
  uranus = new Planet(35,230, 0.01, uranusTexture);
  neptune= new Planet(35,240, 0.001, uranusTexture);
  
 
  //sun.spawnMoons(4, 1);
  
  texShader = loadShader("texfrag.glsl", "texvert.glsl");  
  ambientlightShader = loadShader("amlightfrag.glsl", "amlightvert.glsl");
  ambientlightShader.set("lightColor",  1.5f, 1.5f, 1.5f);
  diflightShader = loadShader("diflightfrag.glsl", "diflightvert.glsl");
  speclightShader = loadShader("specularfrag.glsl", "specularvert.glsl"); 
  specdiflightShader = loadShader("specdiflightfrag.glsl","specdiflightvert.glsl");
  allLightShader = loadShader("todofrag.glsl","todovert.glsl");
  allLightShader.set("lightColor",  1.5f, 1.5f, 1.5f);
  edgesShader = loadShader("edges.glsl");
  invertShader = loadShader("invert.glsl");
  channelsShader = loadShader("channels.glsl");
  selShader = texShader;
  
}

void draw() {
  
  background(space);
  //spotLight(0, 0, 100, 0,0,0, 1, 1, 1, 2*PI, 2);
  //spotLight(255, 255, 255, 70, 70, 70, 1, 1, 1, PI, 2);
  shader(selShader);
  
  spotLight(255, 255, 255, 100,100,100, 0, 0, 1, PI, 2);
  //pointLight(255, 255, 255, 100, 100, 100);
  //directionalLight(255, 255, 255, 0,0,0);
  //directionalLight(255, 255, 255, 0,0,0);
  
  sun.sunShow();
  earth.show();
  earth.orbit();
  mars.show();
  mars.orbit();
  venus.show();
  venus.orbit();
  mercury.show();
  mercury.orbit();
  jupiter.show();
  jupiter.orbit();
  saturn.show();
  saturn.orbit();
  uranus.show();
  uranus.orbit();
  neptune.show();
  neptune.orbit();
}



void keyPressed() {
  if (key == '1') {
    println("Texture Shader");
    selShader = texShader;    
  } else if (key == '2') {
    println(" Ambient Light Shader");
    selShader = ambientlightShader ;
         
  } else if (key == '3') {
    println("Diffuse Light Shader");
    selShader =  diflightShader ;
        
  } else if (key == '4') {
    println("Specular Light Shader");
    selShader = speclightShader;
     
  } else if (key == '5') {
    println("Difusa and specular Light");
    selShader = specdiflightShader;
          
  } else if (key == '6') {
    println("Difusa and specular and Ambient Light");
    selShader = allLightShader;
          
  }  else if (key == '7') {
    println("Edges texture Shader");
    selShader = edgesShader;
          
  }  else if (key == '8') {
    println("Invert Texture Shader");
    selShader = invertShader;
          
  }  else if (key == '9') {
    println("Channels Texture Shader");
    selShader = channelsShader;
          
  }   
}
