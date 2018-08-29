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
       
      lstbranch = await sails.helpers.branchlist();

  }
  catch(err)
  {
    console.log(err);
  }

    return exits.success(
      {
        cpage : "welcome",
        lstbranch : lstbranch,
        userType : this.req.session.userType,
        bid : this.req.session.bid
      }
    );

  }


};
