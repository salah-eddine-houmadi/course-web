function greet(name) {
  console.log("Bonjour, " + name);
}

greet("Alice"); 


const person = {
  name: "Alice",
  greet: function() {
    console.log("Hello, " + this.name);
  }
};

person.greet(); 

function outerFunction(x) {
  function innerFunction(y) {
    return x + y;
  }
  return innerFunction(5);
}

console.log(outerFunction(10)); 


function createMultiplier(x) {
  return function(y) {
    return x * y;
  };
}

const double = createMultiplier(2);
console.log(double(10)); 