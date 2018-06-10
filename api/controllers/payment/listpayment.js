module.exports = {


  friendlyName: 'Listpayment',


  description: 'Listpayment payment.',


  inputs: {
    page : {
      type : "number",
      required : false,

    },
    per_page : {
      type : "number",
      required : false
    },
    userid : {
      type : "number",
      required : false
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    var result = {
      next_page_url : '/api/v1/payment/listpayment?page=1&per_page=3&sort=name%7Casc',
      prev_page_url : '/api/v1/payment/listpayment?page=1&per_page=3&sort=name%7Casc',
      current_page : 1,
      from : 1,
      to : 10,
      total : 100,
      last_page : 5,
      per_page : 10,
      data : []
    };
    try{
      if(!inputs.userid) inputs.userid=0;
      var PAYMENT_LIST_SQL = 'call sp_user_subs_list( $1, $2, $3 )';
       
      var rawResult = await sails.sendNativeQuery(PAYMENT_LIST_SQL, [ inputs.userid, inputs.page, inputs.per_page ]);

      result.data =rawResult.rows[0];

  }
  catch(err)
  {

  }
    return exits.success(result);

  }


};
