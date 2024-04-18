class Description {
  final String description;

  Description(this.description);

  factory Description.f(String trait) {
    switch (trait) {
      case 'artistic':
        return Description.artistic();
      case 'conventional':
        return Description.conventional();
      case 'enterprising':
        return Description.enterprising();
      case 'investigative':
        return Description.investigative();
      case 'realistic':
        return Description.realistic();
      case 'social':
        return Description.social();
      default:
        return Description("N/A");
    }
  }

  Description.artistic(
      {this.description =
          "Artistic individuals are creative, imaginative, and expressive. They enjoy using their creativity to produce original work in various mediums, including visual arts, music, literature, and design. Artistic types often find fulfillment in careers such as graphic design, writing, fine arts, music composition, and performing arts."});
  Description.conventional(
      {this.description =
          "Conventional individuals are organized, detail-oriented, and prefer structured and orderly environments. They enjoy tasks that involve following rules, working with data, and maintaining systems. They are often found in fields such as finance, accounting, administration, and computer programming."});
  Description.enterprising(
      {this.description =
          "Enterprising individuals are ambitious, persuasive, and enjoy taking on leadership roles. They are goal-oriented and enjoy tasks that involve persuasion, negotiation, and entrepreneurship. They are often found in fields such as sales, marketing, business, and management."});
  Description.investigative(
      {this.description =
          "Investigative individuals are analytical, curious, and enjoy intellectual challenges. They are interested in gathering and analyzing information, conducting experiments, and solving complex problems. They are often found in fields such as science, research, and technology."});
  Description.realistic(
      {this.description =
          "These are people who like well-ordered activities, or enjoy working with objects, tools, and machines.\n\nRealistic people:\n\n\u2022 See themselves as mechanically or athletically talented, but may not be good with people.\n\u2022 Value concrete and tangible things like money, power and status.\n\u2022 Avoid \"social\" activities, those that need interaction with other people.\n\nCommon traits:\n\nHard-headed, inflexible, persistent, materialistic, practical, and genuine."});
  Description.social(
      {this.description =
          "Social individuals are empathetic, caring, and enjoy helping and interacting with others. They prefer tasks that involve working with people, such as teaching, counseling, healthcare, and social services. They thrive in environments where they can collaborate and make a positive impact on others."});
}

String getDescription(String type) {
  return Description.f(type).description;
}
