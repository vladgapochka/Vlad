fun main(args:Array<String>) {
    println("Введите число")
    val kol: Int
    val x = readLine()!!.toInt()
    println(kolvo(x))
}
fun sm2(x: Int, y: Int): Boolean
{
    if (y % x == 0) return false
    for (i in 2..(x/2)+1)
        if (y % i == 0 && x % i == 0)
            return false
    return true
}
fun kolvo(x: Int): Int
{
    var count = 0
    for (i in 1..(x))
        if (simple2(x,i))
            count++
    return count
}