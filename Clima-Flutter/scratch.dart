void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print(result);
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print(result);
  });

  return result;
}

void task3(String task2Data) {
  String result = task2Data;
  print('task 3 result with $result');
}
