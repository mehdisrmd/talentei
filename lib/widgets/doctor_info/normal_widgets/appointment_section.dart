part of docLib;

class AppointmentSectionWidget extends StatelessWidget {
  const AppointmentSectionWidget({super.key});

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
        children: [
          HeaderSection(title: 'مشاوره حضوری'),
          const SizedBox(height: 10),
          _buildAppointmentItem('۶:۳۰', 'بعد از ظهر', '۲۵۰,۰۰۰ تومان'),
          const SizedBox(height: 10),
          _buildAppointmentItem('۷:۳۰', 'بعد از ظهر', '۲۵۰,۰۰۰ تومان'),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('مشاهده وقت‌های بیشتر'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentItem(String time, String period, String price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.teal, size: 18),
          const SizedBox(width: 8),
          Text('$time $period'),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('مدت زمان جلسه: ۴۵ دقیقه',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
