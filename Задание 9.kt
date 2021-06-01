fun main(args:Array<String>) {
    fun smp(x: Int, y: Int): Boolean
    {
        if (y % x == 0) return false
        for (i in 2..(x/2)+1)
            if (y % i == 0 && x % i == 0)
                return false
        return true
    }
    tailrec fun mut(x: Int, y: Int, count: Int): Int = if (x == 0) count else
        ( if (smp(x % 10,y))
        { val count1 = 1 + count
            mut(x/10, y, count1)
        }
        else mut(x/10, y, count))

    fun del(x: Int): Int {
        var max = 0
        var del = 1
        for (i in 1..(x/2 + 1))
        {
            if (x % i == 0)
            {
                if (max > mut(x, i,0))
                    max = mut(x, i,0)
                del = i
            }
        }
        return del
    }
    fun del3(x: Int):Int
    {
        var number = x
        var sum = 0
        while(number != 0 ) {
            if ((number % 10) % 3 == 0)
                sum += number % 10
            number /= 10
        }
        return sum
    }
    fun simple2(x: Int, y: Int): Boolean
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
    fun composition(x: Int) : Int
    {
        var number = x
        var p = 1
        while (number != 0)
        {
            p *= number % 10
            number /= 10
        }
        return p
    }
    fun max(num:Int): Int = if (num < 10) num
    else
        if (num % 10 > max(num/10)) num % 10
        else max(num/10)
    fun min(num:Int): Int = if (num < 10) num
    else
        if (num % 10 < min(num/10)) num % 10
        else min(num/10)

    fun sumNumber(x: Int):Int
    {
        var number = x
        var sum = 0
        while(number != 0)
        {
            sum += number % 10
            number /=10
        }
        return sum
    }
    println("Введите число\n")
    val x =

        readLine()!!.toInt()
    println("Что вы хотите сделать?")
    println( "1 - Найти сумму цифр числа\n" +
            "2 - Найти максимальную цифру числа\n" +
            "3 - Найти минимальную цифру числа\n" +
            "4 - Найти произведение цифр числа\n" +
            "5 - Найти количество чисел, взаимно простых с заданным\n" +
            "6 - Найти сумму цифр числа, делящихся на 3\n" +
            "7 - Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа\n")
    var z = readLine()!!.toInt()
    while(z != 8) {
        when (z) {
            1 -> println(sumNumber(x))
            2 -> println(max(x))
            3 -> println(min(x))
            4 -> println(composition((x)))
            5 -> println(kolvo(x))
            6 -> println(del3(x))
            7 -> println(del(x))
            else -> println("Ошибка\n")
        }
        println("Что вы хотите сделать?")
        println( "1 - Найти сумму цифр числа\n" +
                "2 - Найти максимальную цифру числа\n" +
                "3 - Найти минимальную цифру числа\n" +
                "4 - Найти произведение цифр числа\n" +
                "5 - Найти количество чисел, взаимно простых с заданным\n" +
                "6 - Найти сумму цифр числа, делящихся на 3\n" +
                "7 - Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа\n")
        z=readLine()!!.toInt()
    }
}
