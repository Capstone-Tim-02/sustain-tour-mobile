// class FaqListModel {
//   List<FaqModel>? data;

//   FaqListModel({

//   })
// }

class FaqModel {
  final String tittle;
  final String detail;
  final String link;
  final String additional;

  FaqModel({
    required this.tittle,
    required this.detail,
    required this.link,
    required this.additional,
  });
}
