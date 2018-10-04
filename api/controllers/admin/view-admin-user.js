module.exports = {


  friendlyName: 'Admin view admin user',


  description: '',


  inputs: {

  },


  exits: {
    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/admin/adminUser.ejs'
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
  
  this.res.locals.layout = 'layouts/mlayout';
    return exits.success(
      {
        cpage : "admin",
        lstbranch : lstbranch,
        userType : this.req.session.userType,
      }
    );

  }


};
