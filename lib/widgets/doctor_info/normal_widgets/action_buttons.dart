part of docLib;

class ActionButtonsWidget extends StatefulWidget {
  const ActionButtonsWidget({super.key});

  @override
  State<ActionButtonsWidget> createState() => _ActionButtonsWidgetState();
}

class _ActionButtonsWidgetState extends State<ActionButtonsWidget> {
  int selectedIndex = -1; // No selection initially

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE7E7E8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 40,
              spreadRadius: 10,
              offset: const Offset(0, 0),
              color:
                  Colors.black.withAlpha(8)) // Fixed .withValues to .withAlpha
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          const Text(
            'شیوه مشاوره خود را انتخاب کنید',
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 14,
              height: 30 / 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF353639),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton('assets/icons/users.svg', 'حضوری', 0),
              _buildActionButton('assets/icons/phone-call.svg', 'تلفنی', 1),
              _buildActionButton(
                  'assets/icons/monitor-mobbile.svg', 'آنلاین', 2),
            ],
          ),
          const SizedBox(height: 16), // Added padding at the bottom
        ],
      ),
    );
  }

  Widget _buildActionButton(String icon, String label, int index) {
    final bool isSelected = selectedIndex == index;

    // Colors
    final Color backgroundColor = isSelected
        ? const Color(0xFF51A2C8)
        : const Color(0xFFD9D9D9); // Fixed .withValues to .withAlpha

    final Color iconColor = isSelected ? Colors.white : const Color(0xFF353639);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 14,
              height: 30 / 14,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF51A2C8)
                  : const Color(0xFF353639),
            ),
          )
        ],
      ),
    );
  }
}
