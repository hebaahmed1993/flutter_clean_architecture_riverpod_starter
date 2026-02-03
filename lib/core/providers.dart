




import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'network/dio_client.dart';



final loggerProvider = Provider<Logger>((ref) => Logger());

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
