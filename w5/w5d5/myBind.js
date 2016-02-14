Function.prototype.myBind = function(context) {
  var fn = this;

  // return fn.apply(context);

  return function() {
    return fn.apply(context);
  };
};

// function Button(context){
//   console.log(context + " clicked");
// }
//
// Button.prototype.click = function(){
//   console.log(this);
// };
//
// var button1 = new Button;
//
// button1.click.bind( );


// var a = [1,2,3];
// var b = [4,5,6];
//
// console.log([].slice.myBind(b)());

function Lamp() {
   this.name = "a lamp";
}

var turnOn = function() {
   console.log("Turning on " + this.name);
};

var lamp = new Lamp();

turnOn(); // should not work the way we want it to

// var boundTurnOn = turnOn.bind(lamp);
var myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"




// var func1 = function () {
//   console.log(this);
//   var fun2 = function() {
//     console.log(this);
//   }.bind(this);
// };
//
// func1();
//
// var func3 = function() {
//   console.log(this);
//   func1();
// };
//
// func3();
//
// funcion() {}
