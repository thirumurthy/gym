var glob = require("glob");
module.exports = {


  friendlyName: 'Admin view query import',


  description: '',


  inputs: {

  },


  exits: {
    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/admin/queryImport.ejs'
    },
  },


  fn: async function (inputs, exits) {

    var allfiles=[];
    await glob("scripts/SQLFiles/**/*.sql", async function (er, files) {
      allfiles = files;
      console.log(files);
      return exits.success({ FileList : allfiles, cpage :"query"});
    });

    

  }


};
