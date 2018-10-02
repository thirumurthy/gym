const fs = require('fs');

module.exports = {


  friendlyName: 'Process query',


  description: '',


  inputs: {

    filepath : {
      type : "string",
      required : true
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {
    var APIstatus='201';
    try {
      APIstatus = '200';

        var ADMIN_SQL;
        // First I want to read the file
        fs.readFile(inputs.filepath, async function read(err, data) {
            if (err) {
                throw err;
            }
            ADMIN_SQL = data;

            // Invoke the next step here however you like
            console.log(ADMIN_SQL);   // Put all of the code here (not the best solution)
             
            var rawResult = await sails.sendNativeQuery(ADMIN_SQL.toString('utf8'), [ ]);
            console.log(rawResult);
            APIstatus = '200';
            return exits.success({ "APIstatus" : APIstatus });
        });

    } catch (error) {
      return exits.success({ "APIstatus" : APIstatus });
    }
    

  }


};
