import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final List<Map<String, String>> _faqs = [
    {
      'question': "Quais são os métodos de kfne aceitos?",
      'answer':
          "Nosso objetivo é garantir a sua satisfação. Se você não estiver satisfeito com o nosso produto, aceitamos solicitações de reembolso até 30 dias após a compra. Entre em contato com o nosso suporte ao cliente."
    },
    {
      'question': "Quais são os métodos de dso aceitos?",
      'answer':
          "Nosso objetivo é garantir a sua satisfação. Se você não estiver satisfeito com o nosso produto, aceitamos solicitações de reembolso até 30 dias após a compra. Entre em contato com o nosso suporte ao cliente."
    },
  ];

  late List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List.generate(_faqs.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppbarwhiteWidget(text: "FAQ's"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(AppImages.homeBg),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _faqs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _expanded[index] = !_expanded[index];
                        });
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            left: const BorderSide(
                              width: 2,
                              color: Color(0xFF3EC67B),
                            ),
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _faqs[index]['question']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              _expanded[index]
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// ANSWER CONTAINER
                    if (_expanded[index])
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        color: Colors.grey.withOpacity(0.1),
                        child: Text(
                          _faqs[index]['answer']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
