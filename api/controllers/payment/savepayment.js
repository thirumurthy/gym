module.exports = {


  friendlyName: 'Savepayment',


  description: 'Savepayment payment.',


  inputs: {
    UserSid : {
      type : "number",
      required : false
    },
    UserId : {
      type : "number",
      required : true
    },
    Sid :{
      type : "number",
      required : true
    },
    JoinDate : {
      type: "string",
      required : true
    },

    ExpireDate : {
      type : "string",
      required : true
    },
    SType : {
      type : "number",
      required : true
    },
    PaidAmount : {
      type : "number",
      required : true
    },
    BalanceAmount :{
      type:"number",
      required : true
    },
    PaymentStatus : {
      type : "number",
      required : true
    },
    DueDate: {
      type : "string",
      required : false
    },
    Notes : {
      type : "string",
      required : false
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode : '500'};

    try{
       
      var PAY_SAVE_SQL = 'call sp_user_subs_pay( $1, $2 , $3, $4, $5, $6, $7, $8, $9, $10, $11, $12 )';
      
      var rawResult = await sails.sendNativeQuery(PAY_SAVE_SQL, [ inputs.UserSid||0, inputs.UserId, inputs.Sid, inputs.JoinDate, inputs.ExpireDate, inputs.SType, inputs.PaidAmount, inputs.PaymentStatus, this.req.session.userId , inputs.Notes||'', inputs.BalanceAmount, inputs.DueDate ]);

      resp =rawResult.rows[0][0];

  }
  catch(err)
  {
    console.log(err);
  }

    return exits.success(resp);

  }


};
