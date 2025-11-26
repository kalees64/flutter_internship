class GradientCard {
  int id;
  String title;
  String description;
  String image;

  GradientCard({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
}

List<GradientCard> cards = [
  GradientCard(
    id: 1,
    title: "Cool Blue Harmony",
    description:
        "A calm, refreshing blue gradient symbolizing clarity, focus, and smooth flow—perfect for professional or productivity-focused sections.",
    image: "src/assets/images/bg-3.png",
  ),
  GradientCard(
    id: 2,
    title: "Galaxy Neon Gradient Card",
    description:
        "A vibrant blend of neon pink, purple, and cyan inspired by cosmic energy—ideal for creative, futuristic, or tech-inspired features.",
    image: "src/assets/images/bg-2.png",
  ),
  GradientCard(
    id: 3,
    title: "Crimson Energy Burst",
    description:
        "A bold red gradient representing strength, passion, and impact—great for urgent actions, highlights, or attention-grabbing content.",
    image: "src/assets/images/bg-1.png",
  ),
  GradientCard(
    id: 4,
    title: "Sunset Radiance",
    description:
        "A warm, energetic blend of red, pink, and golden hues—perfect for dynamic, motivational, or expressive content sections.",
    image: "src/assets/images/bg-5.jpg",
  ),
  GradientCard(
    id: 5,
    title: "Dreamy Pastel Flow",
    description:
        "A soft, soothing pastel gradient with flowing abstract curves—ideal for calm, elegant, and modern UI screens.",
    image: "src/assets/images/bg-7.jpg",
  ),
  GradientCard(
    id: 6,
    title: "Crimson Velvet Glow",
    description:
        "A deep and luxurious mix of red and purple tones—great for premium, bold, or dramatic themed sections.",
    image: "src/assets/images/bg-4.jpg",
  ),
  GradientCard(
    id: 7,
    title: "Magenta Aura Core",
    description:
        "A striking magenta-centered glow fading into deep shades—perfect for highlighting focused or spotlight areas in your app.",
    image: "src/assets/images/bg-6.jpg",
  ),
];
