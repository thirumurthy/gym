module.exports = {


  friendlyName: 'Listusers',


  description: 'Listusers user.',


  inputs: {

    page : {
      type : "number",
      required : false,

    },
    per_page : {
      type : "number",
      required : false
    },
    Branch : {
      type : "string",
      required : false
    },
    filter : {
      type : "string",
      required : false
    },
    tabselection : {
      type : "number",
      required : false
    },
    sort : {
      type : "string",
      required : false
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var result = { 
      data : []
    };
    try{
      if(!inputs.eid) inputs.eid=0;
      var GET_USER_LIST_SQL = 'call sp_getUser( $1, $2, $3, $4, $5, $6, $7 )';
       
      if(!inputs.Branch && this.req.session.userType>1)
      {
        inputs.Branch =  this.req.session.bid ;
      }

      var rawResult = await sails.sendNativeQuery(GET_USER_LIST_SQL, [ inputs.page, inputs.per_page, inputs.Branch, inputs.filter, this.req.session.userId, inputs.tabselection||1 , inputs.sort]);

      result = await sails.helpers.formatresp(inputs.page, inputs.per_page,rawResult.rows[0],"user",inputs.filter, inputs.Branch, inputs.tabselection);

      
      

  }
  catch(err)
  {
    console.log(err);
  }
    return exits.success(result);

  }


};
