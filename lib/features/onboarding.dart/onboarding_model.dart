class OnboardingModel {
  final String path;
  final String title;
  final String subtitle;
  final String buttonText;

  OnboardingModel({
    required this.path,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
}
final onboardingData = [
  OnboardingModel(
    path: "images/onboarding2.png",
    title: "Discover the Wonders of Ancient Egypt",
    subtitle: "Explore the Pyramids, Temples, and Tombs of the Pharaohs",
    buttonText: "Next",
  ),
  OnboardingModel(
    path: "images/onboarding3.png",
    title: "Experience the Magic of Modern Egypt",
    subtitle: "Discover the Vibrant Culture, Cuisine, and Nightlife of Egypt's Cities",
    buttonText: "Next",
  ),
  OnboardingModel(
    path: "images/onboarding1.png",
    title: "Embark on an Egyptian Adventure",
    subtitle: "Explore the Rich History, Culture, and Natural Beauty of Egypt",
    buttonText: "Start The Journey",
  ),
];