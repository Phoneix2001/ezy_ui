import 'package:uuid/uuid.dart';

String get generateUniqueId {
  return const Uuid().v4();
}