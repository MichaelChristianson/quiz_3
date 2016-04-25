// Write a Javascript code (not part of the app above) to do the following (10%):
// Implement filter function in Javascript.
//
var isEven = function (x) { return x % 2 == 0; };
filter([1, 2, 3, 4], isEven); // => [2, 4]

var filter = function(arr, fn) {
  var trueArr = [];
  for (var i = 0; i < arr.length; i++){
    if(fn(arr[i])){
      trueArr.push(arr[i]);
    }
  }
  return trueArr;

filter([1, 2, 3, 4], isEven);
