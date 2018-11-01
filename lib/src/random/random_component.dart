import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'random_service.dart';

@Component(
  selector: 'random',
  styleUrls: ['random_component.css'],
  templateUrl: 'random_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialInputComponent,
    NgFor,
  ],
  
  providers: [const ClassProvider(RandomtService)],
)

class RandomComponent implements OnInit {
  RandomService RandomService;
  List<String> items = [];
  String newTodo = '';

  RandomComponent(this.RandomService);


  var namelist ={
    0:'小龙',
    1:'小吴',
    2:'小张',
    3:'小唐',
    4:'小7',
    5:'小菜',
    6:'小李',
    7:'小周',
    8:'小郑',
    9:'小陈',
    10:'小赵',
    11:'小朱',
  };

  var counter=[0,0,0,0,0,0,0,0,0,0,0,0,0];
  var record="";

 void randomname(){
   Random random = new Random();
   var number = random.nextInt(13);
   
    var id=number+1;
    String snumber=id.toString();
    querySelector('#number').text='学号：'+snumber;
    querySelector('#name').text='名字：'+namelist[number];
    list[number]++;
    String times=list[number].toString();
    querySelector('#counter').text=namelist[number]+'同学已经被点名'+times+'次';
  }


  }