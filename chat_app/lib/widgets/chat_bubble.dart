import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  // final String message;
  final Alignment alignment;
  const ChatBubble({Key? key, required this.alignment, required this.entity}) : super(key: key);
  final ChatMessageEntity entity;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        child: Column(
          children: [
            Text(entity.text, style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if(entity.imageUrl != null)
              Image.network('${entity.imageUrl}', height: 100,)


          ],
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.5),

        padding: EdgeInsets.all(25),
        margin: EdgeInsets.all(50),
        decoration: const BoxDecoration(
            color:Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                // bottomLeft: widget.alignment %2 ==0 ? Radius.circular(25) : Radius.circular(0)
                bottomLeft: Radius.circular(25)

            )
        ),

      ),
    );
  }
}
