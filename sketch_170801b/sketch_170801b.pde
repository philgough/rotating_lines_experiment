RotLine[][] rotLines;
int cols = 25;
int rows = 25;

void setup() {
    size(500, 500);
    rotLines = new RotLine[cols][rows];
    for(int i = 0; i < cols; i++) {
        for(int j = 0; j < rows; j++) {
            rotLines[i][j] = new RotLine(i, j, cols);
        }
    }
    stroke(255);
    strokeWeight(1);
}


void draw() {
    background(0);
    for(int i = 0; i < cols; i++) {
        for(int j = 0; j < rows; j++) {
            rotLines[i][j].run();
        }
    }
}


class RotLine {
    float i, j;
    float x1, x2, y1, y2;
    float offset;
    float len = 7.5;
    RotLine(int ti, int tj, int cols) {
        i = ti * .9;
        j = tj * .9;
        x1 = 0;
        x2 = 0;
        y1 = 0;
        y2 = 0;
        offset = .5*(i*10.0 + j*cols);
    }
    
    void run() {
        float fc = frameCount * 2.5;
        x1 = sin(radians(fc + offset)) * len;
        y1 = cos(radians(fc + offset)) * len;
        x2 = sin(radians(fc + offset - 180)) * len;
        y2 = cos(radians(fc + offset - 180)) * len;
        pushMatrix();
        translate(i * 20.5 + width * .05, j * 20.5 + height * .05);
        line(x1, y1, x2, y2);
        popMatrix();
    }
}