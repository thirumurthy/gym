module.exports = {


  friendlyName: 'Uploadfile',


  description: 'Uploadfile files.',


  inputs: {

    utype : {
      type : "string",
      required : true
    },
    userid : {
      type : "number",
      required : true
    },
    id : {
      type : "string",
      required : true
    }

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    try{
      var req = this.req, res = this.res;
      req.file('avatar').upload({
        dirname: require('path').resolve(sails.config.appPath, 'assets/userfiles/'+inputs.utype+"/"+inputs.userid+"/"+inputs.id)
      }, async function (err, uploadedFiles) {
        if (err) return res.serverError(err);
        else
        {
          // update file name to database.
          if(uploadedFiles.length==1)
          {
            var UPLOAD_FILE_SQL = 'call sp_file_update( $1, $2, $3, $4, $5, $6, $7 )';
      
            var rawResult =await  sails.sendNativeQuery(UPLOAD_FILE_SQL, [ req.session.userId , inputs.id, inputs.userid, inputs.utype, uploadedFiles[0].fd, uploadedFiles[0].fd.replace(/^.*[\\\/]/, ''), uploadedFiles[0].filename ]);

            var resp =rawResult.rows[0][0];
          }
          

        }
        return res.json({
          message: uploadedFiles.length + ' file(s) uploaded successfully!'
        });
      });

    }
    catch(err)
    {
      return exits.success({ scode : "400" });
    }
    

  }


};
