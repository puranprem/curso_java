//Ejercicio 2 - Es tu turno de escribir primero el test y luego la función
//Ya sea en el mismo archivo o en uno diferente, crea una prueba o función que devuelva la suma del número 
//más grande y el más pequeño del array. Por ejemplo, sumMaxMin([1,3,10]) debería devolver 10 + 1 = 11,
// y sumMaxMin([-2,-5,-10]) debería devolver -2 + -10 = -12. Una vez que hayas escrito la prueba, 
//ejecútala (sin escribir toda la función para asegurarte de que fallen todas las pruebas), 
//luego completa la función cerciorándote de que pase todas las pruebas. 
//No utilices más de 30 minutos en todo el ejercicio.


function sumMaxMin(array) {
    var mayor=array[0];
    var menor=array[0];
    for (var index = 0; index < array.length; index++) {
        if (array[index]>mayor){ 
        mayor=array[index];
        } 
        if (array[index]<menor) {
        menor=array[index] ;  
        }
    }
    return mayor+menor;
    
    
}
//var m=sumMaxMin([-3,3,5,7]);;
//console.log(m)

describe("sumMaxMin", function() { 
    it("deberia devolver 4 cuando pasemos el arreglo [-3,3,5,7] ", function() { 
        expect(sumMaxMin([-3,3,5,7])).toEqual(4); 
    }); 
    it("deberia devolver -12 cuando pasemos el arreglo [-2,-5,-10] ", function() { 
        expect(sumMaxMin([-2,-5,-10])).toEqual(-12); 
    }); 
});

