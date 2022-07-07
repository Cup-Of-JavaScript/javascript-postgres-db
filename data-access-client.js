//
// File: data-access-client.js
// Auth: Martin BU
const da = require('./data-access.js');

const main = async () => {
    // Select..
   // let r = await da.select();
    
    // Delete...
    //let r = await da.deleteCustomer(2);

    // Insert...
    let r = await da.insert("Dave Jones");

    // Update...
    // let customer = {
    //     customerName: "Joey",
    //     customerId: 1
    // }
    // let r = await da.update(customer);

    console.log(r);
    process.exit()
}

main();
