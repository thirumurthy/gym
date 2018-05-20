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
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var result = {
      next_page_url : '/api/v1/user/listusers?page=1&per_page=3&sort=name%7Casc',
      prev_page_url : '/api/v1/user/listusers?page=1&per_page=3&sort=name%7Casc',
      current_page : 1,
      from : 1,
      to : 10,
      total : 100,
      last_page : 5,
      per_page : 10,
      data : []
    };
    try{
      if(!inputs.eid) inputs.eid=0;
      var EXPENSE_SAVE_SQL = 'call sp_getUser( $1, $2 )';
       
      var rawResult = await sails.sendNativeQuery(EXPENSE_SAVE_SQL, [ inputs.page, inputs.per_page ]);

      result.data =rawResult.rows[0][0];

  }
  catch(err)
  {

  }
    return exits.success(result);

  }


};
