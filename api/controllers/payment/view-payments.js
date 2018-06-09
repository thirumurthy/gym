module.exports = {


  friendlyName: 'Payment view payments',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/payment/payments.ejs'
    },

  },


  fn: async function (inputs, exits) {

    this.res.locals.layout = 'layouts/layout';
    return exits.success({
      cpage : "payment",
    });

  }


};
