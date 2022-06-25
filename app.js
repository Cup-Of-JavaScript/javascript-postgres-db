import postgres from 'postgres'

const sql = postgres('postgres://postgres:Ihgdp51505150!@localhost:5432/express')

const select = async () => {
    const result = await sql`select * from customer where customer_id = 1`
    console.log(result[0])
}

const insert = async () => {
    const result = await sql`select * from customer where customer_id = 1`
    console.log(result[0])
}

const main = async () => {
    await select()
    process.exit();
}

main()