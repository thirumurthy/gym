module.exports = {


  friendlyName: 'Listbranch',


  description: 'Listbranch branch.',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var result = { data : [] };

    try{
       
      var BRANCH_LIST_SQL = 'call sp_branch_list(  )';
       
      var rawResult = await sails.sendNativeQuery(BRANCH_LIST_SQL, [  ]);

      result.data =rawResult.rows[0];

  }
  catch(err)
  {

  }
    return exits.success(result);

  }


};
