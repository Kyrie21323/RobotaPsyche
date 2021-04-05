PVector p1, p2, p3;
PVector V;
PVector Vm;

background(255);
size(500, 500);

p1 = new PVector (50, 50);
p2 = new PVector (120, 300);
p3 = new PVector (200, 130);

V = PVector.sub(p3, p1);

PVector B = PVector.sub(p2, p1);
B = B.normalize();
Vm = B.mult(V.dot(B));

fill(0, 0, 0);
ellipse(p1.x, p1.y, 10, 10);
ellipse(p2.x, p2.y, 10, 10);
ellipse(p3.x, p3.y, 10, 10);
noFill();

translate(p1.x,p1.y);
stroke(255, 255, 0); // V is the yellow line\
line(0, 0, V.x, V.y);

stroke(0, 0, 225); // VM is the blue line
line(0, 0, Vm.x, Vm.y);
