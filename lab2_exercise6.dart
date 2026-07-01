void greet(String name) {
  print('Hello, $name!');
}

int multiply(int a, int b) => a * b;

double calculateArea({required double width, required double height}) {
  return width * height;
}

void main() {
  greet('Somchai');

  int product = multiply(7, 6);
  print('7 * 6 = $product');

  double area = calculateArea(width: 5.5, height: 10.0);
  print('Area (5.5 x 10.0) = $area');

  double area2 = calculateArea(height: 8.0, width: 4.0); 
  print('Area (4.0 x 8.0) = $area2');
}