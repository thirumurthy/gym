module.exports = {


  friendlyName: 'Report view getreport',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/report/getreport.ejs'
    },


  },


  fn: async function (inputs, exits) {

    this.res.locals.layout = 'layouts/mlayout';
    var lstbranch = [];
    try{
       
      lstbranch = await sails.helpers.branchlist();

      }
      catch(err)
      {
        console.log(err);
      }

    return exits.success({
      cpage : "report",
      userType : this.req.session.userType,
      lstbranch : lstbranch,
    });

  }


};
