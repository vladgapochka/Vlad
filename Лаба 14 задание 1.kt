import java.util.*
fun sumUp(x: Int): Int { return if(x==0) x else return sumUp(x/10) +x % 10 }
fun main(args:Array<String>) {
    print("Введите число:= ")
    var x = readLine()!!.toInt()
    println("Сумма всех элементов числа равна:= ${sumUp(x)}")
}
