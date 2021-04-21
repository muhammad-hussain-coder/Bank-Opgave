KnapToggle knap10kr = new KnapToggle(50, 50, 200, 100, "10 kroner");
// knappen for "10" kroner
KnapToggle knap100kr = new KnapToggle(300, 50, 200, 100, "100 kroner");
// knappen for "100" kroner
KnapToggle knap1000kr = new KnapToggle(550, 50, 200, 100, "1000 kroner");
// knappen for "1000" kroner

Knap knapAddMoney = new Knap(50, 200, 200, 100, "Overfør");
// knappen for "overfør"
Knap knapAddMoney5 = new Knap(300, 200, 200, 100, "Overfør (*5)");
// knappen for at man ganger den valgte overførelsen med 5
Knap knapNulstil_saldo = new Knap(550, 200, 200, 100, "Nulstil saldo");
// knappen for at man kan nulstille sin saldo

KontoFelt kontoFelt = new KontoFelt(50, 350, 700, 100, 0);

void setup(){
  size(1200, 750);
}

void draw(){
  background(313);
  
  knap10kr.display();
  // baggrundsdisplay (10kr)
  knap100kr.display();
  // baggrundsdisplay (100kr)
  knap1000kr.display();
  // baggrundsdisplauy (1000kr)
  knapAddMoney.display();
  // baggrundsdisplay (tilføj penge)
  knapAddMoney5.display();
  // baggrundsdisplay (gange transaktionen med 5)
  knapNulstil_saldo.display();
  // baggrundsdisplay nulstilning af saldo
  
  kontoFelt.display();
  // baggrundsdisplay for konto feltet
}

void mousePressed(){
  knap10kr.registrerTryk();
  knap100kr.registrerTryk();
  knap1000kr.registrerTryk();
  knapAddMoney.registrerTryk();
  knapAddMoney5.registrerTryk();
  knapNulstil_saldo.registrerTryk();
  
  if(knapAddMoney.trykket){
    addMoney(1);
  } 
  if(knapAddMoney5.trykket){
    addMoney(5);
  }
  if(knapNulstil_saldo.trykket){
    kontoFelt.nulstil();
  }
}

void mouseReleased(){
  knap10kr.registrerRelease(); 
  // knappen for 10 kroner
  knap100kr.registrerRelease();
  // knappen for 100 kroner
  knap1000kr.registrerRelease();  
  // knappen for 1000 kroner
  knapAddMoney.registrerRelease();  
  // knappen for at tilføje penge
  knapAddMoney5.registrerRelease();  
  // knappen for produktering
  knapNulstil_saldo.registrerRelease(); 
  // knappen for at nulstille saldoen
}

void addMoney(int times){
  if(knap10kr.trykket){
    kontoFelt.add(times*10f);
  }
  if(knap100kr.trykket){
    kontoFelt.add(times*100f);
  }
  if(knap1000kr.trykket){
    kontoFelt.add(times*1000f);
  }
}
class Knap extends Komponent{
  boolean trykket = false;
  
  public Knap(float x, float y, float w, float h, String tekst){
    super(x, y, w, h, tekst);
  } 
  void registrerTryk(){
    if(hovered()){
      trykket = true;
    }
  } 
  void registrerRelease(){
    trykket = false;
  }
  void display(){
    if(hovered()){
      fill(115);
  }
    else{
      fill(255);
  }
    if(trykket){
      stroke(0, 255, 80);
  }
    else{
      stroke(0);
  }
    rect(x, y, w, h, 90);
    super.display();
  }
}
class KnapToggle extends Knap{
  public KnapToggle(float x, float y, float w, float h, String tekst){
    super(x, y, w, h, tekst);
  }
  
  void registrerTryk(){
    if(hovered()){
      trykket = !trykket;
    }
  }
  
  void registrerRelease(){
  }
}
class Komponent{
  float x, y, w, h;
  String tekst;
  
  public Komponent(float x, float y, float w, float h, String tekst){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.tekst = tekst;
  }
  
  void display(){
    textSize(14);
    fill(128, 0, 128);
    text(tekst, x + 0.5f * w - textWidth(tekst) * 0.5f, y + 14 + 0.5 * h); 
  }
  
  boolean hovered()  {
    return mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h;
  }
}
class KontoFelt extends Komponent{
  float balance;
  
  public KontoFelt(float x, float y, float w, float h, float balance){
    super(x, y, w, h, balance + " kr");
    this.balance = balance;
  }
  
  void add(float v){
    balance += v;
    tekst = balance + " kroner";
  }
  
  void nulstil(){
    balance = 0;
    tekst = balance + " kroner";
  }
  
  void display(){
    fill(255, 0, 255);
    stroke(0);
    rect(x, y, w, h, 50);
    super.display();
  }
}
