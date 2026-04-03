import 'package:flutter/material.dart';
import 'package:gigchill/controllers/question_controller.dart';
import 'package:gigchill/models/question_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final controller = QuestionController();

  static const Color _primaryGreen = Color(0xFF2EB97C);
  static const Color _primaryRed = Color.fromARGB(255, 239, 68, 68);
  static const Color _backgroundColor = Color(0xFFF0F4F0);
  static const Color _cardColor = Colors.white;
  static const Color _textDark = Color(0xFF1A2E1A);
  static const Color _textMuted = Color(0xFF6B7B6B);

  @override
  Widget build(BuildContext context) {
    final question = controller.currentQuestion;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Progress
              Text(
                "Question ${controller.currentIndex + 1}/${controller.questions.length}",
                style: const TextStyle(
                  color: _textMuted,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 Title
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: question.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: _textDark,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: question.highlight,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: _primaryGreen,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              /// 🔹 Options
              Expanded(
                child: ListView.separated(
                  itemCount: question.options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final option = question.options[index];
                    final isSelected =
                        question.selectedValue == option.value;

                    return _OptionCard(
                      label: option.label,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          controller.selectOption(option.value);
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 Buttons
              Row(
                children: [
                  /// Back
                  if (controller.currentIndex > 0)
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              controller.previousQuestion();
                            });
                          },
                        
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primaryRed,
                            disabledBackgroundColor:
                                _primaryRed.withOpacity(0.4),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text("Back",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                        ),
                      ),
                    ),

                  if (controller.currentIndex > 0)
                    const SizedBox(width: 12),

                  /// Continue
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: question.selectedValue != null
                            ? () {
                                setState(() {
                                  controller.nextQuestion();
                                });
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryGreen,
                          disabledBackgroundColor:
                              _primaryGreen.withOpacity(0.4),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          controller.currentIndex ==
                                  controller.questions.length - 1
                              ? "Finish"
                              : "Continue",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= OPTION CARD =================
class _OptionCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  static const Color _primaryGreen = Color(0xFF2EB97C);
  static const Color _cardColor = Colors.white;
  static const Color _textDark = Color(0xFF1A2E1A);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? _primaryGreen : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? _primaryGreen.withOpacity(0.08)
                  : Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            /// Radio
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? _primaryGreen
                      : const Color(0xFFCDD8CD),
                  width: 2,
                ),
                color: isSelected ? _primaryGreen : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),

            const SizedBox(width: 14),

            /// Label
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? _primaryGreen : _textDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}