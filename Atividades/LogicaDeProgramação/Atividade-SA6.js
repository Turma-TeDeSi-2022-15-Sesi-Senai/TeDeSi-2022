// Atividade Sa6  alunos envolvidos 

// Robson luis Amaral
// Gabriel Freitas dos Santos
// Daylon Airton Kern





//bubble Sort

function bubbleSort(items) {
  var length = items.length;
  for (var i = 0; i < length; i++) { 
    for (var j = 0; j < (length - i - 1); j++) {
        if(items[j] > items[j+1]) {
           var tmp = items[j]; 
     items[j] = items[j+1]; 
     items[j+1] = tmp; 
     }
   }
 }
}

var arr = [50, 24, 33, 2, 1, 20, 25, 30, 9, 3, 7, 2, 99, 25, 88, 18, 29]; 
bubbleSort(arr);

console.log(arr);

//-------------------------------------------------------------------
//merge Sort
  
function mergeSort(arr) {
  if (arr.length < 2) return arr;
  const middle = Math.floor(arr.length / 2);
  const left = arr.slice(0, middle);
  const right = arr.slice(middle);
  return merge(mergeSort(left), mergeSort(right));
}
 function merge(left, right) {
  let result = [];
  while (left.length && right.length) {
    if (left[0] <= right[0]) {
      result.push(left.shift());
    } else {
      result.push(right.shift());
    }
  }
  return result.concat(left.slice().concat(right.slice()));
}
  
 
console.log(mergeSort ( [65 , 81 , 61 , 23 , 45 , 43 , 23 , 94 , 78 , 24 , 37 , 2 , 15 , 54 , 4 , 92 , 83 , 36 , 27 , 61 , 11 , 71 , 44 , 46 , 0 , 79 , 65 , 65 , 93 , 6]))