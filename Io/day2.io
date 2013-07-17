// 1: Write a program to find the nth number in a fibonacci sequence
fib := method(index,
  current := 1
  previous := 0
  
  (index - 1) repeat(
    newPrevious := current
    current = current + previous
	previous = newPrevious
  )
  
  return(current)
)

("6th element in a fibonacci: " .. (fib(6) asString)) println

// 1a: recursively
fibRec := method(count, current, previous,
  if(current isNil, current = 1)
  if(previous isNil, previous = 0)

  if(count != 1,
    return(fibRec(count - 1, current + previous, current)),
	return(current)
  )
)

("8th element in a fibonacci (recursive): " .. (fib(8) asString)) println

// 2: change / to return 0 of the denominator is 0
("Dividing by zero returns: " .. ((5 / 0) asString)) println

originalDivide := Number getSlot("/")
Number / := method(i, if(i != 0, self originalDivide(i), 0))

("Dividing by zero NOW returns: " .. (5 / 0)) println

// 3: sum all values in a two dimensional array
listSum := list(list(1, 2, 3, 4), list(1, 2, 3, 4), list(1, 2, 3, 4), list(1, 2, 3, 4)) flatten sum
("Sums should be 40 and is: " .. (listSum asString)) println

// 4: custom average implementation that raises exception on non-numeric
List myAverage := method(
  if(((self detect(v, if(v isKindOf(Number), nil, v))) isNil) == false,
    Exception raise("List contains a non-numeric value"))
	
  // if the list has no elements, return 0
  if((self size) == 0, return(0), return((self sum) / (self size)))
)

// 5: create a prototype for a two-dimensional list.  The dim(x,y) method should allocate a list of y lists that are x elements long.
// set(x, y, value) should set a value, and get(x,y) should return that value
Matrix := List clone do (
  dim := method(x, y,
    result := self clone
    result setSize(y)
    result mapInPlace(i, v, List clone setSize(x))
    return(result)
  )
  
  set := method(x, y, value, self at(y) atPut(x, value))
  get := method(x, y, return(self at(y) at(x)))
)

matrix := Matrix dim(5,5)
matrix set(4,4,"Donald")
("Element at 4,4 should be 'Donald' and is: " .. (matrix get(4,4))) println

// 6: bonus transpose method so that get(y, x) == get(x, y) in the original list
// Note: one way to do this is to replace the methods in the transposed matrix (the cheater way)
// .. the other way is to replace the values
Matrix transposeCheater := method(
  result := self clone
  
  result set := method(x, y, value, self at(x) atPut(y, value))
  result get := method(x, y, return(self at(x) at(y)))
  return result
)

matrix12 := Matrix dim(1, 2)
matrix12 set(0, 1, "Donald")
matrix21Cheater := matrix12 transposeCheater

("Does 0, 1 in the original equal 1, 0 in the transposed matrix (cheater)? " .. ((matrix12 get(0, 1)) == matrix21Cheater get(1, 0))) println

// the non-cheater way
Matrix transpose := method(
  result := Matrix dim( self size, self at(0) size );
  result size repeat(y,
    result at(y) size repeat(x,
	  result set(x, y, self get(y, x))))
  return result
)

matrix21 := matrix12 transpose

("Does 0, 1 in the original equal 1, 0 in the transposed matrix? " .. ((matrix12 get(0, 1)) == matrix21 get(1, 0))) println
