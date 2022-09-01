let even = { (i: Int) -> Bool in
    i % 2 == 0
}

func evenTest(num: Int, even: (Int) -> Bool) {
    even(num)
}

even(10) // true
evenTest(num: 10, even: even)
evenTest(num: 10) { (i: Int) -> Bool in
    i % 2 == 0
}
