import 'package:flutter/material.dart';
import '../../presentation/components/asset_widgets.dart';

class QuestionSet1 extends StatelessWidget {
  const QuestionSet1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question: 'Do you enjoy working with your hands and physical tasks?',
        ),
        QuizPrefBar(
          question:
              'Are you curious about how things work and enjoy solving complex problems?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy expressing yourself through creative activities such as drawing, writing, or performing arts?',
        ),
        QuizPrefBar(
          question:
              'Are you naturally inclined towards leadership roles and enjoy taking charge?',
        ),
        QuizPrefBar(
          question: 'Do you prefer well-organized and structured environments?',
        ),
      ],
    );
  }
}

class QuestionSet2 extends StatelessWidget {
  const QuestionSet2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question: 'Do you enjoy helping and interacting with people?',
        ),
        QuizPrefBar(
          question:
              'Are you interested in activities such as building, fixing, or assembling things?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy analyzing data, conducting experiments, or doing research?',
        ),
        QuizPrefBar(
          question:
              'Are you attracted to unique and unconventional ideas or approaches?',
        ),
        QuizPrefBar(
          question: 'Do you enjoy persuading, influencing, or managing others?',
        ),
      ],
    );
  }
}

class QuestionSet3 extends StatelessWidget {
  const QuestionSet3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question:
              'Are you detail-oriented and enjoy working with numbers and data?',
        ),
        QuizPrefBar(
          question:
              'Are you a good communicator and enjoy building relationships?',
        ),
        QuizPrefBar(
          question:
              'Do you prefer practical, concrete problems over abstract or theoretical ones?',
        ),
        QuizPrefBar(
          question:
              'Are you comfortable with abstract ideas and theoretical concepts?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy exploring your imagination and finding new ways to express your thoughts?',
        ),
      ],
    );
  }
}

class QuestionSet4 extends StatelessWidget {
  const QuestionSet4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question:
              'Are you motivated by the idea of achieving goals and financial success?',
        ),
        QuizPrefBar(
          question:
              'Do you find satisfaction in following established procedures and guidelines?',
        ),
        QuizPrefBar(
          question:
              'Do you often find yourself in situations where you are helping others or providing support?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy outdoor activities and being in a dynamic environment?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy learning new things and exploring topics in depth?',
        ),
      ],
    );
  }
}

class QuestionSet5 extends StatelessWidget {
  const QuestionSet5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question:
              'Are you interested in careers that involve creativity and artistic expression?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy sales, marketing, or entrepreneurial activities?',
        ),
        QuizPrefBar(
          question:
              'Are you drawn to careers that involve organizational and administrative tasks?',
        ),
        QuizPrefBar(
          question:
              'Are you interested in careers that involve working with people, such as teaching or counseling?',
        ),
        QuizPrefBar(
          question:
              'Are you drawn to careers that involve machinery, tools, or equipment?',
        ),
      ],
    );
  }
}

class QuestionSet6 extends StatelessWidget {
  const QuestionSet6({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizPrefBar(
          question:
              'Are you naturally inclined towards careers in science, technology, engineering, or mathematics?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy working in an environment that allows for personal expression and originality?',
        ),
        QuizPrefBar(
          question:
              'Are you drawn to careers that involve risk-taking and decision-making?',
        ),
        QuizPrefBar(
          question:
              'Do you enjoy working with information, records, or financial data?',
        ),
        QuizPrefBar(
          question: 'Do you value teamwork and collaboration in your work?',
        ),
      ],
    );
  }
}
