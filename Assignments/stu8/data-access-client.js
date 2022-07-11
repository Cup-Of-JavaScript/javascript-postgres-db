const dataAccess = require('./data-access.js');

const main = async () => {
    let r = await dataAccess.ex17();
    console.log(r);
    process.exit()
}

main();
