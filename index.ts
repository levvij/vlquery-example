import { DbClient } from "vlquery";
import { db } from "./db/context";

// this has to only be done once
// for example in the main file of your express server
DbClient.connectedClient = new DbClient({
    user: "postgres",
    password: "postgres", 
    database: "test_project"
});

DbClient.connectedClient.connect().then(async () => {
	// lets get Bob. he is my favourite author!
	const bob = await db.person.first(item => item.firstname == "Bob");
	console.log(bob);

	// and a book from 2001
	const firstBookIn2001 = await bob.books.first(book => book.publishedAt.year == 2001);
	console.log(firstBookIn2001);

	// lets update the books page visits
	// just to demonstrate updates
	firstBookIn2001.pageVisits++;
	
    await firstBookIn2001.update();
});