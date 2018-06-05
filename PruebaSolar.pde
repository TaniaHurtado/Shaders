// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/FGAwi7wpU8c

import peasy.*;
Planet sun;
Planet earth;
Planet mars;
Planet venus;
Planet mercury;

PeasyCam cam;

PShader colorShader;
PShader lightShader;
PShader texShader;
PShader texlightShader;
PShader pixlightShader;
PShader texlightxShader;
PShader selShader;

PShape sunShape;
PImage sunTexture;
PImage earthTexture;
PImage marsTexture;
PImage mercuryTexture;
Planet[] planets = new Planet[3];
PImage[] textures = new PImage[3];

void setup() {
  size(600, 600, P3D);
  sunTexture = loadImage("sun.jpg");
  marsTexture = loadImage("mars.jpg");
  earthTexture = loadImage("earth.jpg");
  mercuryTexture = loadImage("mercury.jpg");
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  mercury = new Planet(18, 80, 0.07, mercuryTexture);
  venus = new Planet(20, 100, 0.05, mercuryTexture);
  earth = new Planet(30, 120, 0.03, earthTexture);
  mars = new Planet(25,140, 0.01, marsTexture);
 
  //sun.spawnMoons(4, 1);
  
  lightShader = loadShader("lightfrag.glsl", "lightvert.glsl");  
  texShader = loadShader("texfrag.glsl", "texvert.glsl");  
  texlightShader = loadShader("texlightfrag.glsl", "texlightvert.glsl");
  //texlightShader.set("dir", -0.2f, -1.0f, -0.3f); 
  //specular light
  pixlightShader = loadShader("pixlightfrag.glsl", "pixlightvert.glsl");
  texlightxShader = loadShader("pixlightxfrag.glsl", "pixlightxvert.glsl");
  
  selShader = texShader;
}

void draw() {
  background(0);
  //ambientLight(255,255,255);
  shader(selShader);
  //createShape(SPHERE);
  //spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  //pointLight(200, 200, 200, 20, 20, 20);
  normal(1,1,-1);
  directionalLight(204, 204, 204, width/2, height/2, 50);
  //directionalLight(204, 204, 204, -dirX, -dirY, -1);
  
  sun.sunShow();
  earth.show();
  earth.orbit();
  mars.show();
  mars.orbit();
  venus.show();
  venus.orbit();
  mercury.show();
  mercury.orbit();
}

void spawnMoons(int total, int level, float radius) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius + r), (radius+r)*2);
      float o = random(-0.1, 0.1);
      int index = int(random(0, textures.length));
      planets[i] = new Planet(r, d, o, textures[index]);
      if (level < 2) {
        int num = int(random(0, 4));
          spawnMoons(num, level+1,radius);
      }
    }
  }


void keyPressed() {
  if (key == '1') {
    println("Vertex lights, no texture shading");
    selShader = lightShader;    
  } else if (key == '2') {
    println("No lights, texture shading");
    selShader = texShader;
         
  } else if (key == '3') {
    println("Vertex lights, texture shading");
    selShader = texlightShader;
        
  } else if (key == '4') {
    println("Pixel lights, no texture shading");
    selShader = pixlightShader;
     
  } else if (key == '5') {
    println("Pixel lights, texture shading");
    selShader = texlightxShader;
          
  }  
}
