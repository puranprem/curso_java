//Imagina que se te entrega un array de objetos. 
//Por ejemplo, var users = [{name: "Michael", age:37}, {name: "John", age:30}, {name: "David", age:27}];
//¿Cómo harías print/log de la edad de John?
//¿Cómo harías print/log del nombre del primer objeto?
//¿Cómo harías print/log del nombre y la edad de cada usuario utilizando un for loop? Tu output debería verse algo como esto
//¿Cómo harías para imprimir el nombre de los mayores de edad?






var users = [
    {name: "Michael",age:37 
}, 
    {name: "John", age:30 
},
    {name: "David", age:27
}
];

console.log(users[1].age);
console.log(users[0].name);


function printLoops(array) {
for (var index=0; index<array.length;index++) {

console.log(array[index].name +" "+(array[index].age));

}
}

printLoops(users);

for (x of users) {
console.log(x.name +" "+x.age);
}

//function printLoops(array) {
//  if ((users[array].age)>=18) {
//       console.log(user[array].name)
//  }

//}
//printLoops(users);*/