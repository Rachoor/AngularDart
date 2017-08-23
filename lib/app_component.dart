import 'package:angular2/angular2.dart';

import 'person.dart';
import 'person_detail_component.dart';

final List<Person> allPersons = [
  new Person(11, 'Luke'),
  new Person(12, 'Robert'),
  new Person(13, 'Chris'),
  new Person(14, 'Jake'),
  new Person(15, 'Paul'),
  new Person(16, 'Brian')
];

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <h2>My Persons</h2>
    <ul class="persons">
      <li *ngFor="let person of persons"
        [class.selected]="person == selectedPerson"
        (click)="onSelect(person)">
        <span class="badge">{{person.id}}</span> {{person.name}}
      </li>
    </ul>
    <div *ngIf="selectedPerson != null">
      <h2>{{selectedPerson.name}} details!</h2>
      <div><label>id: </label>{{selectedPerson.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="selectedPerson.name" placeholder="name"/>
      </div>
    </div>
  ''',
   styles: const [
    '''
      .selected {
        background-color: #333333 !important;
        color: white;
      }
      .persons {
        margin: 0 0 2em 0;
        list-style-type: none;
        padding: 0;
        width: 15em;
      }
      .persons li {
        cursor: pointer;
        position: relative;
        left: 0;
        background-color: #EEE;
        margin: .5em;
        padding: .3em 0em;
        height: 1.6em;
        border-radius: 4px;
      }
      .persons li.selected:hover {
        color: white;
      }
      .persons li:hover {
        color: #333333;
        background-color: #EEE;
        left: .1em;
      }
      .persons .text {
        position: relative;
        top: -3px;
      }
      .persons .badge {
        display: inline-block;
        font-size: small;
        color: white;
        padding: 0.8em 0.7em 0em 0.7em;
        background-color: #333333;
        line-height: 1em;
        position: relative;
        left: -1px;
        top: -4px;
        height: 1.8em;
        margin-right: .8em;
        border-radius: 4px 0px 0px 4px;
      }
    '''
  ],
  directives: const [COMMON_DIRECTIVES],
)
class AppComponent {
  final title = 'Persons list';
  final List<Person> persons = allPersons;
  Person selectedPerson;

  void onSelect(Person person) {
    selectedPerson = person;
  }
}