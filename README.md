# Example project for [vlquery](https://npmjs.com/vlquery)

1. To get started, install all dependencies
```
npm install
```

2. Create a `test_project` table on your postgres server and run the `db/main.sql` script in it.
3. Make sure to update the credentials in `vlquery.json` and `index.ts`

4. Create the database context with
```
npx vlquery create-context
```

> Whenever you make changes to the database, make sure to run the command again!

5. Compile your project and run it with
```
npm run build
npm run run
```