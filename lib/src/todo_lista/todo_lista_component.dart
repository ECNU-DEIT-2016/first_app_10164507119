import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_lista_service.dart';


@Component(
  selector: 'todo-lista',
  styleUrls: ['todo_lista_component.css'],
  templateUrl: 'todo_lista_component.html',
  directives: [                                    //页面内容
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(TodoListaService)],
)
class TodoListaComponent implements OnInit {       //试一试吧              
  final TodoListaService todoListaService;

  List<String> items = [];
  String newTodo = '';

  TodoListaComponent(this.todoListaService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListaService.getTodoList();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  String remove(int index) => items.removeAt(index);
  
}
