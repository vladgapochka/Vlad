
fun main(args: Array<String>)
{
  val kotlin: String = "kotlin"
    val prolog: String = "prolog"
  val c:String = "c"
  val java:String = "java"
  val python:String = "piton"
  val sql:String = "php"
  val ruby:String = "ruby"
  val pascal:String = "matlab"
  println("Выберите любимый язык программирования из списка: $kotlin | $prolog | $c | $java | $python | $sql | $ruby | $pascal ")
  println("Введите:")
  var input = readLine()
  if(input == kotlin || input == prolog){
    println("Ты подлиза")
  }
  if(input == c ){
    println("Ты Сишник")
  }
  if(input == java ){
    println("Ты хорош")
  }
  if(input == python ){
    println("Ты удав")
  }
  if(input == sql ){
    println("Ты бдешник")
  }
  if(input == ruby ){
    println("Ты рубик")
  }
  if(input == pascal ){
    println("Ты ребёнок")
  }
  println("Введи правильно название языка")
}