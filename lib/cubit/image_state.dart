import 'package:flutter/foundation.dart';
import 'package:talentei/models/filterchip_model.dart';
import 'package:talentei/models/image_style_model.dart';

@immutable
sealed class ImageState {}

class ImageInitialState extends ImageState {
  final List<FilterChipModel> weather;
  final List<FilterChipModel> lightAngle;
  final List<FilterChipModel> color;
  final List<FilterChipModel> painter;
  final List<ImageStyleModel> imageStyle;

  ImageInitialState({
    required this.weather,
    required this.lightAngle,
    required this.color,
    required this.painter,
    required this.imageStyle,
  });

  factory ImageInitialState.defaultState() {
    return ImageInitialState(
      weather: [
        FilterChipModel(label: 'آفتابی'),
        FilterChipModel(label: 'مه آلود'),
        FilterChipModel(label: 'بارانی'),
        FilterChipModel(label: 'برفی'),
        FilterChipModel(label: 'رویایی'),
        FilterChipModel(label: 'طوفانی'),
        FilterChipModel(label: 'پر انرژی '),
        FilterChipModel(label: 'آینده گرا'),
        FilterChipModel(label: 'ترسناک'),
        FilterChipModel(label: 'نوستالژیک'),
        FilterChipModel(label: 'جادویی'),
      ],
      lightAngle: [
        FilterChipModel(label: 'نمای بسته'),
        FilterChipModel(label: 'نمای متوسط'),
        FilterChipModel(label: 'نمای باز'),
        FilterChipModel(label: 'نمای پایین'),
        FilterChipModel(label: 'نمای بالا'),
        FilterChipModel(label: 'نور خورشید'),
        FilterChipModel(label: 'نور زمینه '),
        FilterChipModel(label: 'پرتو نور'),
        FilterChipModel(label: 'متقارن'),
        FilterChipModel(label: 'Full HD'),
        FilterChipModel(label: '4K'),
      ],
      color: [
        FilterChipModel(label: 'آبی'),
        FilterChipModel(label: 'زرد'),
        FilterChipModel(label: 'قرمز'),
        FilterChipModel(label: 'سبز'),
        FilterChipModel(label: 'طلایی'),
        FilterChipModel(label: 'مسی'),
        FilterChipModel(label: 'نئون '),
        FilterChipModel(label: 'نارنجی'),
        FilterChipModel(label: 'سفید'),
        FilterChipModel(label: 'مشکی'),
        FilterChipModel(label: 'طوسی'),
        FilterChipModel(label: 'رزگلد'),
        FilterChipModel(label: 'خاکستری'),
        FilterChipModel(label: 'بنقش'),
      ],
      painter: [
        FilterChipModel(label: 'ونسان ونگوک'),
        FilterChipModel(label: 'لئونید آفرموف'),
        FilterChipModel(label: 'کلود مونه'),
        FilterChipModel(label: 'توماس موران'),
        FilterChipModel(label: 'فلیپ کخ'),
        FilterChipModel(label: 'ارین هانسون'),
        FilterChipModel(label: 'پابلو پیکاسو '),
        FilterChipModel(label: 'انسل آدامز'),
        FilterChipModel(label: 'اندی وارهول'),
        FilterChipModel(label: 'اوتاگاوا هیروشیگه'),
        FilterChipModel(label: 'ژوزفین وال'),
        FilterChipModel(label: 'رزگلد'),
        FilterChipModel(label: 'خاکستری'),
        FilterChipModel(label: 'بنقش'),
      ],
      imageStyle: [
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'تصادفی'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'واقعی'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'انیمه'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'کمیک'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'سیاه قلم'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'خمیری'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'کاغذی '),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'مینیمال'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'تصادفی'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'آبرنگ'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'پیکسلی'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'لوپلی'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'دیجیتال آرت'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: 'فانتزی'),
        ImageStyleModel(link: 'assets/images/boy.jpg', label: '3 بعدی'),
      ],
    );
  }

  ImageInitialState copyWith({
    List<FilterChipModel>? weather,
    List<FilterChipModel>? lightAngle,
    List<FilterChipModel>? color,
    List<FilterChipModel>? painter,
    List<ImageStyleModel>? imageStyle,
  }) {
    return ImageInitialState(
      weather: weather ?? this.weather,
      lightAngle: lightAngle ?? this.lightAngle,
      color: color ?? this.color,
      painter: painter ?? this.painter,
      imageStyle: imageStyle ?? this.imageStyle,
    );
  }
}

class ImageSelected extends ImageState {
  final String imagePath;
  ImageSelected(this.imagePath);
}
