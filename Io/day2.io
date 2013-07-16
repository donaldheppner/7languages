one := Object clone

// fibonacci 
one fib := method(index,
  current := 1
  previous := 0
  
  (index - 1) repeat(
    newPrevious := current
    current = current + previous
	previous = newPrevious
  )
  
  return(current)
)

one fib(6) println

// fibonacci recursive
one fibRec := method(count, current, previous,
  if(current isNil, current = 1)
  if(previous isNil, previous = 0)

  if(count != 1,
    return(fibRec(count - 1, current + previous, current)),
	return(current)
  )
)

one fibRec(8) println

// change / to return 0 of the denominator is 0
(5 / 0) println // prints infinity

originalDivide := Number getSlot("/")
Number / := method(i, if(i != 0, self originalDivide(i), 0))

(5 / 0) println // prints 0

// sum all values in a two dimensional array
list(list(1, 2, 3, 4), list(1, 2, 3, 4), list(1, 2, 3, 4), list(1, 2, 3, 4)) flatten sum

// custom average implementation that raises exception on non-numeric
List myAverage := method(
  if(((self detect(v, if(v isKindOf(Number), nil, v))) isNil) == false,
    Exception raise("List contains a non-numeric value"))
  return((self sum) / (self size))
)

// create a prototype matrix
Matrix := Object clone do (
  dim := method(x, y,
    result := self clone do (
      matrix := List clone do(
        setSize(y)
	    // map(i, v, v := List clone do( setSize(x) ) )
	  )
    )	
	return(result)
  )
)

Matrix := Object clone do (
  x := "asdf"
)



