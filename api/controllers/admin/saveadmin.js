module.exports = {


  friendlyName: 'Saveadmin',


  description: 'Saveadmin admin.',


  inputs: {

    UserId : {
      type : "number",
      required : false
    },
    Name : {
      type :"string",
      required : true
    },
    Username : {
      type : "string",
      required : true
    },
    password : {
      type : "string",
      required : false
    },
    userType : {
      type : "number",
      required : false
    },
    bid : {
      type : "number",
      required : false
    },
    phone : {
      type : "string",
      required : false
    },

    isLock : {
      type : "number",
      required : false
    }
  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode : '500'};

    try{
      if(!inputs.UserId) inputs.UserId=0;
      var ADMIN_SAVE_SQL = 'call sp_admin_save( $1, $2 , $3, $4, $5, $6, $7, $8, $9)';
      
      var rawResult = await sails.sendNativeQuery(ADMIN_SAVE_SQL, [ inputs.UserId, inputs.Name, inputs.password,   inputs.bid, inputs.userType, inputs.Username,  inputs.phone, this.req.session.userId, inputs.isLock ]);

      resp =rawResult.rows[0][0];

  }
  catch(err)
  {
    console.log(err);
  }

  return exits.success(resp);


  }


};
