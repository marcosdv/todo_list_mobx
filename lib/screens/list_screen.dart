import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/stores/lista_store.dart';
import 'package:todo_list_mobx/stores/login_store.dart';
import 'package:todo_list_mobx/widgets/custom_icon_button.dart';
import 'package:todo_list_mobx/widgets/custom_text_field.dart';
import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ListaStore _listaStore = ListaStore();

  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: (){
                        Provider.of<LoginStore>(context, listen: false).logout();

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=> const LoginScreen())
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (context){
                          return CustomTextField(
                            controller: _todoController,
                            hint: 'Tarefa',
                            onChanged: _listaStore.setNewTodoTitle,
                            suffix: _listaStore.isFormValid
                                ? CustomIconButton(
                                    radius: 32,
                                    iconData: Icons.add,
                                    onTap: () {
                                      _listaStore.addTodo();
                                      _todoController.clear();
                                    },
                                  )
                                : null,
                          );
                        }),
                        const SizedBox(height: 8,),
                        Expanded(
                          child: Observer(
                            builder: (context) {
                              return ListView.separated(
                                itemCount: _listaStore.todoList.length,
                                itemBuilder: (_, index){
                                  final todo = _listaStore.todoList[index];
                                  return Observer(builder: (context){
                                    return ListTile(
                                      title: Text(
                                        todo.title,
                                        style: TextStyle(
                                          decoration: todo.done ? TextDecoration.lineThrough : null,
                                          color: todo.done ? Colors.grey : Colors.black,
                                        ),
                                      ),
                                      onTap: todo.toggleDone,
                                    );
                                  });
                                },
                                separatorBuilder: (_, __){
                                  return const Divider();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}