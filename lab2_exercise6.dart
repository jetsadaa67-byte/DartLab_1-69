void main() {
  print('--- โปรแกรมคำนวณพื้นที่และปริมาตรกล่อง ---');

  double width = 5.0;
  double length = 10.0;
  double height = 2.0;

  double area = width * length;
  double volume = width * length * height;

  print('ความกว้าง: $width, ความยาว: $length, ความสูง: $height\n');
  print('พื้นที่ฐาน = $area ตารางหน่วย');
  print('ปริมาตร = $volume ลูกบาศก์หน่วย');
}
