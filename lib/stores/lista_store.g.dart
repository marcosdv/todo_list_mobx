// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaStore on _ListaStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ListaStore.isFormValid'))
          .value;

  final _$newTodoTitleAtom = Atom(name: '_ListaStore.newTodoTitle');

  @override
  String get newTodoTitle {
    _$newTodoTitleAtom.reportRead();
    return super.newTodoTitle;
  }

  @override
  set newTodoTitle(String value) {
    _$newTodoTitleAtom.reportWrite(value, super.newTodoTitle, () {
      super.newTodoTitle = value;
    });
  }

  final _$_ListaStoreActionController = ActionController(name: '_ListaStore');

  @override
  void setNewTodoTitle(String value) {
    final _$actionInfo = _$_ListaStoreActionController.startAction(
        name: '_ListaStore.setNewTodoTitle');
    try {
      return super.setNewTodoTitle(value);
    } finally {
      _$_ListaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo() {
    final _$actionInfo =
        _$_ListaStoreActionController.startAction(name: '_ListaStore.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$_ListaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodoTitle: ${newTodoTitle},
isFormValid: ${isFormValid}
    ''';
  }
}
