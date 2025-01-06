
class Addon{
  num id;
  String name;
  double price;
  double priceWithVat;
  String imageUrl;
  num categoryId;
  Addon({
    required this.id,
    required this.name,
    required this.price,
    required this.priceWithVat,
    required this.imageUrl,
    required this.categoryId,
  });

  // factory Addon.fromNetworkData(AddonsData data) {
  //   bool isArabic = MainAppBloc.instance.isArabic;
  //   return Addon(
  //     id: data.id??0,
  //     name: (isArabic? data.nameAr:data.nameEn)??"no name",
  //     price: double.parse(data.price??"0"),
  //     priceWithVat: double.parse(data.priceWithVat??"0"),
  //     imageUrl: data.image??"no image",
  //     categoryId: data.category??0,
  //   );
  // }
}