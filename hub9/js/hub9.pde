//random cell
//by Rafael Guimarães Crespo
//rafealgcrespo@gmail.com

Grid[] grid;

int stageWidth = 150;
int stageHeight = 150;

int showGrid = 0;

int sides = 9;
int radius = 25;
int steps =  4;
int stepsPadding = 15;
int triangles = 30;
int cells = 1;

int bgRed = 0;
int bgGreen = 0;
int bgBlue = 0;

int paddingXCells = stageWidth/(cells+1);
int paddingXBetweenCells = paddingXCells;


int randomRedStart = 0;
int randomRedEnd = 255;
int randomGreenStart = 20;
int randomGreenEnd = 21;
int randomBlueStart = 49 ;
int randomBlueEnd = 50;
int randomAlphaStart = 99;
int randomAlphaEnd = 100;

int timer = 199;
int timeEnd = 200;

void setup() {
  size(stageWidth, stageHeight);
  smooth(8);
  
  background(bgRed,bgGreen,bgBlue);
  fill(0);
  rect(0,0,width,height);
  
  grid = new Grid[cells];
  background(bgRed,bgGreen,bgBlue);
  for(int i=0;i<cells;i++) {
	grid[i] = new Grid(paddingXCells, height/2, radius, sides, steps, stepsPadding);
	paddingXCells += paddingXBetweenCells;
	grid[i].createTriangles(triangles);  
  }
}

void draw() {
	float progress = timer/timeEnd;
	progress = 1 / (1 + pow(2, -10*progress + 5));
	float a = 1/((96/99)-(3/99));
	float b = (3/99) * a;
	progress = progress * a - b;
	background(bgRed,bgGreen,bgBlue);
	for(int i=0;i<cells;i++) {
		grid[i].draw(progress);
	}
	timer ++;
	if (timer >= timeEnd){
		timer = 0;
		for(int i=0;i<cells;i++) {
			grid[i].changeShape();
		}
	}
} 
