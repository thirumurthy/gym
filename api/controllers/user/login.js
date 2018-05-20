module.exports = {


  friendlyName: 'Login',


  description: 'Login user.',


  inputs: {
    username : {
      type : "string",
      required : true
    },
    password : {
      type : "string",
      required : true
    }


  },


  exits: {

  },


  fn: async function (inputs, exits) {

    this.req.session.userId='1';
    return exits.success("1");

  }


};
