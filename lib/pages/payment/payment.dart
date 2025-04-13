import 'package:flutter/material.dart';
import 'package:talentei/utils/global_profile.dart';
import 'package:talentei/utils/golobal_appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool internetPayment = true;
  bool cardToCard = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl, // Right-to-left for Persian
              child: Container(
                color: const Color(0xFFF8F8F8),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // App Bar

                      const Text(
                        'پرداخت',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Color(0xFF0B0C17),
                            fontWeight: FontWeight.w400,
                            height: 24 / 20,
                            letterSpacing: 0,
                            fontSize: 20),
                      ),

                      const SizedBox(height: 24),

                      // Discount code section
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  hintText:
                                      'کد تخفیف خود را در این قسمت وارد کنید',
                                  hintStyle: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9D9EA2),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'اعمال کد',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 22 / 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Payment method section
                      const Text(
                        'روش پرداخت',
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Color(0xFF0B0C17),
                            fontWeight: FontWeight.bold,
                            height: 20 / 14,
                            letterSpacing: 0,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Internet payment option
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: internetPayment,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      internetPayment = true;
                                      cardToCard = false;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                const Text('پرداخت اینترنتی'),
                              ],
                            ),
                            // Card to card option
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: cardToCard,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      internetPayment = false;
                                      cardToCard = true;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                const Text('کارت به کارت'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Payment gateway section
                      const Text(
                        'درگاه پرداخت',
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Color(0xFF0B0C17),
                            fontWeight: FontWeight.bold,
                            height: 20 / 14,
                            letterSpacing: 0,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Bank icons
                            paymentGatewayItem(
                                'سامان', 'assets/images/saman_bank.png'),
                            paymentGatewayItem(
                                'ملت', 'assets/images/melat_bank.png'),
                            paymentGatewayItem('گردشگری',
                                'assets/images/gardeshgari_bank.png'),
                            paymentGatewayItem(
                                'آینده', 'assets/images/ayandeh_bank.png'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Payment details section
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.9,
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              const Center(
                                child: Text(
                                  'پرداخت هزینه دفترچه شخصیت شناسی',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Subtitle
                              const Center(
                                child: Text(
                                  'دریافت دفترچه شخصیت شناسی به همراه نظر اختصاصی مشاور',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Payment details
                              const Text(
                                'جزئیات پرداخت',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              const SizedBox(height: 12),

                              // Price row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'قیمت کالا',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '۱۵۰,۰۰۰ تومان',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Discount row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'تخفیف',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '۲۰,۰۰۰ تومان',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 8),

                              // Total row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'مبلغ قابل پرداخت',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '۱۳۰,۰۰۰ تومان',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Payment button
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'پرداخت',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentGatewayItem(String name, String imagePath) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
