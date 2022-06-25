import 'dart:math';
void main(List<String> args){
    print('hello woarld');
    hanshu1();
    var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
    voyager.describe();
    var voyager3 = Spacecraft.unlaunched('Voyager III');
    voyager3.describe();
}
void hanshu1(){
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  while (year < 2016) {
    year += 1;
  }
  print('year=$year');
}
class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;
  Spacecraft(this.name, this.launchDate) {
    
  }
  Spacecraft.unlaunched(String name) : this(name, null);
  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}
mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name,DateTime launchDate)
      : super(name,launchDate);
}
class MockSpaceship implements Spacecraft {
  String name='name1';
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;
  void describe(){

  }
}
abstract class Describable {
  void describe();
  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}