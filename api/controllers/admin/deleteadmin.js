module.exports = {


  friendlyName: 'Deleteadmin',


  description: 'Deleteadmin admin.',


  inputs: {

    userId : {
      type : "number",
      required : true
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {
    var resp = { scode: '500' };

    try {
         
        var ADMIN_DELETE_SQL = 'call sp_admin_del( $1, $2 )';

        var rawResult = await sails.sendNativeQuery(ADMIN_DELETE_SQL, [inputs.userId,  this.req.session.userId]);

        resp = rawResult.rows[0][0];

    } catch (err) {
        console.log(err);
    }

    return exits.success(resp);

  }


};
