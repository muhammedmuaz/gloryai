import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../generic_widgets/image/gloryai_asset_image.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  late OpenAI openAI;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize OpenAI instance
    openAI = OpenAI.instance.build(
      token:
          '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', // Replace with your actual API key
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 60)),
      enableLog: true,
    );

    // Add initial greeting
    _messages.add({
      'role': 'assistant',
      'content':
          'As we begin our devotional reflection, remember that God communicates with each of us individually. What message resonates with you in these words?',
    });
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'content': _messageController.text});
      _isLoading = true;
    });

    final userMessage = _messageController.text;
    _messageController.clear();

    try {
      // Create a Bible-focused prompt
      final biblePrompt = '''
      You are a Christian spiritual assistant providing guidance based on the Bible. 
      Respond to the user's question with relevant Bible verses and practical application.
      Keep responses under 200 words and maintain a pastoral tone.
      
      User question: $userMessage
      ''';

      final request = ChatCompleteText(
        messages: [
          Map.of({
            "role": "system",
            "content":
                "You are a knowledgeable Christian assistant that provides biblical guidance and spiritual support.",
          }),
          Map.of({"role": "user", "content": biblePrompt}),
        ],
        maxToken: 300,
        model:
            Gpt41106PreviewChatModel(), // or GptTurboChatModel() for faster responses
      );

      final response = await openAI.onChatCompletion(request: request);

      setState(() {
        _isLoading = false;
        if (response != null && response.choices.isNotEmpty) {
          _messages.add({
            'role': 'assistant',
            'content':
                response.choices.first.message?.content ??
                'I couldn\'t find a response. Please try again.',
          });
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _messages.add({
          'role': 'assistant',
          'content':
              'An error occurred. Please check your connection and try again.',
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              SizedBox(
                height: height,
                width: width,
                child: GloryAiAssetImage(
                  imagePath: AppImages.chatImgBackgroundIconGlory,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: height * 0.105,
                          width: double.maxFinite,
                          color: DesignConstants.kBackgroundStartColor,
                        ),
                        SafeArea(
                          child: ScreenPadding(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width * 0.35,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            14.0,
                                          ),
                                          color:
                                              DesignConstants
                                                  .kBackgroundStartColor,
                                        ),
                                        child: GloryAiAssetImage(
                                          imagePath: AppImages.bibleIconGlory,
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.1,
                                  child: GloryAiAssetImage(
                                    imagePath: AppImages.appLogoHomePage,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                GestureDetector(
                                  onTap: () {
                                    AppNavigation.goBack();
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color:
                                          DesignConstants.kBackgroundStartColor,
                                    ),
                                    child: GloryAiAssetImage(
                                      imagePath: AppImages.cancelIconGlory,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 100, // Space for the input field
                        ),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          final isUser = message['role'] == 'user';

                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  DataConstants.kScreenHorizontalPadding,
                              vertical: 8,
                            ),
                            child: Align(
                              alignment:
                                  isUser
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color:
                                      isUser
                                          ? DesignConstants.kTextGreenColor
                                              .withOpacity(0.1)
                                          : Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft:
                                        isUser
                                            ? Radius.circular(20)
                                            : Radius.zero,
                                    bottomRight:
                                        isUser
                                            ? Radius.zero
                                            : Radius.circular(20),
                                  ),
                                ),
                                child:
                                    index == 0 && !isUser
                                        ? AnimatedTextKit(
                                          animatedTexts: [
                                            TyperAnimatedText(
                                              message['content'],
                                              textStyle: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                              ),
                                              speed: 10.milliseconds,
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          displayFullTextOnTap: true,
                                        )
                                        : Text(
                                          message['content'],
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                DesignConstants
                                                    .kTextPurpleColor,
                                          ),
                                        ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (_isLoading)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                          vertical: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: DesignConstants.kTextPurpleColor,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    'Searching the Scriptures...',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: DesignConstants.kTextPurpleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(
              horizontal: DataConstants.kScreenHorizontalPadding,
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Colors.white,
              border: Border.all(
                width: 1.5,
                color: DesignConstants.kTextLightColor,
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Ask a biblical question...',
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: DesignConstants.kTextPurpleColor,
                          letterSpacing: 0.5,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onFieldSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: DesignConstants.kTextGreenColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.only(
                        left: 13,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    // openAI.close();
    super.dispose();
  }
}
