import 'package:angular2/angular2.dart';

import 'person.dart';

@Component(
  selector: 'person-detail',
  template: '''
    <div *ngIf="person != null">
      <h2>{{person.name}} details!</h2>
      <div><label>id: </label>{{person.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="person.name" placeholder="name">
      </div>
    </div>''',
  directives: const [COMMON_DIRECTIVES],
)
class HeroDetailComponent {
  @Input()
  Person person;
}