class SplashController {
  Future<void> waitForSplash() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
