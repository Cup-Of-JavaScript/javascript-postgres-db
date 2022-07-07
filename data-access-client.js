//
// File: data-access-client.js
// Desc: Simple driver for the data access layer (DAL).
//

const dataAccess = require('./data-access.js');

const main = async () => {
    // Select..
    let r = await dataAccess.select();
    
    // Delete...
    //let r = await dataAccess.deleteCustomer(2);

    // Insert...
    // let r = await dataAccess.insert("Dave Jones");

    // Update...
    // let customer = {
    //     customerName: "Joey",
    //     customerId: 1
    // }
    // let r = await dataAccess.update(customer);

    console.log(r);
    process.exit()
}

main();
