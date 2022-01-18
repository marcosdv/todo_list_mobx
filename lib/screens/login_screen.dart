import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/stores/login_store.dart';
import 'package:todo_list_mobx/widgets/custom_icon_button.dart';
import 'package:todo_list_mobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final LoginStore _loginStore;

  late ReactionDisposer _disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore = Provider.of<LoginStore>(context);

    /*
    autorun((_){
      if (_loginStore.loggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ListScreen())
        );
      }
    });
    */
    
    _disposer = reaction(
        (_) => _loginStore.loggedIn,
        (bool loggedIn) {
          if (loggedIn) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ListScreen())
            );
          }
        }
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(builder: (context) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: const Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: _loginStore.setEmail,
                        enabled: !_loginStore.loading,
                      );
                    }),
                    const SizedBox(height: 16,),
                    Observer(builder: (context){
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: const Icon(Icons.lock),
                        obscure: !_loginStore.passwordVisible,
                        onChanged: _loginStore.setPassword,
                        enabled: !_loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: _loginStore.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: _loginStore.togglePasswordVisible,
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: Observer(
                        builder: (context) {
                          return RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: _loginStore.loading
                                ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)
                                : const Text('Login'),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: _loginStore.loginClique,
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
