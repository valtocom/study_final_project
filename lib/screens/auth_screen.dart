import 'package:flutter/material.dart';
import 'package:study_final_project/screens/users_screen.dart';
import 'drawer_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final String _userPhone = '89001002003';
  final String _userPassword = '54321';

  final textPhoneController = TextEditingController();
  final textPasswordController = TextEditingController();

  void check() {
    if (textPhoneController.text == _userPhone &&
        textPasswordController.text == _userPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UsersScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Ошибка аутентификации')));
    }
  }


  @override
  Widget build(BuildContext context) {

        const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36),),
        borderSide: BorderSide(color: Color(0xFFbbbbbb), width: 2)
    );

    return Scaffold(
      drawer: navDrawer(context),
      body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage('assets/sky-back.jpg'),
      fit: BoxFit.cover,
      ),
      ),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                height: 150,
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png'),
              ),
              const Text(
                'Введите логин в виде 10 цифр номера телефона',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22,
                  color: Color.fromRGBO(0, 0, 0, 0.7),),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: textPhoneController,
                  decoration: const InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    labelText: 'Телефон',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  obscureText: true,
                  controller: textPasswordController,
                  decoration: const InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    labelText: 'Пароль',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                    width: 160,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check();
                        });
                      },
                      child: const Text('Войти'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0))),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: InkWell(
                  child: const Text('Регистрация'),
                  onTap: () {},
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                  child: const Text('Забыли пароль?'),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
