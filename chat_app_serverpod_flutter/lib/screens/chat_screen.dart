import 'package:chat_app_serverpod_client/chat_app_serverpod_client.dart' as cl;
import 'package:chat_app_serverpod_flutter/functions/initialize_auth.dart';
import 'package:chat_app_serverpod_flutter/utils/data.dart';
import 'package:chat_app_serverpod_flutter/utils/methods.dart';
import 'package:chat_app_serverpod_flutter/utils/theme.dart';
import 'package:chatview/chatview.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AppTheme theme = LightTheme();
  bool isDarkTheme = false;
  var isLoaded;
  late ChatController _chatController;
  String myUserName = '';
  int myUserID = 1;

  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  @override
  void initState() {
    super.initState();
    client.openStreamingConnection().then((_) {
      listenForMessage();
    });
    isLoaded = fetchAllMessages();
    print(sessionManager.signedInUser?.toJson());
    myUserName = sessionManager.signedInUser?.userName ?? '';
    myUserID = sessionManager.signedInUser?.id ?? 1;
  }

  listenForMessage() async {
    client.usermessage.stream.listen((usermessage) {
      final cl.UserMessage thisMessage =
          cl.UserMessage.fromJson(usermessage.toJson());

      final index = _chatController.initialMessageList
          .indexWhere((e) => e.id == thisMessage.id.toString());
      if (index != -1) {
        // Update the existing message to 'Updated'
        Message found = _chatController.initialMessageList[index];
        Message updatedMessage = Message(
            createdAt: found.createdAt,
            message: found.message,
            sendBy: found.sendBy,
            id: found.id,
            status: MessageStatus.read,
            replyMessage: found.replyMessage,
            messageType: found.messageType,
            reaction: Reaction(
                reactions: thisMessage.reactions ?? [],
                reactedUserIds: thisMessage.reactionsUsers ?? []),
            voiceMessageDuration: found.voiceMessageDuration);

        _chatController.initialMessageList[index] = updatedMessage;
      } else {
        _chatController.addMessage(Message(
            createdAt: thisMessage.sent ?? DateTime.now(),
            message: thisMessage.message,
            sendBy: thisMessage.sender,
            id: thisMessage.id.toString(),
            status: MessageStatus.read,
            reaction: Reaction(
                reactions: thisMessage.reactions ?? [],
                reactedUserIds: thisMessage.reactionsUsers ?? []),
            voiceMessageDuration: null,
            replyMessage: thisMessage.replyMessages != null
                ? toFormat(thisMessage.replyMessages!)
                : ReplyMessage()));
      }

      //allMEssages.add(Message.fromJson(message.toJson()));
      setState(() {});
    });

    client.typingIndicator.stream.listen((typer) {
      try {
        final cl.TypingIndicator thisTyper =
            cl.TypingIndicator.fromJson(typer.toJson());

        if (thisTyper.typerID == myUserID) {
          return;
        } else {
          if (thisTyper.status) {
            _chatController.setTypingIndicator = true;
          } else {
            _chatController.setTypingIndicator = false;
          }
        }
      } catch (e) {
        print('Error" $e');
      }
    });
  }

  void changeMessage(String id) {
    final index =
        _chatController.initialMessageList.indexWhere((e) => e.id == id);
    if (index != -1) {
      // Update the existing message to 'Updated'
      Message found = _chatController.initialMessageList[index];
      Message updatedMessage = Message(
          createdAt: found.createdAt,
          message: 'Updated again',
          sendBy: found.sendBy,
          id: found.id,
          status: MessageStatus.read,
          replyMessage: found.replyMessage,
          messageType: found.messageType,
          reaction: found.reaction,
          voiceMessageDuration: found.voiceMessageDuration);

      _chatController.initialMessageList[index] = updatedMessage;
      print('Message updated in chat controller: ${updatedMessage.message}');
      setState(() {});
    } else {
      print('Message not found');
    }
  }

  Future<bool> fetchAllMessages() async {
    List<cl.UserMessage> allMessages =
        await client.usermessage.fetchAllMessages();
    List<Message> initialMessages = [];
    for (var e in allMessages) {
      initialMessages.add(Message(
          createdAt: e.sent ?? DateTime.now(),
          message: e.message,
          sendBy: e.sender,
          id: e.id.toString(),
          status: MessageStatus.read,
          reaction: Reaction(
              reactions: e.reactions ?? [],
              reactedUserIds: e.reactionsUsers ?? []),
          replyMessage: e.replyMessages != null
              ? toFormat(e.replyMessages!)
              : ReplyMessage()));
    }

    var usersRaw = await client.user.getAllUsers();
    print('----Got it---- $usersRaw');
    List<ChatUser> users = [];
    for (var e in usersRaw) {
      if (e.id != null && e.id != myUserID) {
        users.add(ChatUser(
          id: e.id.toString(),
          name: e.userName.toString(),
          profilePhoto: Data.profileImage,
        ));
      }
    }
    _chatController = ChatController(
      initialMessageList: initialMessages,
      scrollController: ScrollController(),
      chatUsers: users,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: isLoaded,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ChatView(
              currentUser: ChatUser(
                id: myUserID.toString(),
                name: myUserName,
                profilePhoto: Data.profileImage,
              ),
              chatController: _chatController,
              onSendTap: _onSendTap,
              featureActiveConfig: const FeatureActiveConfig(
                lastSeenAgoBuilderVisibility: true,
                receiptsBuilderVisibility: true,
              ),
              chatViewState: ChatViewState.hasMessages,
              chatViewStateConfig: ChatViewStateConfiguration(
                loadingWidgetConfig: ChatViewStateWidgetConfiguration(
                  loadingIndicatorColor: theme.outgoingChatBubbleColor,
                ),
                onReloadButtonTap: () {},
              ),
              typeIndicatorConfig: TypeIndicatorConfiguration(
                flashingCircleBrightColor: theme.flashingCircleBrightColor,
                flashingCircleDarkColor: theme.flashingCircleDarkColor,
              ),
              appBar: ChatViewAppBar(
                elevation: theme.elevation,
                backGroundColor: theme.appBarColor,
                profilePicture: Data.profileImage,
                backArrowColor: theme.backArrowColor,
                chatTitle: "Serverpod Users",
                chatTitleTextStyle: TextStyle(
                  color: theme.appBarTitleTextStyle,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 0.25,
                ),
                userStatus: "online",
                userStatusTextStyle: const TextStyle(color: Colors.grey),
                actions: [
                  IconButton(
                    onPressed: _onThemeIconTap,
                    icon: Icon(
                      isDarkTheme
                          ? Icons.brightness_4_outlined
                          : Icons.dark_mode_outlined,
                      color: theme.themeIconColor,
                    ),
                  ),
                ],
              ),
              chatBackgroundConfig: ChatBackgroundConfiguration(
                messageTimeIconColor: theme.messageTimeIconColor,
                messageTimeTextStyle:
                    TextStyle(color: theme.messageTimeTextColor),
                defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                  textStyle: TextStyle(
                    color: theme.chatHeaderColor,
                    fontSize: 17,
                  ),
                ),
                backgroundColor: theme.backgroundColor,
              ),
              sendMessageConfig: SendMessageConfiguration(
                imagePickerIconsConfig: ImagePickerIconsConfiguration(
                  cameraIconColor: theme.cameraIconColor,
                  galleryIconColor: theme.galleryIconColor,
                ),
                replyMessageColor: theme.replyMessageColor,
                defaultSendButtonColor: theme.sendButtonColor,
                replyDialogColor: theme.replyDialogColor,
                replyTitleColor: theme.replyTitleColor,
                textFieldBackgroundColor: theme.textFieldBackgroundColor,
                closeIconColor: theme.closeIconColor,
                textFieldConfig: TextFieldConfiguration(
                  onMessageTyping: (status) async {
                    if (status == TypeWriterStatus.typing) {
                      await client.typingIndicator.sendStreamMessage(
                          cl.TypingIndicator(status: true, typerID: myUserID));
                    }
                    if (status == TypeWriterStatus.typed) {
                      await client.typingIndicator.sendStreamMessage(
                          cl.TypingIndicator(status: false, typerID: myUserID));
                    }

                    /// Do with status
                    debugPrint(status.toString());
                  },
                  compositionThresholdTime: const Duration(seconds: 1),
                  textStyle: TextStyle(color: theme.textFieldTextColor),
                ),
                micIconColor: theme.replyMicIconColor,
                voiceRecordingConfiguration: VoiceRecordingConfiguration(
                  backgroundColor: theme.waveformBackgroundColor,
                  recorderIconColor: theme.recordIconColor,
                  waveStyle: WaveStyle(
                    showMiddleLine: false,
                    waveColor: theme.waveColor ?? Colors.white,
                    extendWaveform: true,
                  ),
                ),
              ),
              chatBubbleConfig: ChatBubbleConfiguration(
                outgoingChatBubbleConfig: ChatBubble(
                  linkPreviewConfig: LinkPreviewConfiguration(
                    backgroundColor: theme.linkPreviewOutgoingChatColor,
                    bodyStyle: theme.outgoingChatLinkBodyStyle,
                    titleStyle: theme.outgoingChatLinkTitleStyle,
                  ),
                  receiptsWidgetConfig: const ReceiptsWidgetConfig(
                      showReceiptsIn: ShowReceiptsIn.all),
                  color: theme.outgoingChatBubbleColor,
                ),
                inComingChatBubbleConfig: ChatBubble(
                  linkPreviewConfig: LinkPreviewConfiguration(
                    linkStyle: TextStyle(
                      color: theme.inComingChatBubbleTextColor,
                      decoration: TextDecoration.underline,
                    ),
                    backgroundColor: theme.linkPreviewIncomingChatColor,
                    bodyStyle: theme.incomingChatLinkBodyStyle,
                    titleStyle: theme.incomingChatLinkTitleStyle,
                  ),
                  textStyle:
                      TextStyle(color: theme.inComingChatBubbleTextColor),
                  onMessageRead: (message) {
                    /// send your message reciepts to the other client
                    debugPrint('Message Read');
                  },
                  senderNameTextStyle:
                      TextStyle(color: theme.inComingChatBubbleTextColor),
                  color: theme.inComingChatBubbleColor,
                ),
              ),
              replyPopupConfig: ReplyPopupConfiguration(
                backgroundColor: theme.replyPopupColor,
                buttonTextStyle: TextStyle(color: theme.replyPopupButtonColor),
                topBorderColor: theme.replyPopupTopBorderColor,
              ),
              reactionPopupConfig: ReactionPopupConfiguration(
                userReactionCallback: (message, emoji) async {
                  List<String>? reactionUsers = message.reaction.reactedUserIds;
                  reactionUsers.add(myUserID.toString());
                  List<String>? reactions = message.reaction.reactions;
                  reactions.add(emoji);
                  cl.UserMessage thismsg = cl.UserMessage(
                      sent: message.createdAt,
                      message: message.message,
                      sender: message.sendBy,
                      status: message.status.toString(),
                      id: int.tryParse(message.id) ?? 0,
                      reactions: reactions,
                      reactionsUsers: reactionUsers,
                      replyMessages: toDeFormat(message.replyMessage));
                  print('Updating in db ${thismsg.toJson()}');
                  await client.usermessage.sendStreamMessage(thismsg);
                },
                shadow: BoxShadow(
                  color: isDarkTheme ? Colors.black54 : Colors.grey.shade400,
                  blurRadius: 20,
                ),
                backgroundColor: theme.reactionPopupColor,
              ),
              messageConfig: MessageConfiguration(
                messageReactionConfig: MessageReactionConfiguration(
                  backgroundColor: theme.messageReactionBackGroundColor,
                  borderColor: theme.messageReactionBackGroundColor,
                  reactedUserCountTextStyle:
                      TextStyle(color: theme.inComingChatBubbleTextColor),
                  reactionCountTextStyle:
                      TextStyle(color: theme.inComingChatBubbleTextColor),
                  reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
                    backgroundColor: theme.backgroundColor,
                    reactedUserTextStyle: TextStyle(
                      color: theme.inComingChatBubbleTextColor,
                    ),
                    reactionWidgetDecoration: BoxDecoration(
                      color: theme.inComingChatBubbleColor,
                      boxShadow: [
                        BoxShadow(
                          color: isDarkTheme
                              ? Colors.black12
                              : Colors.grey.shade200,
                          offset: const Offset(0, 20),
                          blurRadius: 40,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                imageMessageConfig: ImageMessageConfiguration(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  shareIconConfig: ShareIconConfiguration(
                    defaultIconBackgroundColor: theme.shareIconBackgroundColor,
                    defaultIconColor: theme.shareIconColor,
                  ),
                ),
              ),
              profileCircleConfig: const ProfileCircleConfiguration(
                profileImageUrl: Data.profileImage,
              ),
              repliedMessageConfig: RepliedMessageConfiguration(
                backgroundColor: theme.repliedMessageColor,
                verticalBarColor: theme.verticalBarColor,
                repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
                  enableHighlightRepliedMsg: true,
                  highlightColor: Colors.pinkAccent.shade100,
                  highlightScale: 1.1,
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                ),
                replyTitleTextStyle:
                    TextStyle(color: theme.repliedTitleTextColor),
              ),
              swipeToReplyConfig: SwipeToReplyConfiguration(
                replyIconColor: theme.swipeToReplyIconColor,
              ),
            );
          }),
    );
  }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) async {
    // _chatController.addMessage(
    //   Message(
    //     id: DateTime.now().toString(),
    //     createdAt: DateTime.now(),
    //     message: message,
    //     sendBy: '1',
    //     replyMessage: replyMessage,
    //     messageType: messageType,
    //   ),
    // );
    try {
      Map<String, String> replyOf = {
        'message': replyMessage.message,
        'replyBy': replyMessage.replyBy,
        'replyTo': replyMessage.replyTo,
        'id': replyMessage.messageId
      };

      await client.usermessage.sendStreamMessage(cl.UserMessage(
          id: DateTime.now().year +
              DateTime.now().day +
              DateTime.now().hour +
              DateTime.now().month +
              DateTime.now().microsecond,
          sent: DateTime.now(),
          message: message,
          sender: myUserID.toString(),
          status: 'sent',
          replyMessages: replyOf));
    } catch (e) {
      print('Error cacthed $e');
    }

    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });
  }

  void _onThemeIconTap() {
    setState(() {
      if (isDarkTheme) {
        theme = LightTheme();
        isDarkTheme = false;
      } else {
        theme = DarkTheme();
        isDarkTheme = true;
      }
    });
    //  changeMessage();
  }
}
