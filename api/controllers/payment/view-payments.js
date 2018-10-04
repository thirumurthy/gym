module.exports = {


  friendlyName: 'Payment view payments',


  description: '',


  inputs: {

    bid : {
      type : "number",
      required : false
    },
    userid  : {
      type : "number",
      required : false
    }

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/payment/payments.ejs'
    },

  },


  fn: async function (inputs, exits) {
var result = [], userobj= { UserId : 0 };
    try{
       result = await sails.helpers.http.get(this.req.baseUrl+"/api/v1/package/listpackage?bid="+(inputs.bid|0));

       var GYM_USER_GET_SQL = 'call sp_user_getbyid( $1 )';
      
      var rawResult = await sails.sendNativeQuery(GYM_USER_GET_SQL, [ inputs.userid  ]);

      userobj =rawResult.rows[0][0];


    }
    catch(err){
console.log(err);
    }
    this.res.locals.layout = 'layouts/mlayout';
    return exits.success({
      cpage : "payment",
      lstpack : result.data,
      userDetails : userobj,
      userType : this.req.session.userType,
    });

  }


};
