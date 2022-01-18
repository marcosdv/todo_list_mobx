import 'package:mobx/mobx.dart';
import 'package:todo_list_mobx/stores/todo_store.dart';

part 'lista_store.g.dart';

class ListaStore = _ListaStore with _$ListaStore;

abstract class _ListaStore with Store {

  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle)); //adicona no inicio da lista
    //todoList.add(TodoStore(newTodoTitle)); //add adiciona no fim da lista

    newTodoTitle = "";
  }
}