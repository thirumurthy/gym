module.exports = {


  friendlyName: 'Report view getreport',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/report/getreport.ejs'
    },


  },


  fn: async function (inputs, exits) {

    this.res.locals.layout = 'layouts/mlayout';
    return exits.success({
      cpage : "report",
    });

  }


};
