function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}
Cat.prototype.cuteStatement = function() {
  return this.owner + " loves " + this.name;
};

var sven = new Cat('Sven', 'Ned');
var robot = new Cat('Robot', 'Ned');
var gizmo = new Cat('Gizmo', 'Ned');
var markov = new Cat('Markov', 'Ned');
console.log(sven.cuteStatement());
console.log(robot.cuteStatement());
console.log(gizmo.cuteStatement());
console.log(markov.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return "Everyone loves " + this.name ;
} ;

console.log(sven.cuteStatement());
console.log(robot.cuteStatement());
console.log(gizmo.cuteStatement());
console.log(markov.cuteStatement());

Cat.prototype.meow = function() {
  return "Meow!, I am a cat named " + this.name ;
} ;

console.log(sven.meow());
console.log(robot.meow());
console.log(gizmo.meow());
console.log(markov.meow());

robot.meow = function() {
  return "Beep boop fatal error!";
};

console.log(sven.meow());
console.log(robot.meow());
console.log(gizmo.meow());
console.log(markov.meow());
