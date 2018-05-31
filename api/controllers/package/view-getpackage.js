module.exports = {


  friendlyName: 'Package view getpackage',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/package/getpackage.ejs'
    },

  },


  fn: async function (inputs, exits) {

    this.res.locals.layout = 'layouts/layout';
    return exits.success();

  }


};
