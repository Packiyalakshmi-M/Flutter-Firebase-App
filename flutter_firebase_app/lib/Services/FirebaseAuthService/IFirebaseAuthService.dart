abstract class IFirebaseAuthService {
  Future<bool> createUser({required String email, required String password});
  Future<bool> loginUser({required String email, required String password});
  Future<bool> logoutUser();
}
