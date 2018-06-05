//declared my class named planet.
//In the class, I declared 7 floats, 3 voids.
class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  //Planet[] planets;
  PVector v;

  PShape globe;

  //declared 3 new variables: r, d and o.
  //also updated previously declared variables.
  Planet(float r, float d, float o, PImage img) {
    
    v = PVector.random3D();

    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = o;

    noStroke();
    noFill();
    fill(255);
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  //made a function named orbit.
  //orbit updates angle and declares an if and for statement.
  //it also shows the planets in orbit.
  void orbit() {
    angle = angle + orbitSpeed;

    }
  

  //made a function named spawnMoons.
  //spawnMoons updates the array list planets.
  //declares 3 new floats: r, d, and o.
  //another if statement and an int named num.
  //this should spawn moons if level is less than 2.
  
  //made a function called show.
  //show declares pushMatrix and noStroke.
  //it also fills in the spheres
  //as well as rotates them and translates them by distance and 0..
  //also declares sphere and an if and for statement.
  //this should show all the spheres in the solar system.
  void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    fill(255);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    //line(0, 0, 0, v.x, v.y, v.z);
    //line(0, 0, 0, p.x, p.y, p.z);

    translate(v.x, v.y, v.z);
    noStroke();
    fill(255, 0, 0);
    shape(globe);
    //sphere(radius);
    //ellipse(0, 0, radius*2, radius*2);
    /*
    if (planets != null) {
      //println(planets.length);
      printArray(planets);
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }*/
    popMatrix();
  }
  
  void sunShow() {
    
    stroke(255);
    
    noStroke();
    fill(255, 0, 0);
    shape(globe);
  }
  
  
  
}
