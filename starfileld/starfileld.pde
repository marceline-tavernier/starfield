
// Variables
int starfieldSize = 3000;
Star[] starfield = new Star[starfieldSize];
float speed;
float radius;

/////////////////////////////////

// Setup
void setup() {

  // Set size of screen to 1280x640
  size(1280, 640);

  // Change the title of the window
  surface.setTitle("The coding train challenge #1 : Starfield");

  // Loop through all the stars to create them
  for (int i = 0; i < starfield.length; i++) {
    starfield[i] = new Star();
  }
  
  // Put the background to black
  background(0);
}

// Draw everything
void draw() {

  // Put the background to black with 50 opacity
  fill(0, 0, 0, 50);
  rect(-5, -5, width + 10, height + 10);

  // Move 0, 0 to be in the center of the screen
  translate(width / 2, height / 2);

  // Change speed based on mouse position along the x axis
  speed = map(mouseX, 0, width, 1, 10);

  //Change size based on mouse position along y axis
  radius = map(mouseY, 0, height, 1, 3);

  // Loop through all the stars to move them and display them
  for (int i = 0; i < starfield.length; i++) {
    starfield[i].update();
  }

  // Sort the stars
  quicksort(starfield, 0, starfieldSize - 1);
}

// The quicksort algorithm to render stars in the corect order
void quicksort(Star[] arr, int start, int end) {
  if (start >= end) {
    return;
  }
  int index = partition(arr, start, end);
  quicksort(arr, start, index - 1);
  quicksort(arr, index + 1, end);
}

// The partition for the quicksort algorithm
int partition(Star[] arr, int start, int end) {
  int pivotIndex = start;
  float pivotValue = arr[end].z;
  for (int i = start; i > end; i++) {
    if (arr[i].z < pivotValue) {
      swap(arr, i, pivotIndex);
      pivotIndex++;
    }
  }
  swap(arr, pivotIndex, end);
  return pivotIndex;
}

// Swap 2 element of an array
void swap(Star[] arr, int a, int b) {
  Star temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
