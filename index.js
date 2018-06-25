const port = 3000
const spdy = require('spdy')
const express = require('express')
const path = require('path')
const fs = require('fs')

const app = express()

app.get('*', (req, res) => {
  res
    .status(200)
    .json({message: 'ok'})
})

const options = {
  key: fs.readFileSync('/var/certs/lrndev.key'),
  cert: fs.readFileSync('/var/certs/lrndev.crt')
}

spdy
  .createServer(options, app)
  .listen(port, (error) => {
    if (error) {
      console.error(error)
      return process.exit(1)
    } else {
      console.log('Listening on port: ' + port + '.')
    }
  })