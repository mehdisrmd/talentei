part of docLib;

class DoctorInfoSectionWidget extends StatelessWidget {
  const DoctorInfoSectionWidget({super.key});

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
          HeaderSection(title: 'درباره دکتر سینا افشار'),
          const SizedBox(height: 10),
          buildInfoItem(Icons.school, 'دارای تخصص روانشناسی مشاوره'),
          buildInfoItem(
              Icons.psychology, 'دارای دوره های تخصصی روانشناسی خانواده'),
          buildInfoItem(
              Icons.medical_services, 'دارای سابقه کار در مراکز مشاوره'),
          buildInfoItem(Icons.psychology_outlined,
              'مشاور درمان اختلالات روانی و افسردگی'),
          buildInfoItem(Icons.wallet_membership, 'خدمات حوزه تخصصی'),
        ],
      ),
    );
  }

  static Widget buildInfoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.teal, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
