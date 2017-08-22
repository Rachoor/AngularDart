import 'package:angular2/angular2.dart';

class Person {
  final int id;
  String name;

  Person(this.id, this.name);
}

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <h2>{{person.name}} details!</h2>
    <div><label>id: </label>{{personhero.id}}</div>
    <div>
      <label>name: </label>
      <input [(ngModel)]="person.name" placeholder="name">
    </div>''',
  directives: const [COMMON_DIRECTIVES],
)
class AppComponent {
  String title = 'List of persons';
  Person person = new Person(1, 'Jerome');
}