class ProductModel {
  int prodId;
  String image;
  String title;
  String shortDesc;
  List<String> madeWith;
  int size;
  String description;
  num price;
  double rate;

  ProductModel(this.prodId, this.image, this.title, this.shortDesc, this.madeWith, this.size,
      this.description, this.price, this.rate);
}