part of docLib;

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 34,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 40,
                      spreadRadius: 10,
                      offset: Offset(0, 0))
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Color(0xFFE7E7E8),
                    width: 1,
                    style: BorderStyle.solid)),
            child: Column(
              children: [
                const SizedBox(height: 27),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                ),
                const SizedBox(height: 23),
                const Text(
                  'دکتر نیما افشار',
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    height: 30 / 22,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF353639),
                  ),
                ),
                const Text(
                  'روانشناس',
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    height: 30 / 18,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF353639),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified, color: Color(0xFF3897F0), size: 20),
                    const SizedBox(width: 5),
                    const Text(
                      'کد نظام روانشناسی: ر-۱۲۳۴۵۶',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 16,
                        height: 30 / 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF353639),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                  decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(5)),
                  child: IntrinsicWidth(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/like.svg',
                          width: 18,
                          height: 18,
                          colorFilter: ColorFilter.mode(
                              Color(0xFF1F7168), BlendMode.srcIn),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '۹۵٪ کاربران پیشنهاد کردند',
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 10,
                            height: 10 / 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F7168),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    const Text(
                      '۴.۵ از (۲۵۰ نظر)',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 12,
                        height: 12 / 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF353639),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
