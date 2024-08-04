abstract class ApiService{
  String fetchData(String query);
}

class RealApiService implements ApiService{
  @override
  String fetchData(String query){
    print('Fetching data: $query');
    return 'Data for: $query';
  }
}

class ProxyApiService implements ApiService{
  final RealApiService realApiService;
  final Map<String, String> cashe = {};

  ProxyApiService(this.realApiService);

  @override
  String fetchData(String query) {
    if(!cashe.containsKey(query)){
      cashe[query] = realApiService.fetchData(query);
    }else{
      print('Returning data from cashe: $query');
    }
    return cashe[query]!;
  }
  
}

void main(){
  ApiService apiService = ProxyApiService(RealApiService());

  apiService.fetchData('Test query');
  apiService.fetchData('Test query');
  apiService.fetchData('Test query');

  /*Data data1 = ProxyData(password: 'test', realData: RealData('Confidential data'));
  Data data2 = ProxyData(password: 'tet', realData: RealData('Confidential data'));
  data1.operation();
  data2.operation();*/
} 

/*abstract class Data{
  void operation();
}

class RealData implements Data{
  final String data;

  RealData(this.data);

  @override
  void operation() {
    print('Your data: $data');
  }
}

class ProxyData implements Data{
  final String password;
  final RealData realData;

  ProxyData({required this.password, required this.realData});

  @override
  void operation() {
    if(authenticate(password)){
      realData.operation();
    } else{
      print('Sorry, access denied');
    }
  }

  bool authenticate(String password){
    return password == 'test';
  }
  
}*/