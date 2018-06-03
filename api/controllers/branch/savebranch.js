module.exports = {


    friendlyName: 'Savebranch',


    description: 'Savebranch branch.',


    inputs: {

        bid: {
            type: "number",
            required: false
        },

        Place: {
            type: "string",
            required: true
        },

        Name: {
            type: "string",
            required: true
        }

    },


    exits: {

    },


    fn: async function(inputs, exits) {


        var resp = { scode: '500' };

        try {
            if (!inputs.bid) inputs.bid = 0;
            var USER_SAVE_SQL = 'call sp_branch_save( $1, $2 , $3, $4)';

            var rawResult = await sails.sendNativeQuery(USER_SAVE_SQL, [inputs.bid, inputs.Place, inputs.Name, this.req.session.userId]);

            resp = rawResult.rows[0][0];

        } catch (err) {
            console.log(err);
        }

        return exits.success(resp);

    }


};