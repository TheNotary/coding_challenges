'use strict';

const fs = require('fs');

let rawdata = fs.readFileSync('pastry_orders.json');
let orders = JSON.parse(rawdata);



let bigFinObject = []

let orderNumber = 0
orders.forEach( order => {
  let entryCount = order.length
  if (entryCount == 0) return;

  let flourConsumption = 0
  let price = 0
  order.forEach( entry => {
    flourConsumption += entry['flourConsumption'] * entry['quantity']
    price += entry['price'] * entry['quantity']
  })

  let value = price/ flourConsumption
  //console.log("Order Number: " + orderNumber)
  //console.log("Value: " +  value)
  bigFinObject.push( { value: value, flourConsumption: flourConsumption, orderNumber: orderNumber } )
  // console.log(order

  orderNumber += 1
});



bigFinObject = bigFinObject.sort( (a, b) => {
  return a["value"] > b["value"];
});


bigFinObject.forEach( (order) => {
  console.log("Order Number: " + order["orderNumber"])
  console.log("Value: " +  order["value"])
})

debugger
console.log(bigFinObject)
// student[0][0]['flourConsumption']

console.log("Hello");
