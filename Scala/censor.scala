trait Censor {
  val curseWords = Map("Shoot" -> "Plucky", "Darn" -> "Beans")
  
  def censor(phrase: String): String = {
    var result = phrase
    curseWords.foreach(word => result = result.replaceAll(word._1, word._2))
	
	result
  }
}

object Speaker extends Censor
println(Speaker.censor("This is some Shoot, Darn"))

class Speaker extends Censor
println(new Speaker().censor("Shoot, Darn"))

