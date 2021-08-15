var express = require('express');
var router = express.Router();

/* Register soap client */
const soap = require('soap')

//TODO: Read wsdlUrl from environment
var wsdlUrl = 'http://localhost:5000/Services/HrService.asmx?wsdl';

/* GET staff listing from soap client */
router.get('/', function (req, res, next) {
  soap.createClient(wsdlUrl, function (err, client) {
    client.GetStaffList(function (err, result) {
      res.send(result);
    });
  });
});

module.exports = router;