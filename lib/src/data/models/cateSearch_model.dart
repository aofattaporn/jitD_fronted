import 'dart:convert';

class ListCateSearch{
  List<CateSearchModel> cateSearch = [];

  ListCateSearch();

  ListCateSearch.fromJson(List<dynamic>json){
    for(var element in json){
      cateSearch.add(CateSearchModel.fromJson(element));
    }
    cateSearch.sort((a, b) => (b.count!).compareTo(a.count!));
  }
}

CateSearchModel cateSearchModel(String str) => CateSearchModel.fromJson(json.decode(str));

class CateSearchModel{
  List<String>? catName;
  int? count;

  CateSearchModel.GetData(this.catName, this.count);
  CateSearchModel.Response(this.catName, this.count);
  CateSearchModel.Resquest(this.catName, this.count);

  CateSearchModel.fromJson(Map<String, dynamic> json){
    catName = json['catName'];
    count = json['count'];
  }
}

