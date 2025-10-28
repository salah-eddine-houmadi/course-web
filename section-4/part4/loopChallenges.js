// Somme avec while
let sumWhile = 0;
let i = 0;

while (i <= 5) {
  sumWhile += 1; // ajoute 1 à chaque itération
  i++;
}

console.log("Somme avec while :", sumWhile); 

//  Compter de 1 à 10 avec for
console.log("Compter de 1 à 10 :");
for (let j = 1; j <= 10; j++) {
  console.log(j);
}

//  Parcourir un tableau de fruits
let fruits = ["pomme", "banane", "orange", "kiwi"];
console.log("Liste des fruits :");
for (let fruit of fruits) {
  console.log(fruit);
}

//  Somme des nombres de 1 à 100 avec for
let sumFor = 0;
for (let k = 1; k <= 100; k++) {
  sumFor += k;
}

console.log("Somme de 1 à 100 :", sumFor); 
