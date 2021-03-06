module.exports = {


  friendlyName: 'Save',


  description: 'Save user.',


  inputs: {

    UserId : {
      type : "number",
      required : true
    },
    Name : {
      type :"string",
      required : true
    },
    EmailId : {
      type : "string",
      required : false
    },
    DOB : {
      type : "string",
      required : false
    },
    Address : {
      type : "string",
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
    JoinDate : {
      type : "string",
      required : false
    },
    height : {
      type : "string",
      required : false
    },
    weight : {
      type : "string",
      required : false
    },

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode : '500'};

      try{
        if(!inputs.UserId) inputs.UserId=0;
        var USER_SAVE_SQL = 'call sp_saveUser( $1, $2 , $3, $4, $5, $6, $7, $8, $9, $10, $11)';
        
        var rawResult = await sails.sendNativeQuery(USER_SAVE_SQL, [ inputs.UserId, inputs.Name, inputs.EmailId, inputs.DOB, inputs.Address, inputs.bid, inputs.phone, inputs.JoinDate, inputs.height, inputs.weight, this.req.session.userId ]);

        resp =rawResult.rows[0][0];

    }
    catch(err)
    {

    }

    return exits.success(resp);

  }


};
