import java.util.Scanner
fun main(args: Array<String>)
{
    var y: Int
    var x=0
    var s = 0
    var h = Scanner(System.`in`)
    print("Введите число:= ")
    y = h.nextInt()
    if(y%3==0) {
        while (y > 0) {
                x = y % 10
            s += x
            y /= 10
        }
        println("Сумма всех элементов числа равна:= $s")
    }
    else println("Введите другое число")
}