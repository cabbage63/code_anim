class Text{
  String str; //文字列
  color cl;   //色
  int line;   //何行目に書くか
  
  Text(){
    str = "";
    cl = PLAIN;
    line = 1; 
  }
  
  Text(String str){
    this.str = str;
    cl = PLAIN;
    line = 1; 
  }

  Text setLine(int l){
    line = l;
    return this;
  }  
  Text setColor(color c){
    cl = c;
    return this;
  }
}