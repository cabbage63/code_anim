PFont menlo_r_20;
int counter = 0;

//フォント設定
final int FONT_SIZE=20, LINE_NUM=3, V_MARGIN= 35, V_OFFSET=35, CURSOR_OFFSET=33,  ROW_WIDTH=45, ROW_OFFSET=15, CODE_OFFSET=55;

void setup() {  
  size(320, 125);

  menlo_r_20 = loadFont("Menlo-Regular-20.vlw");
  frameRate(10);
}

void draw() {
  // Font
  textFont(menlo_r_20, FONT_SIZE);
  
  // Editor
  background(BG);
  fill(0x33, 0x33, 0x33);
  noStroke();
  rect(0, 0, ROW_WIDTH, height);
  fill(0x77, 0x77, 0x77); 
  for(int i=1; i<=LINE_NUM; i++){
    text(i, ROW_OFFSET, V_OFFSET + V_MARGIN * (i-1));
  }  
  
  // Code
  printText(content_text, counter);
  printText(func_text, 100);
  counter++;
  
  save( "./fig/" + title + "/" + String.format("%03d", counter) + ".png" );
}

float printString(String str, color c, int margin, int line, Boolean cursor){
  fill(c);
  text(str, CODE_OFFSET + margin, V_OFFSET + (line - 1) * V_MARGIN);
  if(cursor){
    fill(PLAIN);
    text("|", CODE_OFFSET + textWidth(str) + margin, CURSOR_OFFSET + (line - 1) * V_MARGIN); 
  }
  return textWidth(str);
}

void printText(Text[] texts, int count){
  int letter = 0;
  int margin = 0; //左側にどれくらいマージンをとるか
  int prevLine = 0;
  Boolean cursor = false;
  color tmpColor;
  String str = "";
  for(Text text: texts){
    //テキストインスタンスによって色を読み直す
    tmpColor = text.cl;
    str = "";
    
    //行番号が変わっていたら、行頭へ。
    if( text.line != prevLine ){
      margin = 0;
    }
    
    //文字数がcountと一致　または Textクラスのインスタンスもの文字列が末端にきたら
    for(int i=0; letter < count && i < text.str.length(); i++){
      str += text.str.charAt(i);
      letter++;
      if(i == text.str.length()){
        cursor = true;
      }
    }
    
    //描画する
    if(letter == count){
      cursor = true;
      margin += printString(str, tmpColor, margin, text.line, cursor);
      break;
    }else{
      margin += printString(str, tmpColor, margin, text.line, cursor);
    }
    prevLine = text.line;
  }
}
