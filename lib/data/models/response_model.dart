class ResponseModel {
  final int code;
  final String status;
  final String message;
  final dynamic data;

  ResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
