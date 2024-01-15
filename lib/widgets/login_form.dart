import 'package:flutter/material.dart';
import 'package:interface_sistema/api/token.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/selection_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();


  @override
  void dispose() {
    _usernameFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(214, 214, 214,1),width: 3)),
          margin: EdgeInsets.only(left: getDeviceWith(context: context) * 0.12,top: getDeviceHeight(context: context) * 0.2,bottom: getDeviceHeight(context: context) * 0.2),
          padding: EdgeInsets.only(left: 16,right: 16,top: 16),
          width: getDeviceWith(context: context) * 0.2,
          height: getDeviceHeight(context: context) * 0.48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getDeviceHeight(context: context) * 0.04),
              TextFormField(
                controller: _usernameFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                    label: Text(
                      'Matricula',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ),
              SizedBox(height: getDeviceHeight(context: context) * 0.048),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: _passwordFieldController,
                decoration: InputDecoration(
                   border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    label: Text(
                      'Senha',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ),
              SizedBox(height: getDeviceHeight(context: context) * 0.08),
              Container(
                decoration: BoxDecoration(
             //      border: Border.all(color: Colors.red),
                ),
                width: getDeviceWith(context: context) * 0.16,
                height: getDeviceHeight(context: context) * 0.056,
             //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(89,76,239,1)
                        ),
                        onPressed: () {
                          setToken(_usernameFieldController.text, _passwordFieldController.text).then((value) {
                            if(value){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                            }
                            showNotificationSnackBarFail(context, "Ocorreu um erro  novamente mais tarde");
                          }
                          );
                        },
                        child:  Text('Entrar',style: TextStyle(color: Colors.white,
                            fontSize:
                        getAverageDeviceSize(context: context) * 0.016
                        ),)),
                  ),
                ),
            ],
          ),
        ),
      );
  }
}
