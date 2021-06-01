fun main(args:Array<String>) {
        println("Введите число")
        val x = readLine()!!.toInt()
        println(del(x))
    }
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