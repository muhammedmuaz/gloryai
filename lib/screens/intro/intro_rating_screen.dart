import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import '../../generic_widgets/image/gloryai_asset_image.dart';

class IntroRatingScreen extends StatefulWidget {
  const IntroRatingScreen({super.key});

  @override
  State<IntroRatingScreen> createState() => _IntroRatingScreenState();
}

class _IntroRatingScreenState extends State<IntroRatingScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen =
        screenWidth < 600; // Example breakpoint for small screens
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DesignConstants.kBackgroundEndColor,
              DesignConstants.kBackgroundStartColor,
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddHeight(0.05),
              // --- Animated Logo ---
              SizedBox(
                width: width * 0.6,
                child: GloryAiAssetImage(imagePath: AppImages.applogo),
              ),
              AddHeight(0.05),
              // Rating Icon
              SizedBox(
                height: height * 0.1,
                width: double.maxFinite,
                child: GloryAiAssetImage(
                  imagePath: AppImages.appRatingIcon,
                  fit: BoxFit.fitHeight,
                ),
              ),
              AddHeight(0.05),
              // Testimonials Text
              Text(
                'Testimonials',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kTextLightColor,
                ),
              ),
              AddHeight(0.03),
              // Carousel Section
              SizedBox(
                height: height * 0.335,
                child: Stack(
                  children: [
                    // Carousel with refined animations
                    CarouselSlider(
  disableGesture: true,
  controller: _carouselController,
  options: CarouselOptions(
    height: height * 0.335,
    aspectRatio: 16 / 9,
    viewportFraction: 0.67,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: 3.seconds,
    autoPlayAnimationDuration: 800.ms,
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    enlargeFactor: 0.1,
    scrollDirection: Axis.horizontal,
  ),
  items: testimonials.map((testimonial) {
    return Builder(
      builder: (BuildContext context) {
        return AnimatedContainer(
          duration: 500.ms,
          curve: Curves.easeInOut,
          child: Card(
            color: Colors.white,
            shadowColor: DesignConstants.kTextLightColor.withOpacity(0.3),
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Quote icon
                        Icon(
                          Icons.format_quote,
                          color: DesignConstants.kTextLightColor.withOpacity(0.3),
                          size: 40,
                        ),
                        
                        // Testimonial text
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              testimonial['text'],
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 14,
                                color: DesignConstants.kScarletGum,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        
                        // Divider
                        Divider(
                          color: DesignConstants.kTextLightColor.withOpacity(0.2),
                          thickness: 1,
                          height: 20,
                        ),
                        
                        // User info and rating
                        Row(
                          children: [
                            // Avatar placeholder (replace with actual avatar)
                            CircleAvatar(
                              radius: isSmallScreen ? 15 :20,
                              backgroundColor: DesignConstants.kTextLightColor,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial['name'],
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: isSmallScreen ? 12:14,
                                      fontWeight: FontWeight.bold,
                                      color: DesignConstants.kScarletGum,
                                    ),
                                  ),
                                  Text(
                                    testimonial['role'],
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: isSmallScreen ? 10 :12,
                                      color: DesignConstants.kTrendyPink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Rating stars
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < testimonial['rating'] 
                                    ? Icons.star 
                                    : Icons.star_border,
                                  color: index < testimonial['rating']
                                    ? DesignConstants.kTextGreenColor
                                    : DesignConstants.kAmethystSmoke,
                                  size: 16,
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }).toList(),
),
                    
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: DataConstants.kScreenHorizontalPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Arrow with refined animation
                            _buildArrowButton(
                              context,
                              icon: AppImages.leftArrowIcon,
                              isLeft: true,
                              onPressed:
                                  () => _carouselController.previousPage(),
                            ),
                            // Right Arrow with refined animation
                            _buildArrowButton(
                              context,
                              icon: AppImages.rightArrowIcon,
                              isLeft: false,
                              onPressed: () => _carouselController.nextPage(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // --- Animated Bottom Elements ---
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              AppNavigation.navigateTo(AppRoutesNames.introQuoteScreen);
            },
            child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: DataConstants.kScreenHorizontalPadding,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: DesignConstants.kTextGreenColor,
                    boxShadow: [
                      BoxShadow(
                        color: DesignConstants.kTextGreenColor.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  delay: 1000.ms,
                  duration: 1800.ms,
                  color: Colors.white.withOpacity(0.3),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.02, 1.02),
                  duration: 2000.ms,
                  curve: Curves.easeInOut,
                ),
          ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildArrowButton(
    BuildContext context, {
    required String icon,
    required bool isLeft,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: DesignConstants.kTextLightColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GloryAiAssetImage(imagePath: icon),
          ),
        ),
      ),
    );
  }
}



// Add this list of testimonials at the top of your file
const List<Map<String, dynamic>> testimonials = [
  {
    'name': 'Sarah J.',
    'role': 'Devotional Leader',
    'avatar': 'assets/images/avatar1.png', // Replace with your actual avatar paths
    'text': 'GloryAI has transformed my daily Bible study. The insights are profound yet accessible, helping me connect with Scripture on a deeper level.',
    'rating': 5,
  },
  {
    'name': 'Michael T.',
    'role': 'Youth Pastor',
    'avatar': 'assets/images/avatar2.png',
    'text': 'Our youth group loves using GloryAI! The interactive features keep them engaged while learning important biblical truths.',
    'rating': 5,
  },
  {
    'name': 'Grace L.',
    'role': 'Small Group Leader',
    'avatar': 'assets/images/avatar3.png',
    'text': 'The discussion prompts from GloryAI have sparked the most meaningful conversations in our small group meetings.',
    'rating': 4,
  },
  {
    'name': 'David K.',
    'role': 'Theology Student',
    'avatar': 'assets/images/avatar4.png',
    'text': 'As a theology student, I appreciate how GloryAI balances scholarly insights with practical application. A perfect study companion!',
    'rating': 5,
  },
  {
    'name': 'Emma R.',
    'role': 'Sunday School Teacher',
    'avatar': 'assets/images/avatar5.png',
    'text': 'Preparing lessons has never been easier. GloryAI provides creative ways to present biblical stories to children.',
    'rating': 4,
  },
];