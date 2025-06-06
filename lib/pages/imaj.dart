import 'dart:math'; // Imported for the Random class

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talentei/cubit/image_cubit.dart';
import 'package:talentei/cubit/image_state.dart';
import 'package:talentei/services/bootomsheets.dart';

class ImajPage extends StatefulWidget {
  const ImajPage({super.key});

  @override
  State<ImajPage> createState() => _ImajPageState();
}

class _ImajPageState extends State<ImajPage> {
  final TextEditingController _textController = TextEditingController();
  bool expanded = false;
  final TextEditingController _tController = TextEditingController();

  // List of random Persian prompts for the lightbulb icon
  final List<String> _persianPrompts = [
    "یک فضانورد در حال قدم زدن در یک جنگل بیگانه با گیاهان درخشان و موجودات عجیب و غریب",
    "یک شهر شناور در آسمان با معماری به سبک ایرانی و آبشارهای روان",
    "گربه ای با لباس فضانوردی در حال نگاه کردن به زمین از پنجره یک سفینه فضایی",
    "منظره‌ای سورئال از یک کویر که در آن ساعت‌ها در حال ذوب شدن هستند، به سبک سالوادور دالی",
    "یک کتابخانه قدیمی و جادویی با کتاب‌هایی که در هوا پرواز می‌کنند و نور ملایمی از آن‌ها ساطع می‌شود",
    "پرتره یک زن با موهای ساخته شده از کهکشان و ستارگان، سبک هنری دیجیتال",
    "یک ربات در حال نقاشی کردن یک منظره غروب آفتاب در یک کلبه کوهستانی",
    "بازار سنتی ایرانی در یک دنیای سایبرپانک با نورهای نئونی و تکنولوژی پیشرفته",
    "یک اژدهای کریستالی که بر روی قله یک کوه یخی نشسته است",
    "جنگلی انبوه در شب که مسیر آن با قارچ‌های بیولومینسنت روشن شده است",
    "یک ماشین پرنده کلاسیک در حال پرواز بر فراز شهر تهران در سال ۲۰۷۷",
    "دختری در حال نواختن ویولن در میان یک مزرعه گل آفتابگردان در هنگام طلوع خورشید",
  ];

  final Random _random = Random();
  String? _currentPrompt;

  @override
  void dispose() {
    _textController.dispose();
    _tController.dispose(); // Fixed memory leak
    super.dispose();
  }

  // Function to select a random prompt and update the TextField
  void _showRandomPrompt() {
    setState(() {
      String newPrompt;
      // This loop ensures the new prompt is different from the current one
      do {
        newPrompt = _persianPrompts[_random.nextInt(_persianPrompts.length)];
      } while (_persianPrompts.length > 1 && newPrompt == _currentPrompt);

      _currentPrompt = newPrompt;
      _textController.text = _currentPrompt!;
    });
  }

