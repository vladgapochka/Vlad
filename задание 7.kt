import java.util.Scanner
fun main(args: Array<String>)
{
    var y: Int
    var x: Int
    var summ = 0
    var proizv = 1
    var min=100000
    var max = 0
    var h = Scanner(System.`in`)
    print("Введите число:= ")
    y = h.nextInt()
    while (y > 0)
    {
        x = y % 10
        if(x<min) min =x
        if(x>max) max = x
        summ += x
        proizv *=x
        y /= 10
    }
    println("Сумма всех элементов числа равна:= $summ")
    println("Максимальный элемент:= $max")
    println("Минимальный элемент:= $min")
    println("Произведение всех элементов числа равна:= $proizv")
}