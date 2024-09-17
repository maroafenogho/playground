import 'dart:io';

void main() {
  orderPastry();
}

void orderPastry() {
  stdout.writeln('What is your name?');
  final name = stdin.readLineSync();
}
