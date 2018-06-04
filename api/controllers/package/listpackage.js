module.exports = {


  friendlyName: 'Listpackage',


  description: 'Listpackage package.',


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
      next_page_url : '/api/v1/package/listpackage?page=1&per_page=3&sort=name%7Casc',
      prev_page_url : '/api/v1/package/listpackage?page=1&per_page=3&sort=name%7Casc',
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
      var SUBS_LIST_SQL = 'call sp_subs_list( )';
       
      var rawResult = await sails.sendNativeQuery(SUBS_LIST_SQL, [  ]);

      result.data =rawResult.rows[0];

  }
  catch(err)
  {
    console.log(err);
  }

    return exits.success(result);

  }


};
