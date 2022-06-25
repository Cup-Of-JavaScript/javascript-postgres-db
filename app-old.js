import postgres from 'postgres'

const sql = postgres('postgres://postgres:Ihgdp51505150!@localhost:5432/express')

const select = async () => {
    const result = await sql`select * from customer where customer_id = 1`
    console.log(result[0])
}

const insert = async () => {

    let customer_name = 'fred'
    
    const result = await sql`insert into customer (customer_name) values '${customer_name}')`
    console.log(result[0])
}

const main = async () => {
    //await select()
    await insert()

    process.exit();
}

main() // "type": "module",