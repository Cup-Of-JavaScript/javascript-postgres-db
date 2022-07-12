const dataAccess = require('./mybooks.js');

const main = async () => {
    let r = await dataAccess.read();
    console.log(r);
    process.exit()
}

main();
