import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Whatsapp"),
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF075E54),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Chats", icon: Icon(Icons.message_outlined)),
                Tab(text: "Status", icon: Icon(Icons.incomplete_circle)),
                Tab(text: "Calls", icon: Icon(Icons.call)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Chats(),
              Statues(),
              Calls(),
            ],
          ),
        )
      ),
    );
  }
}

class ChatTile extends StatelessWidget {

  ChatTile(this.index);
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 35,
        backgroundColor: Colors.green,
      ),
      title: Text("User ${index + 1}"),
      subtitle: const Text("Welcome to whatsapp"),
      trailing: const Text("online", style: TextStyle(color: Colors.green, fontSize: 10),),
      onTap: () {},
      enabled: true,
    );
  }
}

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ChatTile(index),
        separatorBuilder: (context, index) => Center(
          child: Container(
          width: 500,
          height: 0.5,
          color: Colors.grey,
          ),
        ),
        itemCount: 101
      ),
    );
  }
}

class StatueTile extends StatelessWidget {

  StatueTile(this.index);
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 35,
        backgroundColor: Colors.green,
      ),
      title: Text("User ${index + 1}"),
      subtitle: Text("${(index + 5) * 2} minutes ago"),
      onTap: () {},
      enabled: true,
    );
  }
}

class Statues extends StatelessWidget {
  const Statues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => StatueTile(index),
          separatorBuilder: (context, index) => Center(
            child: Container(
              width: 500,
              height: 0.5,
              color: Colors.grey,
            ),
          ),
          itemCount: 101
      ),
    );
  }
}

class CallTile extends StatelessWidget {

  CallTile(this.index);
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 35,
        backgroundColor: Colors.green,
      ),
      title: Text("User ${index + 1}"),
      subtitle: const Text("yesterday, 7:45 pm"),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.call)
      ),
      onTap: () {},
      enabled: true,
    );
  }
}

class Calls extends StatelessWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => CallTile(index),
          separatorBuilder: (context, index) => Center(
            child: Container(
              width: 500,
              height: 0.5,
              color: Colors.grey,
            ),
          ),
          itemCount: 101
      ),
    );
  }
}