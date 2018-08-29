module.exports = {


  friendlyName: 'Listadmin',


  description: 'Listadmin admin.',


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
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var result = { data : [] };

    try{
       
      var ADMIN_LIST_SQL = 'call sp_admin_list( $1,$2, $3, $4 )';
       
      var rawResult = await sails.sendNativeQuery(ADMIN_LIST_SQL, [ inputs.page, inputs.per_page, inputs.Branch, inputs.filter ]);
 
      result = await sails.helpers.formatresp(inputs.page, inputs.per_page,rawResult.rows[0],"admin",inputs.filter, inputs.Branch);

  }
  catch(err)
  {
    console.log(err);
  }
    return exits.success(result);

  }


};
