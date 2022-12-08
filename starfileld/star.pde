
// The class for Stars
class Star {

  // Variables for position and previous position
  float x, y, z;
  float px, py, pz;

  // Initialize the star with random position
  Star() {
    randomSetup(true);
  }

  // Randomize the position of the star
  void randomSetup(boolean randomZ) {
    x = random(-width / 2, width / 2);
    y = random(-height, height);

    if (randomZ) {
      z = random(width / 2, width);
    } else {
      z = width;
    }
    pz = z;
  }

  // Display the star
  void update() {

    // Move it closer to the camera
    z = z - speed;

    // Calculate the position of the previous position in 3D space
    px = map(x / pz, 0, 1, 0, width);
    py = map(y / pz, 0, 1, 0, height);
    pz = z;

    // If it's not visible anymore, reset it to the back with a random position
    if (px < -width / 2 || px > width / 2 || py < -height || py > height || z < 1) {
      randomSetup(false);
    } else {

      // Draw with right opacity and radius
      stroke(255, map(z, width, width / 2, 0, 255));
      strokeWeight(radius);

      // Calculate the position of the star in 3D space and draw the trailing line
      line(px, py, map(x / z, 0, 1, 0, width), map(y / z, 0, 1, 0, height));
    }
  }
}
