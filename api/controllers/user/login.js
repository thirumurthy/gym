module.exports = {


  friendlyName: 'Login',


  description: 'Login user.',


  inputs: {
    username : {
      type : "string",
      required : true
    },
    password : {
      type : "string",
      required : true
    }


  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = "invaild";
    try{
      if(!inputs.eid) inputs.eid=0;
      var ADMIN_LOGIN_SQL = 'call sp_admin_login( $1, $2 )';
       
      var rawResult = await sails.sendNativeQuery(ADMIN_LOGIN_SQL, [ inputs.username, inputs.password ]);

      if(rawResult.rows[0][0].scode && rawResult.rows[0][0].scode=='200')
       {
        resp="1";
        this.req.session.userId=rawResult.rows[0][0].UserId;
        this.req.session.userType = rawResult.rows[0][0].userType;
        this.req.session.bid =  rawResult.rows[0][0].bid;
       } 
       

  }
  catch(err)
  {

  }

   
    return exits.success(resp);

  }


};
