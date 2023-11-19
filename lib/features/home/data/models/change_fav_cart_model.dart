class ChangeFavCartModel{
  bool? status;
  String? message;

  ChangeFavCartModel.fromJson(Map<String,dynamic> json)
  {
    status =json['status'];
    message =json['message'];
  }

}