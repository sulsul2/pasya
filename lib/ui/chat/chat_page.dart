import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasya/ui/chat/presentation/chat_card.dart';
import 'package:pasya/ui/chat/presentation/image_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_model_class.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  Future<List<ChatModel>> fetchChats() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer $token',
      };

      final response = await http.get(
        Uri.parse('https://pasya-api.agilf.dev/api/Discussion?PageNumber=1&PageSize=5'),
        headers: headers
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> chatsJson = body['data'];
        return chatsJson.map((dynamic item) => ChatModel.fromJson(item)).toList();
      } else {
        print(response.body);
        print('Server responded with status code: ${response.statusCode}');
        throw Exception('Failed to load chats');
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('Failed to load chats');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: FutureBuilder<List<ChatModel>>(
        future: fetchChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No chats available'));
          } else {
            List<ChatModel> chats = snapshot.data!;
            return ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                ChatModel chat = chats[index];
                print(chats[index]);
                return ChatCard(chat: chat, imageLoader: AssetImageLoader(),);
              },
            );
            // return ListView.builder(
            //   itemCount: chats.length,
            //   itemBuilder: (context, index) {
            //     ChatModel chat = chats[index];
            //     String message = chat.message ?? 'No message';
            //     String truncatedMessage = message.length > 50
            //         ? '${message.substring(0, 50)}...'
            //         : message;
            //     return ListTile(
            //       leading: CircleAvatar(
            //         backgroundImage: NetworkImage(chat.createdBy!.picture!),
            //       ),
            //       title: Text(chat.createdBy!.name!),
            //       subtitle: Text(truncatedMessage),
            //       trailing: Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Text(chat.createdAt.toString().substring(5,10)),
            //           if (chat.isSolved!)
            //             Icon(Icons.check_circle, color: Colors.green),
            //           if (!chat.isSolved!)
            //             Icon(Icons.error, color: Colors.red),
            //         ],
            //       ),
            //     );
            //   },
            // );
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:pasya/ui/chat/presentation/image_loader.dart';
// import 'package:pasya/ui/widgets/header.dart';
//
// import 'presentation/chat_card.dart';
//
// class ChatModel {
//   const ChatModel({
//     required this.username,
//     required this.lastMessage,
//     required this.lastTime,
//     required this.imageUrl,
//     required this.countUnread,
//   });
//
//   final String username;
//   final String lastMessage;
//   final DateTime lastTime;
//   final String imageUrl;
//   final int countUnread;
// }
//
// class ChatPage extends StatelessWidget {
//   const ChatPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<ChatModel> chats = [
//       ChatModel(
//         username: 'Pedagang Ayam',
//         lastMessage: 'Ayamnya udah diterima?',
//         lastTime: DateTime.now(),
//         imageUrl:
//             'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//         countUnread: 12,
//       ),
//       ChatModel(
//         username: 'Pedangang Lemon',
//         lastMessage: 'Halo produk ini diskon!',
//         lastTime: DateTime.now().add(const Duration(hours: 1)),
//         imageUrl:
//             'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//         countUnread: 2,
//       ),
//       ChatModel(
//         username: 'Pedagang Makassar',
//         lastMessage:
//             'Halo selamat datang!',
//         lastTime: DateTime.now().add(const Duration(days: 1)),
//         imageUrl:
//             'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//         countUnread: 0,
//       )
//     ];
//
//     Widget chatList() {
//       return ListView(
//         padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
//         children: chats.map((chat) => ChatCard(chat: chat, imageLoader: AssetImageLoader(),)).toList(),
//       );
//     }
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           chatList(),
//           const Header(text: 'Chat'),
//         ],
//       ),
//     );
//   }
// }
