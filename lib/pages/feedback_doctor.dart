import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController commentController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  FToast fToast = FToast();
  double _rating = 3.0;
  bool comment = false;
  final Map<String, bool> _satisfactionItems = {
    'نظافت مطب': false,
    'امکانات رفاهی': false,
    'تشخیص درست': false,
    'نسخه الکترونیکی': false,
    'رفتار مناسب': false,
    'زمان انتظار در مطب': false,
  };
  final Map<String, bool> _dissatisactionItems = {
    'نظافت مطب': false,
    'امکانات رفاهی': false,
    'تشخیص درست': false,
    'نسخه الکترونیکی': false,
    'رفتار مناسب': false,
    'زمان انتظار': false,
  };

  late TabController _tabController;
  final TextEditingController _reviewController = TextEditingController();
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fToast = FToast();
    // We'll initialize fToast after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fToast.init(context);
    });
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
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 1,
              ),
              const SizedBox(height: 16),
              Builder(
                builder: (BuildContext context) => InkWell(
                  onTap: () => Scaffold.of(context).showBottomSheet(
                    (context) => customBottomSheet(
                      commentController: commentController,
                      comment: (value) {
                        setState(() {
                          comment = value;
                        });
                      },
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFf8f9fd),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 16),
                        Icon(Icons.comment, color: Colors.black87),
                        SizedBox(width: 5),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          child: Text(
                            comment
                                ? '${commentController.text}'
                                : 'نوشتن نظر در باره این دکتر',
                            maxLines: 1, // Limit the number of lines
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
            width: MediaQuery.of(context).size.width,
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
            "کاربر گرامی ضمن آرزوی سلامتی برای شما ؛ لطفا امتیاز خود را نسبت به خدمات دکتر بهرام میرزایی ثبت کنیدس",
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
      width: MediaQuery.of(context).size.width,
      height: 120,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 48,
              glow: false,
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
          ),
          const SizedBox(height: 8),
          Text(
            _getRatingText(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getRatingText() {
    if (_rating >= 5) return 'خیلی عالی';
    if (_rating >= 4) return 'عالی';
    if (_rating >= 3) return 'خوب';
    if (_rating >= 2) return 'متوسط';
    return 'ضعیف';
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
                _buildDisSatisfactionTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisSatisfactionTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'از کدام موارد رضایت نداشته اید؟',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              physics:
                  NeverScrollableScrollPhysics(), // Add if inside SingleChildScrollView
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 5,
              // --- ADJUSTED: Smaller ratio makes items taller ---
              childAspectRatio:
                  2.6, // Experiment with values like 2.0, 2.5, 3.0
              shrinkWrap: true,
              children: _dissatisactionItems.entries.map((entry) {
                // --- REMOVED Restrictive SizedBox ---
                // No SizedBox needed here unless you want a *minimum* size
                return FittedBox(
                  fit: BoxFit.fitHeight,
                  child: FilterChip(
                    materialTapTargetSize:
                        MaterialTapTargetSize.padded, // Default size (48x48)
                    // --- REMOVED visualDensity ---
                    // visualDensity: VisualDensity.compact,
                    // --- ADJUSTED Padding ---
                    label: Text(
                      entry.key,
                      // --- ADJUSTED FontSize ---
                      style: TextStyle(fontSize: 12), // Increased font size
                    ),
                    selected: entry.value,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    selectedColor: Colors.blue.shade50,
                    checkmarkColor: const Color(0xFFDC3636),
                    onSelected: (bool selected) {
                      setState(() {
                        _dissatisactionItems[entry.key] = selected;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSatisfactionTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'از کدام موارد رضایت داشته اید؟',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 5,
              childAspectRatio: 2.6,
              shrinkWrap: true,
              children: _satisfactionItems.entries.map((entry) {
                return FittedBox(
                  fit: BoxFit.fitHeight,
                  child: FilterChip(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    label: Text(
                      entry.key,
                      style: TextStyle(fontSize: 12),
                    ),
                    selected: entry.value,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    selectedColor: Colors.blue.shade50,
                    checkmarkColor: Color(0xFF36CA5F),
                    onSelected: (bool selected) {
                      setState(() {
                        _satisfactionItems[entry.key] = selected;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
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
                  ? FittedBox(
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
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
    setState(() {
      _submitting = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _submitting = false;
      });

      fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.greenAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check),
              SizedBox(width: 12.0),
              Text("نظر شما با موفقیت ثبت شد"),
            ],
          ),
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );

      // Show success dialog
    });
  }
}

class customBottomSheet extends StatelessWidget {
  customBottomSheet({
    Key? key,
    required this.commentController,
    required this.comment,
  }) : super(key: key);

  final TextEditingController commentController;
  ValueChanged<bool> comment;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl, // For Persian language
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bottom sheet handle
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        commentController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'نوشتن نظر دربارهٔ این دکتر',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // For balance
                  ],
                ),
              ),

              // Comment input field
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0XFF353639), width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: commentController,
                    maxLines: 4,
                    maxLength: 512,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: 'نظر خود را بنویسید...',
                      hintStyle: TextStyle(
                        color: Color(0XFF353639),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),

              // Submit button
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    // Submit comment logic here
                    Navigator.of(context).pop(commentController.text);
                    comment(true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF0C6D95),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ثبت نظر',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
