part of docLib;

class CalenderSectionWidget extends StatelessWidget {
  const CalenderSectionWidget({super.key});

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
          ReviewSectionWidget.buildSectionHeader('رزرو وقت مشاوره'),
          const SizedBox(height: 15),
          _buildCalendar(),
          const SizedBox(height: 15),
          _buildTimeSlots(),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.teal),
                onPressed: () {},
              ),
              const Text(
                'اسفند ۱۴۰۳',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.teal),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _weekDayLabel('ش'),
              _weekDayLabel('ی'),
              _weekDayLabel('د'),
              _weekDayLabel('س'),
              _weekDayLabel('چ'),
              _weekDayLabel('پ'),
              _weekDayLabel('ج'),
            ],
          ),
          const SizedBox(height: 10),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _weekDayLabel(String day) {
    return SizedBox(
      width: 30,
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Sample calendar data for demo purposes
    final days = List.generate(35, (index) => index - 3);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        final isCurrentMonth = day > 0 && day <= 30;
        final isSelected = day == 15;
        final hasAppointment = [5, 10, 15, 20, 25].contains(day);

        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.teal
                  : (hasAppointment && isCurrentMonth
                      ? Colors.teal.withOpacity(0.1)
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(15),
              border: isCurrentMonth && !isSelected && hasAppointment
                  ? Border.all(color: Colors.teal)
                  : null,
            ),
            child: Center(
              child: Text(
                isCurrentMonth ? day.toString() : '',
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : (isCurrentMonth ? Colors.black : Colors.grey[300]),
                  fontWeight: isSelected || hasAppointment
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'زمان‌های قابل رزرو در تاریخ ۱۵ اسفند',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildTimeSlot('۸:۰۰', true),
            _buildTimeSlot('۹:۰۰', false),
            _buildTimeSlot('۱۰:۰۰', true),
            _buildTimeSlot('۱۱:۰۰', false),
            _buildTimeSlot('۱۲:۰۰', false),
            _buildTimeSlot('۱۶:۰۰', true),
            _buildTimeSlot('۱۷:۰۰', true),
            _buildTimeSlot('۱۸:۰۰', false),
          ],
        ),
        const SizedBox(height: 15),
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
            child: const Text('رزرو وقت'),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time, bool available) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: available ? Colors.white : Colors.grey[200],
          border:
              Border.all(color: available ? Colors.teal : Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: available ? Colors.teal : Colors.grey,
            fontWeight: available ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewSummary() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              children: [
                const Text(
                  '۴.۸',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                RatingBar.builder(
                  initialRating: 4.8,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 16,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const Text(
                  '۱۲۶ نظر',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                children: [
                  _buildRatingBar(5, 0.7),
                  _buildRatingBar(4, 0.2),
                  _buildRatingBar(3, 0.07),
                  _buildRatingBar(2, 0.02),
                  _buildRatingBar(1, 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        Text(
          stars.toString(),
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(width: 5),
        Icon(Icons.star, color: Colors.amber, size: 12),
        const SizedBox(width: 5),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              minHeight: 6,
            ),
          ),
        ),
      ],
    );
  }
}
