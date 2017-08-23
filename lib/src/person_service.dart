import 'dart:async';

import 'package:angular2/angular2.dart';

import 'person.dart';
import 'all_persons.dart';

@Injectable()
class PersonService {
  Future<List<Person>> getPersons() async => allPersons;

  Future<List<Person>> getPersonsSlowly() {
  return new Future.delayed(const Duration(seconds: 2), getPersons);
}
}