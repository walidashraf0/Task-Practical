class Item {
  double price;
  String imgpath;
  String location;
  String name;

  Item(
      {required this.imgpath,
      required this.price,
      this.location = "Main branch",
      required this.name});
}

List<Item> items = [
  Item(
      name: "product 1",
      imgpath:
          "https://wuilt-assets-v2-dev.s3.amazonaws.com/clwwdxss30ox601gict6h2785_33.png",
      price: 14.5,
      location: "Yasmine Shop"),
  Item(
      name: "product 2",
      imgpath: "https://www.mashtalegypt.com/media/chicle.jpg",
      price: 12.5,
      location: "Hussien Shop"),
  Item(
      name: "product 3",
      imgpath:
          "https://wuilt-assets-v2-dev.s3.amazonaws.com/clwwe219o0oxl01gi9uedbhp8_27.png",
      price: 10.99,
      location: "Flower shop"),
  Item(
    name: "product 4",
    imgpath:
        "https://wuilt-assets-v2-dev.s3.amazonaws.com/clwwe1ygm0oxj01gidbw09gl7_18.png",
    price: 11.2,
  ),
  Item(
      name: "product 5",
      imgpath:
          "https://cdn.salla.sa/dWGWy/XZTmmaVMjye7Qg7UY4PRes8vRhVGvhNVqrI3FBTU.jpg",
      price: 17.8,
      location: "Mohammed shop"),
  Item(
      name: "product 6",
      imgpath:
          "https://cdn.salla.sa/KQqNG/H7pPFcYxxYFQycds2cjYyNCnOyC9eIBHH5mjNIiz.png",
      price: 7.8,
      location: "Ahmed Shop"),
  Item(
    name: "product 7",
    imgpath:
        "https://cfcdn1site925-fc.aswaqna.online/wp-content/uploads/2024/08/clwwdxppz0ox401gic6k7fjtw-34.png",
    price: 33.7,
  ),
  Item(
    name: "product 8",
    imgpath:
        "https://s.alicdn.com/@sc04/kf/H5872e56cf51e4c6885c5df93e719dd90O.jpg_720x720q50.jpg",
    price: 19.8,
  )
];
