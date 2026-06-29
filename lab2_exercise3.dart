void main() {
  List<String> subjects = ['Math', 'Python', 'Bio'];
  print('number of subject: ${subjects.length}');
  print('First subject: ${subjects[0]}');
  print('Last subject: {subjects[subjects.length - 1]}');

  subjects.add('English');
  print('Update subject: $subjects');

  print('-----');

  Map<String, int> studentScores = {'Math': 85, 'Python': 79};
  print('Scores for Python: ${studentScores['Python']}');
  studentScores['Bio'] = 92;
  print('Updated scores: $studentScores');
  print('All subjects in map: ${studentScores.keys}');
  print('All scores in map: ${studentScores.values}');
}