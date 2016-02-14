var range = function(start, end) {
  if (start > end){
    return [];
  }
  return [start].concat(range(start + 1, end))  ;
};

console.log(range(1,17));

Array.prototype.sum1 = function() {
  var sum = 0;
  for(var i = 0; i < this.length; i++) {
    sum += this[i] ;
  }
  return sum ;
};

console.log([1,2,3,4].sum1()) ;

Array.prototype.sum2 = function () {
  if (this.length === 1) return this[0];
  return (this[0] + this.slice(1).sum2());
};

console.log([0,1,2,3,4].sum2());


var exp1 = function(base, power) {
  if (power === 0) return 1;
  return base * exp1(base, power - 1);
};

console.log(exp1(5, 3));

var exp2 = function(base, power) {
  if (power === 0) return 1;
  if (power === 1) return base;
  if (power % 2 === 0) return Math.pow(exp2(base, (power / 2)), 2);
  return base * Math.pow(exp2(base, ((power - 1) / 2)), 2);
};

console.log(exp2(5,3));

var fib1 = function(n) {
  var fib = [0,1];
  while (fib.length < n) {
    fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
  }
  return fib;
};

console.log(fib1(15));

var fib2 = function(n){
  if (n === 1) return [0];
  if (n === 2) return [0,1];
  var b = fib2(n - 1) ;
  var next = b[b.length - 1] + b[b.length - 2] ;
  return (b.concat([next])) ;
};

console.log(fib2(15));


Array.prototype.bsearch = function(target) {
  var mid = Math.floor(this.length / 2);
  if (this[mid] === target) return mid;
  if (this.length <= 1) return NaN;
  if (this[mid] > target) {
    return this.slice(0, mid).bsearch(target);
  } else {
    return (mid + this.slice(mid).bsearch(target));
  }
};
console.log([0,1,2,3,4,5].bsearch(55));


var makeChange = function(change, coins) {
  if (change === 0) return [];
  var bestPurse = null;
  for (var x = 0; x < coins.length; x++) {
    if (coins[x] > change) continue;
    var currentPurse = makeChange(change - coins[x], coins);
    if (!currentPurse) continue;
    currentPurse.push(coins[x]);
    if (bestPurse === null || bestPurse.length > currentPurse.length) {
       bestPurse = currentPurse;
     }
  }
  return bestPurse;
};

console.log(makeChange(14, [10,7,1]));



Array.prototype.mergeSort = function() {
  if (this.length <= 1) return this;
  var mid = Math.floor(this.length / 2);
  var left = this.slice(0, mid);
  var right = this.slice(mid);

  return this.merge(left.mergeSort(), right.mergeSort()) ;
};

Array.prototype.merge = function(array1, array2) {
  var mergedArray = [];
  while (array1.length !== 0 && array2.length !== 0) {
    if (array1[0] > array2[0]) {
     mergedArray.push(array2.shift());
   } else {
     mergedArray.push(array1.shift());
   }
  }
  return mergedArray.concat(array1).concat(array2);
};

console.log('Merge start here');
console.log([1,4,23,2,5, 0, 2, 100].mergeSort()) ;


Array.prototype.subsets = function() {
  if (this.length === 0) return [[]];
  var currentSubs = this.slice(0, -1).subsets();
  var newSubs = [];
  for (var i = 0; i < currentSubs.length; i++) {
    newSubs.push(currentSubs[i]);
    newSubs.push(currentSubs[i].concat(this.slice(-1)));
  }
  return newSubs;
};
console.log([0,1,2].subsets());
