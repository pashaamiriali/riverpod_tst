class Hello {
  String hello;
  String name;
  Hello({required this.hello, required this.name});
  factory Hello.fromJson(Map<String, dynamic> json) =>
      Hello(hello: json['hello'], name: json['name']);
}
