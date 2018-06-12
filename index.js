const express = require('express')
const bodyParser = require('body-parser')
const mjml = require('mjml')

// create express app
const app = express()
const port = 8000

// parse requests of content-type - application/json
app.use(bodyParser.json())

// define a simple route
app.get('/', (req, res) => {
    res.json({"message": "MJML Api Server", "version": "0.0.1"})
});

app.post('/render', (req, res) => {
	if (!req.body.hasOwnProperty('mjml')) {
		res.status(400).json({status: "error", message: "mjml param missing in your request"})
		return
	}

    res.json(mjml(req.body.mjml, {minify: true}))
});

// listen for requests
const server = app.listen(port, () => {
    console.log("Server is listening on port %d", server.address().port);
});
