// array.js
var uniq = function (array){
  var newArray = [];
  for(var i = 0; i < array.length; i++) {
    if (newArray.indexOf(array[i]) === -1) {
      newArray.push(array[i]);
    }
  }
  return newArray;
};

console.log(uniq([1,2,2,2,3]));

var twoSum = function (array) {
  var twoSumArray = [];
  for(var i = 0; i < array.length; i++) {
    for(var j = i + 1; j < array.length; j++) {
      if(array[i] + array[j] === 0) twoSumArray.push([i, j]);
    }
  }
  return twoSumArray;
};

console.log(twoSum([0,1,2,0,-1,3,1,-1]));

var transpose = function (array) {
  var transposeArray = [];
  for(var i = 0; i < array.length; i++) {
    transposeArray.push([]);
    for(var idx = 0; idx < array.length; idx++){
      transposeArray[i].push(array[idx][i]);
    }
  }
  return transposeArray;
};

console.log(transpose(
  [
    [0,1,2],
    [3,4,5],
    [6,7,8]
  ]
));
