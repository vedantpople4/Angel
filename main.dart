import 'dart:io';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_hot/angel_hot.dart';
main() async{
  var hot = HotReloader(createServer, [Directory("bin")]);  
  await hot.startServer("127.0.0.1",3000);
}

Future<Angel> createServer() async {
  var app = Angel();
  app.get("/",(req,res){
    res.write("Hello Welcome to angel again");
  });
  app.fallback((req, res) =>throw AngelHttpException.notFound());
  return app;
}