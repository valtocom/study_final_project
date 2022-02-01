import 'package:flutter/material.dart';

  Widget navDrawer(context) => Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: const BoxDecoration(
                    color: Colors.teal,
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            child: Image(image: AssetImage('assets/dart-logo.png')),
                          ),
                          const Text('Список пользователей',
                          style: TextStyle(fontSize: 18, color: Colors.black45),),
                        ],
                      ),
                    )),
                ListTile(
                  trailing: Text('Вход в аккаунт'),
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Авторизация'),
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Перейти к списку пользователей'),
                ),
                ListTile(
                  leading: const Icon(Icons.verified_user_rounded),
                  title: const Text('Пользователи'),
                  trailing: const Text('Users'),
                  onTap: () {
                    Navigator.pushNamed(context, '/users');
                  },
                ),

              ],
            ),
  );
