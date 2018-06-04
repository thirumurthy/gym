module.exports = {


  friendlyName: 'View welcome page',


  description: 'Display the dashboard "Welcome" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/dashboard/welcome',
      description: 'Display the welcome page for authenticated users.'
    },

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

    return exits.success(
      {
        lstbranch : lstbranch
      }
    );

  }


};
