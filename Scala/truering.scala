// singleton declared as "object" instead of class
// a class can have both "object" and "class" definitions
// ... and are said to be companions of each other
object TrueRing {
  def rule = println("To rule them all")
}

TrueRing.rule