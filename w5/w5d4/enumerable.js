Array.prototype.myEach = function (fctn) {
  for(var i = 0; i < this.length; i++){
    fctn(this[i]);
  }
  return this;
};

var printElement = function(element) {
  console.log(element);
};

[0,1,2,'dog'].myEach(printElement);

var plusOne = function(element) {
  return element + 1 ;
};

// var myMap = function (array, fctn) {
//   mappedArray = [];
//   myEach(array, function(){
//     mappedArray.push(fctn());
//   }) ;
//   5 ;
// };


Array.prototype.myMap = function (fctn) {
  var mappedArray = [] ;
  this.myEach(function(element) {
      mappedArray.push(fctn(element)) ;
  }) ;
  return mappedArray ;
};

console.log([1,2,3].myMap(plusOne));

Array.prototype.myInject = function(fctn) {
  var accumulation = this[0];
  this.slice(1).myEach(function(element) {
     accumulation = fctn(accumulation, element);
  });
  return accumulation;

};


var addition = function(accumulation, element) {
  return accumulation + element;
};


console.log([1,2,3].myInject(addition)) ;

Array.prototype.bubbleSort = function() {
  var finish = false ;
  while (finish === false){
    finish = true ;
    for ( var i = 0; i < this.length - 1; i++ ) {
      if (this[i] > this[i + 1]) {
        finish = false;
        var temp = this[i]; // any way to swap elements without tempvar?
        this[i] = this[i+1];
        this[i+1] = temp;
      }
    }
  }
  return this;
};

console.log([5,7,2,5,1000].bubbleSort());

String.prototype.substrings = function() {
  var arrayOfSubs = [];
  for(var start = 0; start < this.length; start++) {
    for(var end = start + 1; end <= this.length; end++ ) {
      arrayOfSubs.push(this.substring(start, end));
    }
  }
  return arrayOfSubs;
};

console.log('test'.substrings());


/* ruby
class Array
  def my_map
    mapped_array = []
    self.each do |el|
      mapped_array.push(yield(el))
    end
  end

  def my_inject
    accumulation = self.first
    self.drop(1).each do |accumulation, el| {
      accumulation = yield(accumulation, el)
    }
    return accumulation
  end

end


*/
