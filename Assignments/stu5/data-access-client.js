//
// File: data-access-client.js
// Desc: Simple driver for the data access layer (DAL).
//

const dataAccess = require('./data-access.js');

const main = async () => {
    let r = await dataAccess.ex16();
    console.log(r);
    process.exit()
}

main();
