function madLib(verb, adj, noun) {
  console.log(`We shall ${verb} the ${adj} ${noun}.`);
}

madLib("make", "best", "guac");


function isSubString(searchString, subString) {
  console.log(searchString.includes(subString))
}

isSubString("what is going on", "whats")

function fizzBuzz(array) {
  let new_array = []

  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      continue;
    }
    new_array.push(array[i]);
  }
  return new_array;
}

console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))

function isPrime(number) {
  if (number < 2) {
    return false;
  }
  if (number == 2) {
    return true;
  }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}
console.log(isPrime(5))

function firstNPrimes(n) {
  let prime_array = [];

  for (let i = 2; prime_array.length < n; i++) {
    if (isPrime(i)) {
      prime_array.push(i)
    }
  }java
  return prime_array;
}

console.log(firstNPrimes(3))

function sumOfNPrimes(n) {
  let prime_array = firstNPrimes(n);

  let sum = 0;
  prime_array.forEach(function(el) {
    sum += el;
  })
  return sum;
}

console.log(sumOfNPrimes(3))
