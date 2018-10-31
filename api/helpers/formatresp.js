module.exports = {


  friendlyName: 'Formatresp',


  description: 'Formatresp something.',


  inputs: {

    page : {
      type : "number",
      required : true,

    },
    per_page : {
      type : "number",
      required : true
    },

    response : {
      type : "ref",
      required : true
     },

     type : {
       type : "string",
       required : true
     },
     filter : {
       type : "string",
       required : false
     },
     Branch : {
       type : "string",
       required : false
     },
     tabselection : {
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
      per_page : 50,
      data : []
    };
    try {
      result.current_page = inputs.page ;
      if(inputs.response.length>0)
      {
        result.total = inputs.response[0].Count;
        result.last_page = Math.ceil(result.total / result.per_page );
        result.data = inputs.response;
        result.from = (result.current_page ==1? 1 : (result.current_page -1 * result.per_page));
        result.to = result .from + result.per_page ;
        switch (inputs.type){
          case "user":
            result.next_page_url = "/api/v1/user/listusers?page="+(result.current_page+1)+"&per_page="+result.per_page+"&filter="+inputs.filter+"&Branch="+inputs.Branch+"&tabselection="+inputs.tabselection||1;
            result.prev_page_url = "/api/v1/user/listusers?page="+(result.current_page-1)+"&per_page="+result.per_page+"&filter="+inputs.filter+"&Branch="+inputs.Branch+"&tabselection="+inputs.tabselection||1;
          break;
          case "admin":
            result.next_page_url = "/api/v1/admin/listadmin?page="+(result.current_page+1)+"&per_page="+result.per_page+"&filter="+inputs.filter+"&Branch="+inputs.Branch+"&tabselection="+inputs.tabselection||1;
            result.prev_page_url = "/api/v1/admin/listadmin?page="+(result.current_page-1)+"&per_page="+result.per_page+"&filter="+inputs.filter+"&Branch="+inputs.Branch+"&tabselection="+inputs.tabselection||1;
          break;
        }

      }

    }
    catch(err)
     {
      console.log(err);
     }
    return exits.success(result);

  }


};

