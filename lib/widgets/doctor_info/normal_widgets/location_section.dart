part of docLib;

class LocationSectionWidget extends StatelessWidget {
  const LocationSectionWidget({super.key});

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
          HeaderSection(title: 'موقعیت مکانی مطب'),
          const SizedBox(height: 10),
          DoctorInfoSectionWidget.buildInfoItem(Icons.location_on,
              'آدرس: تهران، پاسداران، خیابان گلستان، پلاک ۶۵'),
          DoctorInfoSectionWidget.buildInfoItem(
              Icons.phone, 'تلفن: ۰۲۱۸۸۷۶۵۴۳۲'),
          const SizedBox(height: 10),
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(Icons.map, color: Colors.teal, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
