module.exports = {


  friendlyName: 'Branchlist',


  description: 'Branchlist something.',


  inputs: {
    

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var lstbranch = [];
    try{
     
      var BRANCH_LIST_SQL = 'call sp_branch_list(  )';
       
      var rawResult = await sails.sendNativeQuery(BRANCH_LIST_SQL, [  ]);

      lstbranch =rawResult.rows[0];

  }
  catch(err)
  {
    console.log(err);
  }

    // All done.
    return exits.success(lstbranch);

  }


};

