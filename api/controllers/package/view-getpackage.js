module.exports = {


  friendlyName: 'Package view getpackage',


  description: '',


  inputs: {

  },


  exits: {

    success: {
      statusCode: 200,
       
      viewTemplatePath: 'pages/package/getpackage.ejs'
    },

  },


  fn: async function (inputs, exits) {
    var lstdata = [];
    try{
       lstdata = await sails.helpers.http.get(this.req.baseUrl+"/api/v1/branch/listbranch");
    }
    catch(err){
      console.log(err);
    }
    this.res.locals.layout = 'layouts/mlayout';
    
    return exits.success({
      cpage : "package",
      lstbranch : lstdata.data ,
      userType : this.req.session.userType,
    });

  }


};
