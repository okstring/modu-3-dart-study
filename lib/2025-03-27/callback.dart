
// 이 함수 안에서 비동기 코들르 순차적으로 실행 시킬 수 있다
void main() async {
  // print(fetchString());
  print('start');

  // fetchString().then((value) => print(value));
  // 비동기 코드가 실행이 됨
  String result = await fetchString();
  print(result);

  print('end');

  await fetchData('전체 데이터', (e) => print(e));
}

Future<String> fetchString() => Future.delayed(Duration(seconds: 3), () => '데이터');


Future<void> fetchData(String job, void Function(String) onSuccess) async {
  print('$job 가져오는 중');

  fetchWeather('날씨', (e) {
    print('날씨 $e');
  }).then((e) => print('날씨 완료'));

  fetchUnse('운세', (e) {
    print('운세 $e');
  }).then((e) => print('운세 완료'));

  onSuccess('20%');
  await Future.delayed(Duration(seconds: 1));
  onSuccess('60%');
  await Future.delayed(Duration(seconds: 1));
  onSuccess('80%');
  await Future.delayed(Duration(seconds: 1));
  onSuccess('100%');
}

Future<void> fetchWeather(String job, void Function(String) onSuccess) async {
  onSuccess('$job 정보 가져오는 중');

  // 2초 후에
  await Future.delayed(Duration(seconds: 2));

  onSuccess('$job 정보 완료');
}

Future<void> fetchUnse(String job, void Function(String) onSuccess) async {
  onSuccess('$job 정보 가져오는 중');

  // 1초 후에
  await Future.delayed(Duration(seconds: 1));

  onSuccess('$job 정보 완료');
}