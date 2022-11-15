class Product{
  int id;
  String name;
  String? description;
  String url;
  Product({
    required this.id,
    required this.name,
    this.description,
    required this.url
  });
}