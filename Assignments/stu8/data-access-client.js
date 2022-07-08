const dataAccess = require('./data-access.js');

const main = async () => {
    let r = await dataAccess.ex15();
    console.log(r);
    process.exit()
}

main();
