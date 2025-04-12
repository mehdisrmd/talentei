part of docLib;

class HeaderSection extends StatelessWidget {
  final String title;

  const HeaderSection({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(30 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: Row(
        children: [
          Container(
            width: 3,
            height: 20,
            color: AppColors.secondaryColor,
            margin: const EdgeInsets.only(left: 8),
          ),
          Text(
            title,
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 30 / 16,
            ),
          ),
        ],
      ),
    );
  }
}
