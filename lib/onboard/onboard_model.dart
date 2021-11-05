class onBoardingContent {
  String image = "";
  String title = "";
  String description = "";

  onBoardingContent({this.image = "", this.title = "", this.description = ""});
}

List<onBoardingContent> contents = [
  onBoardingContent(
      image: "assets/onboard1.png",
      description: "Hello world ini onboarding pertama"),
  onBoardingContent(
    image: "assets/onboard2.png",
    description:
        "Hello world ini onboarding kedua untuk training\nBasic Flutter di Udacoding",
  ),
  onBoardingContent(
    image: "assets/onboard3.png",
    description:
        "Hello world ini onboarding terakhir untuk training\nBasic Flutter di Udacoding",
  ),
];
