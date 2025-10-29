class LanguageModel {
  final String code;
  final String name;
  final String greeting;

  LanguageModel({
    required this.code,
    required this.name,
    required this.greeting,
  });

  factory LanguageModel.fromMap(Map<String, String> map) {
    return LanguageModel(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      greeting: map['greeting'] ?? '',
    );
  }

  static List<LanguageModel> getLanguages() {
    return [
      LanguageModel(code: 'en', name: 'English', greeting: 'Hi'),
      LanguageModel(code: 'hi', name: 'Hindi', greeting: 'नमस्ते'),
      LanguageModel(code: 'bn', name: 'Bengali', greeting: 'হ্যালো'),
      LanguageModel(code: 'kn', name: 'Kannada', greeting: 'ನಮಸ್ಕಾರ'),
      LanguageModel(code: 'pa', name: 'Punjabi', greeting: 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'),
      LanguageModel(code: 'ta', name: 'Tamil', greeting: 'வணக்கம்'),
      LanguageModel(code: 'te', name: 'Telugu', greeting: 'హలో'),
      LanguageModel(code: 'fr', name: 'French', greeting: 'Bonjour'),
      LanguageModel(code: 'es', name: 'Spanish', greeting: 'Hola'),
    ];
  }
}
