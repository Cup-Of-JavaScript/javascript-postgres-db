import postgres from 'postgres'

const sql = postgres('postgres://postgres:Ihgdp51505150!@localhost:5432/express')

const main = async () => {
    const result = await sql`select * from customer where customer_id = 1`
    console.log(result[0])
    process.exit();
}

main()