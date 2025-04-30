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

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final logoDuration = 800.ms;
    final conversationDelay = logoDuration + 300.ms;

    return Scaffold(
      body: Container(
        // Existing decoration
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
                                  onTap: (){
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
                    ScreenPadding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GloryAiAssetImage(
                                imagePath: AppImages.appLogoWithOutLogoIcon,
                              )
                              .animate(delay: conversationDelay)
                              .scaleXY(
                                begin: 0.9,
                                end: 1,
                                duration: 300.ms,
                                curve: Curves.easeOutBack,
                              )
                              .then()
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .scaleXY(
                                begin: 1,
                                end: 1.03,
                                duration: 2000.ms,
                                curve: Curves.easeInOut,
                              ),

                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'As we begin our devotional reflection, remember that God communicates with each of us individually. What message resonates with you in these words?',
                                textStyle: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: DesignConstants.kTextPurpleColor,
                                ),
                                speed: 10.milliseconds,
                              ),
                            ],
                            totalRepeatCount: 1,
                            displayFullTextOnTap: true,
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
          GestureDetector(
            onTap: () {},
            child: Container(
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
                        decoration: InputDecoration(
                          hintText: 'Send a message',
                          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                      ),
                    ),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: DesignConstants.kTextGreenColor,
                        shape: BoxShape.circle
                      ),
                      padding: EdgeInsets.only(
                        left: 13,
                        right: 10,
                        top: 10,
                        bottom: 10
                        ),
                      child: Icon(Icons.send, color: Colors.white,),
                    )
                  ],
                ),
              ),
              
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
