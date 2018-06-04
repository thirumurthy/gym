module.exports = {


  friendlyName: 'Savepackage',


  description: 'Savepackage package.',


  inputs: {

    Sid : {
      type : "number",
      required : false
    },
    NoOfDays : {
      type : "number",
      required : true
    },
    Amount : {
      type : "number",
      required : true
    },
    SType : {
      type : "number",
      required : true
    },
    bid : {
      type : "number",
      required : true
    },
    Name : {
      type : "string",
      required : true
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode : '500'};

    try{
      if(!inputs.Sid) inputs.Sid=0;
      var USER_SAVE_SQL = 'call sp_subs_save( $1, $2 , $3, $4, $5, $6, $7 )';
      
      var rawResult = await sails.sendNativeQuery(USER_SAVE_SQL, [ inputs.Sid, inputs.NoOfDays , inputs.Amount , inputs.SType , inputs.bid, this.req.session.userId , inputs.Name ]);

      resp =rawResult.rows[0][0];

  }
  catch(err)
  {
    console.log(err);
  }


    return exits.success(resp);

  }


};
