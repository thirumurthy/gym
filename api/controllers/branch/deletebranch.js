module.exports = {


  friendlyName: 'Deletebranch',


  description: 'Deletebranch branch.',


  inputs: {

    bid : {
      type: "number",
      required : true
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var resp = { scode: '500' };

    try {
         
        var BRANCH_DELETE_SQL = 'call sp_branch_del( $1, $2 )';

        var rawResult = await sails.sendNativeQuery(BRANCH_DELETE_SQL, [inputs.bid,  this.req.session.userId]);

        resp = rawResult.rows[0][0];

    } catch (err) {
        console.log(err);
    }

    return exits.success(resp);

  }


};
