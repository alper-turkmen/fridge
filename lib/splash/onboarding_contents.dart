class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Hi, Welcome to Tidily",
    image: "https://i.hizliresim.com/jwzo2zo.png",
    desc: "Are you ready to do something for a better kitchen life?",
  ),
  OnboardingContents(
    title: "Shop easily and see what you bought",
    image: "https://i.hizliresim.com/od03pzr.png",
    desc: "Upload the shopping receipt and we'll arrange it for you",
  ),
  OnboardingContents(
    title: "It is very easy to reach thousands of new recipe",
    image: "https://i.hizliresim.com/acatcrr.png",
    desc: "No more think about which dish to cook with the ingredients at home",
  ),
];
