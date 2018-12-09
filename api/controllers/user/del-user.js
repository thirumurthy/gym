module.exports = {


  friendlyName: 'Del user',


  description: '',


  inputs: {

    userid :  {
      type : "number",
      required : true,

    }
  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode : '500'};

    try{
      if(!inputs.UserId) inputs.UserId=0;
      var USER_DEL_SQL = 'call sp_user_del( $1, $2)';
      
      var rawResult = await sails.sendNativeQuery(USER_DEL_SQL, [ inputs.userid , this.req.session.userId ]);

      resp =rawResult.rows[0][0];

  }
  catch(err)
  {

  }

  return exits.success(resp);

  }


};
