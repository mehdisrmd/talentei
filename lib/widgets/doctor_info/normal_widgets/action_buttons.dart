part of docLib;

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Remove or adjust this padding
      // padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFE7E7E8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 40,
              spreadRadius: 10,
              offset: Offset(0, 0),
              color: Colors.black.withValues(alpha: 0.03))
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Text(
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
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton('assets/icons/users.svg', 'حضوری'),
              _buildActionButton('assets/icons/phone-call.svg', 'تلفنی'),
              _buildActionButton('assets/icons/monitor-mobbile.svg', 'آنلاین'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButton(String icon, String label) {
    return Column(
      children: [
        Container(
            // padding: const EdgeInsets.all(25),
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9).withValues(alpha: .50),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 30,
                height: 30,
                colorFilter:
                    ColorFilter.mode(Color(0xFF353639), BlendMode.srcIn),
              ),
            )),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.justify,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 14,
            height: 30 / 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF353639),
          ),
        )
      ],
    );
  }
}
