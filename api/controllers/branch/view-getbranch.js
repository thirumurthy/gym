module.exports = {


  friendlyName: 'Branch view getbranch',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/branch/getbranch.ejs'
    },


  },


  fn: async function (inputs, exits) {
    

    this.res.locals.layout = 'layouts/layout';
    return exits.success(
      {
        cpage : "branch",
      }
    );

  }


};
