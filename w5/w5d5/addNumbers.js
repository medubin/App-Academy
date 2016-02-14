var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0) {
    reader.question("Enter Number: ", function(answer){
      console.log(answer);
      sum += parseInt(answer);
      numsLeft--;
      completionCallback(sum);

      addNumbers(sum, numsLeft, completionCallback);  
    }
  );
} else {
   reader.close();
 }
}

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});
