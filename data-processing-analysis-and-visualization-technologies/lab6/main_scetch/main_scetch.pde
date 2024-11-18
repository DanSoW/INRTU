import java.util.Collections;

int customSize = 1400;

float x_coord, y_coord;
float new_x_coord, new_y_coord;
float scale = 1;

int sizeWindow = 800;

// Объект таблицы
Table table;
// Путь до файла с данными
String data_filepath = "..\\data\\penguins_size.csv";
// Массив пингвинов
ArrayList<Penguin> penguins;
// Объект для хранения min/max значений
MaxMinObj maxMin;

// Чтение массива пингвинов из CSV-файла
ArrayList<Penguin> csvReadToArray() {
  ArrayList<Penguin> result = new ArrayList<Penguin>();
  Table table = loadTable(data_filepath, "header");
  
  for(TableRow row : table.rows()) {
    // Вычисление координат x, y, z
    float x = row.getFloat("culmen_length_mm");
    float y = row.getFloat("culmen_depth_mm");
    float z = row.getFloat("flipper_length_mm");
    
    String species = row.getString("species");
    /*String island = row.getString("island");
    float body_mass_g = row.getFloat("body_mass_g");
    String sex = row.getString("sex");*/
  
    color c;
    c = color(0, 128, 255);
    
    // Определение цвета по виду
    switch(species) {
      case "Adelie": {
        c = color(0, 255, 0);
        break;
      }
      case "Chinstrap": {
        c = color(255, 0, 0);
        break;
      }
      case "Gentoo": {
        c = color(0, 0, 255);
        break;
      }
      default: {
        break;
      }
    }
    
    // Добавление информации о пингвине в массив
    result.add(new Penguin(x, y, z, c, 5));
  }
  
  float max_x, min_x;
  float max_y, min_y;
  float max_z, min_z;

  // Вычисление маскимальной координаты x
  max_x = Collections.max(result, new MaxX()).getX();
  // Вычисление минимальной координаты y
  min_x = Collections.max(result, new MinX()).getX();
  
  // Вычисление максимальной координаты y
  max_y = Collections.max(result, new MaxY()).getY();
  // Вычисление минимальной координаты y
  min_y = Collections.max(result, new MinY()).getY();
  
  // Вычисление максимальной координаты z
  max_z = Collections.max(result, new MaxZ()).getZ();
  // Вычисление минимальной координаты z
  min_z = Collections.max(result, new MinZ()).getZ();
  
  // Формирование объекта, для хранения максимальных и минимальных значений x, y и z
  maxMin = new MaxMinObj(max_x, min_x, max_y, min_y, max_z, min_z);
  
  return result;
}

void mouseDragged() {
  new_x_coord = mouseX / float(width) * TWO_PI;
  new_y_coord = mouseY / float(width) * TWO_PI;
  
  float diff = (x_coord - new_x_coord);
  if(abs(diff) > 0.01){
    x_coord -= diff / 2.0;
  }
  
  diff = (y_coord - new_y_coord);
  if(abs(diff) > 0.01) {
    y_coord -= diff / 2.0;
  }
}

void mouseWheel(MouseEvent e) {
  float diff = e.getCount();
  scale = scale + diff / 10;
}

void setup(){
  // Перемещение окна на координату (50, 50) от левого верхнего угла экрана
  windowMove(50, 50);
  
  // Установка размера окна с поддержкой 3D
  size(1000, 800, P3D);
  background(0);
  noStroke();
  
  // Чтение набора данных из CSV
  penguins = csvReadToArray();
}


void draw() {
  background(255);
  translate(width / 3, height / 2, 0);
  scale(scale);
  rotateX(-y_coord);
  rotateY(-x_coord);
  
  float posZ = -maxMin.min_z;
  
  stroke(0, 0, 255, 100);
  line(0, 0, posZ, 0, 0, sizeWindow);
  fill(255, 0, 0);
  
  stroke(255, 0, 0, 100);
  line(0, 0, posZ, 0, sizeWindow, posZ);
  fill(0, 255, 0);
  
  stroke(0, 0, 255, 100);
  line(0, 0, posZ, sizeWindow, 0, posZ);
  fill(0, 0, 255);
  
  stroke(200);
  
  int iter = sizeWindow / 10;
  int delta = 1;
  
  for(int i = iter; i <= sizeWindow; i = i + iter) {
    line(0, 0, posZ + i, 0, sizeWindow, posZ + i);
    line(i, 0, posZ , i, 0, sizeWindow);
    line(0, i, posZ, 0, i, sizeWindow);
    line(0, 0, posZ + i, sizeWindow, 0, posZ + i);
    
    pushMatrix();
    textSize(14);
    text(delta, i, 0, posZ);
    text(delta, 0, i, posZ);
    text(delta, 0, 0, posZ + i);
    popMatrix();
    
    delta++;
  }
  
  pushMatrix();
  fill(200);
  translate(0, 0, posZ);
  rect(0, 0, sizeWindow, sizeWindow);
  popMatrix();
  
  for(int i = penguins.size() - 1; i >= 0; i--){
    Penguin penguin = penguins.get(i);
    penguin.display(maxMin, customSize);
  }
}
