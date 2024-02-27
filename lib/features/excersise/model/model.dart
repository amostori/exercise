class Model {
  final String patient;
  final String title;
  final String descript;

  const Model({
    required this.patient,
    required this.title,
    required this.descript,
  });

  Model copyWith({
    String? title,
    String? descript,
    String? patient,
  }) {
    return Model(
      patient: patient ?? this.patient,
      title: title ?? this.title,
      descript: descript ?? this.descript,
    );
  }
}
