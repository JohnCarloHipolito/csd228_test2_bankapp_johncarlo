import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final List<Map<String, String>> faqs = const [
    {
      'question': 'How do I withdraw money?',
      'answer': 'To withdraw money, go to the nearest ATM or visit your bank branch.'
    },
    {
      'question': 'How do I deposit money?',
      'answer': 'To deposit money, use the deposit feature in the mobile app or visit your bank branch.'
    },
    {
      'question': 'How do I transfer money?',
      'answer': 'To transfer money, use the transfer feature in the mobile app or online banking.'
    },
    {
      'question': 'How do I change my password?',
      'answer': 'To change your password, go to the settings in the mobile app or online banking.'
    },
    {
      'question': 'How do I temporarily lock my account?',
      'answer': 'To temporarily lock your account, contact customer support immediately.'
    },
    {
      'question': 'How do I report fraud?',
      'answer': 'To report fraud, contact customer support immediately and provide all necessary details.'
    },
    {
      'question': 'What should I do if I lose my card?',
      'answer': 'If you lose your card, report it immediately through the mobile app or by calling customer support.'
    },
    {
      'question': 'How do I update my contact information?',
      'answer': 'To update your contact information, go to the settings in the mobile app or online banking.'
    },
    {
      'question': 'How do I check my account balance?',
      'answer': 'To check your account balance, use the mobile app, online banking, or visit an ATM.'
    },
    {
      'question': 'How do I set up direct deposit?',
      'answer': 'To set up direct deposit, provide your employer with your account number and routing number.'
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          title: SvgPicture.asset(
            'assets/images/logo.svg',
          ),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            child: ExpansionTile(
              key: Key(index.toString()),
              title: Text(faq['question']!),
              initiallyExpanded: _expandedIndex == index,
              onExpansionChanged: (expanded) {
                setState(() {
                  _expandedIndex = expanded ? index : null;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(faq['answer']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}