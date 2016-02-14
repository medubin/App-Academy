// var setInterval = function (callback, i) {
//   sleep(i);
//   callback();
// };

function Clock () {
  // 1. Create a Date object.
  // 2. Store the hours, minutes, and seconds.
  // 3. Call printTime.
  // 4. Schedule the tick at 1 second intervals.
  var currentDate = new Date();
  this.hour = currentDate.getHours();
  this.second = currentDate.getSeconds();
  this.minute = currentDate.getMinutes();

  this.printTime();
  // var that = this;
  // function ticker() {
  //   that._tick();
  // }
  setInterval(this._tick.bind(this), 1000 );


}


Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  // Use console.log to print it.
  var currentHour =
    (this.hour.toString().length === 1)
    ? ("0" + this.hour.toString())
    : this.hour.toString();
  var currentMinute =
    (this.minute.toString().length === 1)
    ? ("0" + this.minute.toString())
    : this.minute.toString();
  var currentSecond =
    (this.second.toString().length === 1)
    ? ("0" + this.second.toString())
    : this.second.toString();

  console.log(currentHour + ':' + currentMinute + ':' + currentSecond);
};

Clock.prototype._tick = function () {
  // 1. Increment the time by one second.
  // 2. Call printTime.
  this.second += 1;
  if (this.second === 60) {
    this.second = 0;
    this.minute += 1;
  }
  if (this.minute === 60) {
    this.minute = 0;
    this.hour += 1;
  }
  if (this.hour === 24) this.hour = 0;

  this.printTime();
};

var clock = new Clock();
