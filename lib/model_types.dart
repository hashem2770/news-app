class ModelTypes {
  String title;
  String image;

  ModelTypes({this.title, this.image});

  static List<ModelTypes> samples = [
    ModelTypes(title: 'Business', image: 'images/business.jpg'),
    ModelTypes(title: 'Entertainment', image: 'images/enter.jpg'),
    ModelTypes(title: 'Health', image: 'images/health.jpg'),
    ModelTypes(title: 'Science', image: 'images/sci.jpg'),
    ModelTypes(title: 'Sports', image: 'images/spoerts.jpg'),
    ModelTypes(title: 'Tech', image: 'images/tech.jpg'),
  ];
}
