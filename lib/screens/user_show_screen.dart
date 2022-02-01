import 'package:flutter/material.dart';
import 'package:study_final_project/model/todo.dart';
import 'package:study_final_project/model/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Страница пользователя"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "${widget.user.name} (${widget.user.username})",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "Телефон: ${widget.user.phone}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "Email: ${widget.user.email}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "Веб-сайт: ${widget.user.website}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "Компания: ${widget.user.company.name}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "Адрес: ${widget.user.address.zipcode}, ${widget.user.address.city}, ${widget.user.address.street}, ${widget.user.address.suite} (${widget.user.address.geo.lat}, ${widget.user.address.geo.lng})",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "Задачи",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
              Flexible(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: UserTodos(userId: widget.user.id)),
            ),
          ],
        ),
      ),
    );
  }
}

class UserTodos extends StatelessWidget {
  const UserTodos({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: fetchTodos(userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Ошибка при загрузке задач'),
            );
          } else if (snapshot.hasData) {
            return TodoList(todos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListItem(
          todo: todos[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
      ),
    );
  }
}

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(todo.title),
      value: todo.completed,
      onChanged: (newValue) {},
    );
  }
}