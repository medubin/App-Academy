function Student(fName, lName ) {
  this.fName = fName;
  this.lName = lName;
  this.courses = [];
}
Student.prototype.name = function() {
  return this.fName + ' ' + this.lName;
};

// Student.prototype.courses = function() {
//   return this.courses;
// };

Student.prototype.enroll = function(course) {
  this.courses.push(course);
  course.students.push(this);
};

function Course(name, dept, credits) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.students = [];
}

Student.prototype.courseLoad = function() {
  var courseHash = {};
  for(var i = 0; i < this.courses.length; i++) {
    if (courseHash[this.courses[i].dept] === undefined){
      courseHash[this.courses[i].dept] = this.courses[i].credits;
    } else {
      courseHash[this.courses[i].dept] += this.courses[i].credits;
    }
  }
};
