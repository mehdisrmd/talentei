import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage>
    with SingleTickerProviderStateMixin {
  double _rating = 3.0;
  final Map<String, bool> _satisfactionItems = {
    'نظافت مطب': false,
    'امکانات رفاهی': false,
    'تشخیص درست': false,
    'نسخه الکترونیکی': false,
    'رفتار مناسب': false,
    'زمان انتظار در مطب': false,
  };

  late TabController _tabController;
  final TextEditingController _reviewController = TextEditingController();
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'ثبت نظر و امتیاز',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {
              // Navigation logic would go here
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildDoctorProfileCard(),
              const SizedBox(height: 16),
              _buildRatingSection(),
              const SizedBox(height: 16),
              _buildTabSection(),
              const SizedBox(height: 24),
              _buildSubmitButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorProfileCard() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200, width: 3),
            ),
            child: ClipOval(
              child: Image.network(
                'https://via.placeholder.com/100',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "بهرام میرزایی",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "متخصص روانشناسی",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "کاربر گرامی ضمن آرزوی سلامتی برای شما ؛ لطفا امتیاز خود را نسبت به خدمات دکتر بهرام میرزایی ثبت",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 48,
            unratedColor: Colors.grey[300],
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          const SizedBox(height: 8),
          Text(
            _getRatingText(),
            style: TextStyle(
              fontSize: 16,
              color: _getRatingColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getRatingText() {
    if (_rating >= 4) return 'عالی';
    if (_rating >= 3) return 'خوب';
    if (_rating >= 2) return 'متوسط';
    return 'ضعیف';
  }

  Color _getRatingColor() {
    if (_rating >= 4) return Colors.green;
    if (_rating >= 3) return Colors.blue;
    if (_rating >= 2) return Colors.orange;
    return Colors.red;
  }

  Widget _buildTabSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF1976D2),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFF1976D2),
            tabs: const [
              Tab(text: 'نکات قوت'),
              Tab(text: 'نکات ضعف'),
            ],
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSatisfactionTab(),
                _buildReviewTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSatisfactionTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'از کدام موارد رضایت داشته اید؟',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _satisfactionItems.entries.map((entry) {
              return FilterChip(
                label: Text(entry.key),
                selected: entry.value,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                selectedColor: Colors.blue.shade50,
                checkmarkColor: Colors.blue,
                onSelected: (bool selected) {
                  setState(() {
                    _satisfactionItems[entry.key] = selected;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'نظر خود را بنویسید',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _reviewController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'نظر خود را اینجا بنویسید...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _submitRating();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: _submitting
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    )
                  : const Text(
                      'ثبت بازخورد',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitRating() {
    // Show loading state
    setState(() {
      _submitting = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      // Here you would typically send data to your backend
      // Rating: _rating
      // Satisfaction items: _satisfactionItems
      // Review: _reviewController.text

      setState(() {
        _submitting = false;
      });

      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('موفقیت'),
          content:
              const Text('نظر شما با موفقیت ثبت شد. از همکاری شما متشکریم.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Here you might want to navigate back
              },
              child: const Text('تایید'),
            ),
          ],
        ),
      );
    });
  }
}
