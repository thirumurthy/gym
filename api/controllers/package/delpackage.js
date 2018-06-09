module.exports = {


  friendlyName: 'Delpackage',


  description: 'Delpackage package.',


  inputs: {

    sid : {
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
      var SUBS_DEL_SQL = 'call sp_subs_del( $1, $2 )';
      
      var rawResult = await sails.sendNativeQuery(SUBS_DEL_SQL, [ inputs.sid, this.req.session.userId  ]);

      resp =rawResult.rows[0][0];

  }
  catch(err)
  {
    console.log(err);
  }

    return exits.success(resp);

  }


};
