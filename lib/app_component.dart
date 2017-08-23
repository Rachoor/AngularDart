import 'dart:async';

import 'package:angular2/angular2.dart';

import 'src/person.dart';
import 'src/person_detail_component.dart';
import 'src/person_service.dart';

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
    <person-detail [person]="selectedPerson"></person-detail>
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
  directives: const [CORE_DIRECTIVES, PersonDetailComponent],
  providers: const [PersonService],
)
class AppComponent {
  final title = 'Persons list';
  List<Person> persons;
  Person selectedPerson;

  final PersonService _personService;

  AppComponent(this._personService);

  Future<Null> getPersons() async {
    persons = await _personService.getPersons();
  }

  void ngOnInit() {
    getPersons();
  }

  void onSelect(Person person) {
    selectedPerson = person;
  }
}