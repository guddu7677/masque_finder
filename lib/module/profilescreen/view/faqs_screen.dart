import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  List<bool> _expanded = [false, false];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarwhiteWidget(text: "FAQ's"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            const SizedBox(height: 16),

            ...List.generate(_faqs.length, (index) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              width: 2, color: const Color(0xFF3EC67B)),
                          bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.withOpacity(0.3)), 
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _faqs[index]['question']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Icon(_expanded[index]
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  if (_expanded[index])
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      color: Colors.grey.withOpacity(0.1),
                      child: Text(
                        _faqs[index]['answer']!,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
