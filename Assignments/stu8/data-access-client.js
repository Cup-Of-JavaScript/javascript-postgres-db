const dataAccess = require('./data-access.js');

const main = async () => {
    let r = await dataAccess.ex16();
    console.log(r);
    process.exit()
}

main();
