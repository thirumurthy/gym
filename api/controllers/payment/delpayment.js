module.exports = {


  friendlyName: 'Delpayment',


  description: 'Delpayment payment.',


  inputs: {

    delreason : {
      type : "string",
      required : false
    },
    usersid : {
      type : "number",
      required : true
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode : '500'};

    try{
      if(!inputs.Sid) inputs.Sid=0;
      var PAYMENT_DEL_SQL = 'call sp_user_subs_delete( $1, $2, $3 )';
      
      var rawResult = await sails.sendNativeQuery(PAYMENT_DEL_SQL, [ inputs.usersid, this.req.session.userId , inputs.delreason ]);

      resp =rawResult.rows[0][0];

  }
  catch(err)
  {
    console.log(err);
  }

    return exits.success(resp);

  }


};
