import express from 'express';

const app = express();
const port = 3001;

app.get('/', (_req, res) => res.send('Hello'));
app.listen(port);
