
class Penguin {
  private float _x;
  private float _y;
  private float _z;
  private color _color;
  private float _radius;
  
  // Конструктор с параметрами
  public Penguin(float x, float y, float z, color c, float r){
    this._x = x;
    this._y = y;
    this._z = z;
    
    this._color = c;
    this._radius = r;
  }
  
  public void display(MaxMinObj maxMin, float size) {
    // Вычисление нормированных координат
    float x = (this._x - maxMin.min_x) * size/ maxMin.max_x;
    float y = (this._y - maxMin.min_y) * size/ maxMin.max_y;
    float z = (this._z - maxMin.min_z) * size/ maxMin.max_z;
    
    pushMatrix();
    noStroke();
    lights();
    translate(x, y, z);
    fill(this._color);
    sphere(this._radius);
    popMatrix();
  }
  
  public float getX() {
    return this._x;
  }
  
  public float getY() {
    return this._y;
  }
  
  public float getZ() {
    return this._z;
  }
}
