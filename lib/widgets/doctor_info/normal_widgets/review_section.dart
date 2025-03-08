part of docLib;

class ReviewSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader('نظرات کاربران'),
          const SizedBox(height: 10),
          Text(
            'کاربرانی که از خدمات این پزشک استفاده کرده‌اند، نظرات خود را در این قسمت به اشتراک گذاشته‌اند. شما هم می‌توانید بعد از استفاده از خدمات، نظر خود را ثبت کنید.',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 15),
          _buildReviewItem(
            'سارا',
            3.5,
            'خیلی خوب بود، ممنون از راهنمایی‌های مفیدتون',
            '۲ هفته پیش',
          ),
          const SizedBox(height: 10),
          _buildReviewItem(
            'علی',
            5.0,
            'بسیار عالی. از مشاوره ایشان بسیار راضی بودم و مشکلم حل شد.',
            '۱ ماه پیش',
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.comment, color: Colors.red),
            label: const Text('مشاهده همه نظرات',
                style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  static buildSectionHeader(String title) {
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
            color: Colors.teal,
            margin: const EdgeInsets.only(left: 8),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(
      String name, double rating, String comment, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.amber[100],
                radius: 15,
                child:
                    Text(name[0], style: const TextStyle(color: Colors.amber)),
              ),
              const SizedBox(width: 8),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 14,
                ignoreGestures: true,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}
