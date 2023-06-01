import 'package:calendar_app/data%20source/local/local_data_source.dart';
import 'package:calendar_app/data%20source/remote/remote_data_source.dart';
import 'package:calendar_app/model/user.dart';


class UserRepository {
  LocalDataSource localSource;
  RemoteDataSource remoteSource;

  UserRepository({required this.localSource, required this.remoteSource});

  bool hasNetwork = false;

  bool addUser(User user) {
    bool isAdded = false;
    if (hasNetwork) {
      isAdded = remoteSource.addUser(user);
    } else {
      isAdded = localSource.addUser(user);
    }
    return isAdded;
  }

  List<User> getUsers() {
    if (hasNetwork) {
      return remoteSource.getUsers();
    } else {
      return localSource.getUsers();
    }
  }
}


