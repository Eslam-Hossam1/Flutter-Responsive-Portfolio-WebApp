import 'package:flutter/material.dart';
import 'package:flutter_portfolio/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Knowledge',
            style:
                TextStyle(color: Colors.white, fontSize: 14.sp.fontClamper(14)),
          ),
        ),
        const KnowledgeText(knowledge: 'SOLID Principles'),
        const KnowledgeText(knowledge: 'Architecture & Design Patterns'),
        const KnowledgeText(knowledge: 'System Design & Analysis'),
        const KnowledgeText(knowledge: 'Clean Code'),
      ],
    );
  }
}
