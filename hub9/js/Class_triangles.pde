class triangleObjects {
  
  PShape triangleShape;
  PVector vertex1;
  PVector vertex2;
  PVector vertex3;
  PVector start_vertex1;
  PVector start_vertex2;
  PVector start_vertex3;
  PVector end_vertex1;
  PVector end_vertex2;
  PVector end_vertex3;
  int red;
  int green;
  int blue;  
  int alpha;
  int start_red;
  int start_green;
  int start_blue;
  int start_alpha;
  int end_red;
  int end_green;
  int end_blue;  
  int end_alpha;
  
 triangleObjects(PVector v1, PVector v2, PVector v3) {
	start_vertex1 = v1;
	start_vertex2 = v2;
	start_vertex3 = v3;
	end_vertex1 = v1;
	end_vertex2 = v2;
	end_vertex3 = v3;
	start_red = random(randomRedStart,randomRedEnd);
	start_green = random(randomGreenStart,randomGreenEnd);
	start_blue = random(randomBlueStart,randomBlueEnd);
	start_alpha = random(randomAlphaStart,randomAlphaEnd);
	end_red = start_red;
	end_green = start_green;
	end_blue = start_blue;
	end_alpha = start_alpha;
 } 
 
 void draw(float progress){	
	vertex1 = end_vertex1.get();
	vertex2 = end_vertex2.get();
	vertex3 = end_vertex3.get();
	vertex1.sub(start_vertex1);
	vertex2.sub(start_vertex2);
	vertex3.sub(start_vertex3);
	vertex1.mult(progress);
	vertex2.mult(progress);
	vertex3.mult(progress);
	vertex1.add(start_vertex1);
	vertex2.add(start_vertex2);
	vertex3.add(start_vertex3);
	red = (end_red - start_red) * progress + start_red;
	green = (end_green - start_green) * progress + start_green;
	blue = (end_blue - start_blue) * progress + start_blue;
	alpha = (end_alpha - start_alpha) * progress + start_alpha;
	fill(red,green,blue,alpha);
	noStroke();
	triangle(vertex1.x, vertex1.y, vertex2.x, vertex2.y, vertex3.x, vertex3.y);
 }
 
 void changeShape(PVector v1, PVector v2, PVector v3){
	start_vertex1 = end_vertex1;
	start_vertex2 = end_vertex2;
	start_vertex3 = end_vertex3;
	end_vertex1 = v1;
	end_vertex2 = v2;
	end_vertex3 = v3;
	start_red = end_red;
	start_green = end_green;
	start_blue = end_blue;
	start_alpha = end_alpha;
	end_red = random(randomRedStart,randomRedEnd);
	end_green = random(randomGreenStart,randomGreenEnd);
	end_blue = random(randomBlueStart,randomBlueEnd);
	end_alpha = random(randomAlphaStart,randomAlphaEnd);
 }
}
