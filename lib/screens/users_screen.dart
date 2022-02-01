import 'package:flutter/material.dart';
import 'package:study_final_project/model/user.dart';
import 'package:study_final_project/screens/user_show_screen.dart';

import 'drawer_widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Пользователи"),
      ),
      drawer: navDrawer(context),
      body: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Ошибка при загрузке данных'),
              );
            } else if (snapshot.hasData) {
              return UserList(users: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key, required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return UserListItem(
          user: users[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
      ),
    );
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('#' + user.id.toString() + '. ' + user.name + ', ' + user.email),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreen(
                user: user,
              )),
        );
      },
    );
  }
}