import 'package:chat_app_serverpod_client/chat_app_serverpod_client.dart';
import 'package:chat_app_serverpod_flutter/functions/initialize_auth.dart';
import 'package:chat_app_serverpod_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController text = TextEditingController();
  TextEditingController to = TextEditingController();
  List<Message> allMEssages = [];

  Future<void> sendMessage() async {
    try {
      String userID = sessionManager.signedInUser!.id.toString();
      print(sessionManager.signedInUser?.id);
      Message newMsg = Message(
          receiver: to.text,
          sender: userID,
          text: text.text,
          sent: DateTime.now());
      allMEssages.add(newMsg);
      await client.message.sendStreamMessage(newMsg);
      setState(() {});
    } catch (e) {
      print('Erorr is $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // client.openStreamingConnection().then((_) {
    //   listenForMessage();
    // });
  }

  listenForMessage() async {
    print('Listening for message----');
    await for (var message in client.message.stream) {
      print('New Message Receve: ${message.toJson()}');
      allMEssages.add(Message.fromJson(message.toJson()));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: CircularUserImage(
            userInfo: sessionManager.signedInUser,
            size: 42,
          ),
          title: Text(sessionManager.signedInUser!.userName.toString()),
          subtitle: Text(sessionManager.signedInUser!.email ?? ''),
        ),
        TextField(
          controller: to,
        ),
        TextField(
          controller: text,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // sessionManager.signOut();
              sendMessage();
            },
            child: const Text('Sign out'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // sessionManager.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ChatScreen()));
            },
            child: const Text('Go to Chat'),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: allMEssages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(allMEssages[index].text.toString()),
              subtitle:
                  Text('Reeiver : ${allMEssages[index].receiver.toString()}'),
              trailing:
                  Text('Sender : ${allMEssages[index].sender.toString()}'),
            );
          },
        )
      ],
    );
  }
}
