import 'package:e_co/app/modules/signIn/signIn_binding.dart';
import 'package:e_co/app/modules/signIn/signIn_view.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg",
      "title": "Welcome to Styliq",
      "description":
          "Explore the latest trends in fashion. Your style journey begins here."
    },
    {
      "image": "images/pexels-photo-842811.jpeg",
      "title": "Curated Just for You",
      "description": "Find outfits that match your vibe, mood, and lifestyle."
    },
    {
      "image": "images/istockphoto-1434715649-612x612.jpg",
      "title": "Shop Seamlessly",
      "description":
          "Fast checkout, exclusive deals, and doorstep delivery – all in one place."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = index == onboardingData.length - 1;
                });
              },
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Conditional Floating Images
                    index == 0
                        ? SizedBox(
                            height: 300,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 20,
                                  left: 0,
                                  child: Transform.rotate(
                                    angle: -0.2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        onboardingData[0]["image"]!,
                                        height: 180,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(26),
                                    child: Image.asset(
                                      onboardingData[1]["image"]!,
                                      height: 220,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  right: 0,
                                  child: Transform.rotate(
                                    angle: 0.2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        onboardingData[2]["image"]!,
                                        height: 180,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage(onboardingData[index]["image"]!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(46),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(height: 40),
                    Text(
                      onboardingData[index]["title"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]["description"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: onboardingData.length,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: AppColors.primary,
                    dotColor: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 24,
              right: 24,
              child: ElevatedButton(
                onPressed: () {
                  if (onLastPage) {
                    Get.to(() => SignInView(), binding: SignInBinding());
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  onLastPage ? "Start Shopping" : "Next",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
