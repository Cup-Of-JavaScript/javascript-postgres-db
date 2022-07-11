const dataAccess = require('./data-access.js');

const main = async () => {
    let r = await dataAccess.ex14();
    console.log(r);
    process.exit()
}

main();