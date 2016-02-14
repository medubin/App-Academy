var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
//
// askIfGreaterThan(1,2, function(answer) {
//   console.log(answer);
// });

function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.

  reader.question("Is " + el1 + " greater than " + el2 + "?", function(answer) {
    callback(answer === 'yes');
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  if (i < arr.length - 1){
     askIfGreaterThan(arr[i],
       arr[i + 1],
       function(isGreaterThan) {
         if (isGreaterThan) {
           var temp = arr[i];
           arr[i] = arr[i + 1];
           arr[i + 1] = temp;
           madeAnySwaps = true;
         }
         innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outBubbleSortLoop);
       }
     );
     console.log(1);
   } else {
     outBubbleSortLoop(madeAnySwaps);
   }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
