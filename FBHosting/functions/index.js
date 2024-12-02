const functions = require('firebase-functions');
const jwtDecode = require('jwt-decode');
const express = require("express");
const app1 = express();

app1.post("/callback", (request, response) => {
	var decodeObject = jwtDecode(request.body.id_token)
	response.send(decodeObject);
})

const api1 = functions.https.onRequest(app1);

module.exports = {
  api1
}