  bool expand = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xFF070707),
            appBar: AppBar(
              title: const Text('ایماژ'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: const Color(0xFF070707),
            ),
            body: BlocBuilder<ImageCubit, ImageState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: IntrinsicHeight(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: const Color(0xFFabc6e0),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),

                              // SYNTAX FIX: 'child' is a property of Container, not BoxDecoration
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Main content area - Text Field
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: TextField(
                                        controller: _textController,
                                        buildCounter: (
                                          context, {
                                          required currentLength,
                                          required isFocused,
                                          required maxLength,
                                        }) {
                                          return Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '$currentLength / $maxLength',
                                              style: TextStyle(
                                                fontFamily: 'BBC',
                                                color: isFocused
                                                    ? Color(0xFFabc6e0)
                                                    : Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          );
                                        },
                                        maxLines: 2,
                                        expands: false,
                                        maxLength: 500,
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Arial',
                                        ),
                                        decoration: InputDecoration(
                                          hintText:
                                              'تصویر مذکور خود را توصیف کنید...',
                                          hintStyle: TextStyle(
                                            color: Color(0xFFabc6e0),
                                            fontSize: 16,
                                          ),
                                          border: InputBorder.none,
                                          counterText: '',
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                        onChanged: (text) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),

                                  // Bottom icons section
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${_textController.text.length}/500',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        // Gallery icon
                                        GestureDetector(
                                          onTap: () async {
                                            // Your image picker logic here
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              color: Color(0xFFabc6e0),
                                              size: 24,
                                            ),
                                          ),
                                        ),

                                        // Lightbulb icon
                                        GestureDetector(
                                          onTap: _showRandomPrompt,
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.lightbulb_outline,
                                              color: Color(0xFFabc6e0),
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'سبک تصویر',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 5),
                                      ),
                                      shape: MaterialStateProperty.resolveWith(
                                        (states) => RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                      ),
                                      iconColor:
                                          MaterialStateProperty.resolveWith(
                                        (states) => const Color(0xFF96b1cd),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                        (states) => const Color(0xFF081926),
                                      ),
                                    ),
                                    onPressed: () {
                                      final imageCubit =
                                          BlocProvider.of<ImageCubit>(context);
                                      BottomSheets.imageBottomSheet(
                                          context, imageCubit);
                                    },
                                    child: const Center(
                                      child: Row(
                                        children: [
                                          Text(
                                            'مشاهده همه',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF96b1cd),
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: BlocProvider.of<ImageCubit>(context)
                                    .state
                                    .imageStyle
                                    .length,
                                itemBuilder: (context, index) => Container(
                                  width: 90,
                                  height: 100,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 35, 35, 37),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 60,
                                            height: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.asset(
                                                BlocProvider.of<ImageCubit>(
                                                        context)
                                                    .state
                                                    .imageStyle[index]
                                                    .link,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            child: Text(
                                              BlocProvider.of<ImageCubit>(
                                                      context)
                                                  .state
                                                  .imageStyle[index]
                                                  .label,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
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
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expanded = !expanded;
                                  });
                                },
                                child: Row(
                                  children: [
                                    AnimatedRotation(
                                      turns: expanded ? 0.5 : 0,
                                      duration:
                                          const Duration(milliseconds: 250),
                                      child: const Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: Color(0xFF96b1cd),
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      'خصوصیات تصویر',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                        ),
                                        shape:
                                            MaterialStateProperty.resolveWith(
                                          (states) => RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                        ),
                                        iconColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) => const Color(0xFF96b1cd),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) => const Color(0xFF081926),
                                        ),
                                      ),
                                      onPressed: () {
                                        final imageCubit =
                                            BlocProvider.of<ImageCubit>(
                                                context);
                                        BottomSheets.catBottomSheet(
                                            context, imageCubit);
                                      },
                                      child: const Center(
                                        child: Row(
                                          children: [
                                            Icon(Icons.add),
                                            SizedBox(width: 3),
                                            Text(
                                              'افزودن',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF96b1cd),
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
                            const SizedBox(height: 10),
                            BlocBuilder<ImageCubit, ImageState>(
                              builder: (context, state) {
                                return SingleChildScrollView(
                                  padding: const EdgeInsets.all(12),
                                  child: AnimatedSize(
                                    alignment: Alignment.topCenter,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    child: expanded
                                        ? Wrap(
                                            alignment: WrapAlignment.center,
                                            spacing: 8,
                                            runSpacing: 8,
                                            children:
                                                BlocProvider.of<ImageCubit>(
                                                        context)
                                                    .showList
                                                    .map((chip) {
                                              return Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: FilterChip(
                                                  label: Text(
                                                    chip.label,
                                                    style: TextStyle(
                                                      color: chip.isSelected
                                                          ? Colors.white
                                                          : Colors.white70,
                                                    ),
                                                  ),
                                                  selected: chip.isSelected,
                                                  onSelected: (value) {},
                                                  backgroundColor:
                                                      const Color(0xFF1E1E1E),
                                                  selectedColor:
                                                      const Color(0xFF0C4C8A),
                                                  checkmarkColor: Colors.white,
                                                  showCheckmark: false,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        expand = !expand;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        AnimatedRotation(
                                          turns: expand
                                              ? 0.25
                                              : 0, // Adjusted for better visual effect
                                          duration:
                                              const Duration(milliseconds: 250),
                                          child: const Icon(
                                            Icons.arrow_right,
                                            color: Color(0xFF96b1cd),
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        const Text(
                                          'کلمات سلبی',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        const Icon(Icons.info_outline,
                                            color: Colors.amberAccent),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                  AnimatedSize(
                                    alignment: Alignment.topCenter,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    child: expand
                                        ? Container(
                                            width: double.infinity,
                                            margin: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              border: Border.all(
                                                color: const Color(0xFFabc6e0),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: TextField(
                                                      controller: _tController,
                                                      maxLines: 2,
                                                      maxLength: 300,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily: 'Arial',
                                                      ),
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            'کلماتی که نمیخواهید در تصویر باشند...',
                                                        hintStyle: TextStyle(
                                                          color:
                                                              Color(0xFFabc6e0),
                                                          fontSize: 16,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        counterText: '',
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                      ),
                                                      onChanged: (text) {
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(), // Takes up remaining space
                            ),
                            Container(
                              margin: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                  color: Colors
                                      .blueAccent, // A more actionable color
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width,
                              height: 50, // A more standard button height
                              child: const Center(
                                child: Text(
                                  'تولید تصویر',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
