enum FunctionType {
  fetchPosts,
}

class AppException implements Exception {
  final String message;
  final int? statusCode;
  final String? details;
  final FunctionType? function;

  AppException(
      this.message, [
        this.details,
        this.function,
        this.statusCode,
      ]);
}

AppException handleErrorByStatusCode(
    int? statusCode, {
      FunctionType? function,
      dynamic serverMessage,
    }) {
  String message = "حدث خطأ";

  final formattedDetails = serverMessage is List
      ? serverMessage.join('\n')
      : serverMessage?.toString();

  switch (function) {
    case FunctionType.fetchPosts:
      if (statusCode == null) {
        message = "تحقق من اتصال الإنترنت";
      } else if (statusCode == 404) {
        message = "لم يتم العثور على البيانات";
      } else if (statusCode == 500) {
        message = "حدث خطأ في الخادم";
      } else {
        message = "تعذر جلب البيانات";
      }
      return AppException(
        message,
        formattedDetails,
        function,
        statusCode,
      );
    default:
      break;
  }

  switch (statusCode) {
    case 400:
      message = "طلب غير صالح";
      break;
    case 401:
      message = "غير مصرح";
      break;
    case 404:
      message = "غير موجود";
      break;
    case 500:
      message = "مشكلة في الخادم";
      break;
    default:
      message = "خطأ غير متوقع";
  }

  return AppException(message, formattedDetails, function, statusCode);
}
