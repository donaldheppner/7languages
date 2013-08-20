val strings = List("One", "Two", "Three")

// uses foldLeft to sum the length of strings, 0 is the initial sum
val lengths = (0 /: strings) {(sum, string) => sum + string.length}
println(lengths)