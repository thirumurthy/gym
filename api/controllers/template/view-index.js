module.exports = {


  friendlyName: 'Template view index',


  description: '',


  inputs: {

  },


  exits: {


    success: {
      viewTemplatePath: 'pages/template/index',
    },

    redirect: {
      description: 'The requesting user is already logged in.',
      responseType: 'redirect'
    }

  },


  fn: async function (inputs, exits) {

    this.res.locals.layout = 'layouts/layout-main';
    return exits.success();

  }


};
