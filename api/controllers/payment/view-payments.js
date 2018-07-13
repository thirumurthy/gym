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
var result = [];
    try{
      var SUBS_LIST_SQL = 'call sp_subs_list( )';
       
      var rawResult = await sails.sendNativeQuery(SUBS_LIST_SQL, [  ]);

      result =rawResult.rows[0];
    }
    catch(err){

    }
    this.res.locals.layout = 'layouts/layout';
    return exits.success({
      cpage : "payment",
      lstpack : result
    });

  }


};
