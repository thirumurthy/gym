parasails.registerPage('payments', {
    //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
    //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
    //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
    data: {
        //…
        curPayment: { PaidAmount: 0, UserSid: 0 },
        formData: { /* … */ },
        // Syncing / loading state
        syncing: false,

        cloudError: {},
        formErrors: {},
        lstpack: [],
        userType: 0,
        userDetails: { UserId: 0 },
        lstsubpack: [],
        lsttype: [{ pid: 0, Name: "--SELECT--" }, { pid: 1, Name: "Fees" }, { pid: 2, Name: "Personal Trainee" }, { pid: 3, Name: "Diet" }],
        paymentAddModalVisible: false,
        moreParams: { userid: 0 },
        fields: [
            {
                name: 'UserName',
                title: 'Name',
                sortField: 'UserName'
            },
           
            {
                name: 'PaidAmount',
                title: 'Paid Amount',
                sortField: 'PaidAmount'
            },
            {
                name: 'BalanceAmount',
                title: 'Balance Amount',
                sortField: 'BalanceAmount'
            },
            {
                name: 'JoinDate',
                title: "Join Date",
                sortField: 'JoinDate'
            },
            {
                name: 'ExpireDate',
                title: "Expire Date",
                sortField: 'ExpireDate'
            },
            {
                name: 'SubType',
                title: 'Type',
                sortField: 'SubType'
            },
            {
                name: 'PaidBy',
                title: 'Paid By',
                sortField: 'PaidBy'
            },
            '__slot:actions'
        ],
        sortOrder: [
            { field: 'name', direction: 'asc' }
        ],
        css: {
            table: {
                tableClass: 'table table-striped table-bordered table-hovered',
                loadingClass: 'loading',
                ascendingIcon: 'glyphicon glyphicon-chevron-up',
                descendingIcon: 'glyphicon glyphicon-chevron-down',
                handleIcon: 'glyphicon glyphicon-menu-hamburger',
            },
            pagination: {
                infoClass: 'pull-left',
                wrapperClass: 'vuetable-pagination pull-right',
                activeClass: 'btn-primary',
                disabledClass: 'disabled',
                pageClass: 'btn btn-border',
                linkClass: 'btn btn-border',
                icons: {
                    first: '',
                    prev: '',
                    next: '',
                    last: '',
                },
            }
        }

    },

    //  ╦  ╦╔═╗╔═╗╔═╗╦ ╦╔═╗╦  ╔═╗
    //  ║  ║╠╣ ║╣ ║  ╚╦╝║  ║  ║╣
    //  ╩═╝╩╚  ╚═╝╚═╝ ╩ ╚═╝╩═╝╚═╝
    beforeMount: function () {
        // Attach any initial data from the server.
        _.extend(this, SAILS_LOCALS);
        this.moreParams.userid = jutil.getParameterByName("userid");
        Date.prototype.addDays = function (days) {
            var date = new Date(this.valueOf());
            date.setDate(date.getDate() + days);
            return date;
        }

    },
    mounted: async function () {
        //…

    },

    //  ╦╔╗╔╔╦╗╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
    //  ║║║║ ║ ║╣ ╠╦╝╠═╣║   ║ ║║ ║║║║╚═╗
    //  ╩╝╚╝ ╩ ╚═╝╩╚═╩ ╩╚═╝ ╩ ╩╚═╝╝╚╝╚═╝
    methods: {
        //…

        // v-if="curPayment.ptype==slgpack.SType"
        updatePackage: function () {
            this.lstsubpack = [];
            for (var i = 0; i < this.lstpack.length; i++) {
                if (this.curPayment.ptype == this.lstpack[i].SType)
                    this.lstsubpack.push(this.lstpack[i]);
            }
        },
        getUpdatedDate: function (curdate, days) {
            var parts = curdate.split("/")
            // Please pay attention to the month (parts[1]); JavaScript counts months from 0:
            // January - 0, February - 1, etc.
            var mydate = new Date(parts[2], parts[1] - 1, parts[0]);
            return mydate.addDays(days);

        },
        updateDiffDays: function () {
            if (!$("#joindate").val()) {
                var curdate = new Date();
                var formatteddate = curdate.getDate() + '/' + (curdate.getMonth() + 1) + "/" + curdate.getFullYear();
                $("#joindate").val(formatteddate);
                $("#joindate").datepicker('setDate', formatteddate);
            }

            var parts = $("#joindate").val().split("/")
            // Please pay attention to the month (parts[1]); JavaScript counts months from 0:
            // January - 0, February - 1, etc.
            var mydate = new Date(parts[2], parts[1] - 1, parts[0]);
            mydate = mydate.addDays(this.curPayment.pack.NoOfDays);

            $("#ExpireDate").val(mydate.getDate() + '/' + (mydate.getMonth() + 1) + "/" + mydate.getFullYear());
            $("#ExpireDate").datepicker('setDate', mydate);
        },
        updatePackPrice: function () {

            console.log(this.curPayment.pack);
            this.curPayment.PaidAmount = this.curPayment.pack.Amount;
            this.curPayment.Sid = this.curPayment.pack.Sid;
            this.updateDiffDays();



        },
        openPaymentAddModel: function () {
            this.paymentAddModalVisible = true;
            var curdate = (this.curPayment.JoinDate || '');
            var curExpireDate = (this.curPayment.ExpireDate || '');
            var _self = this;
            $(function () {
                $('#joindate').datepicker({
                    // date format
                    format: 'dd/MM/yyyy',

                    // placeholder text
                    placeholder: 'Vaild from',
                    // default date
                    defaultValue: new Date(),
                });
                $('#ExpireDate').datepicker({
                    // date format
                    format: 'dd/MM/yyyy',

                    // placeholder text
                    placeholder: 'Expired on',
                    // default date
                    defaultValue: curExpireDate,
                });
                $("#joindate").on('pick.datepicker', function (event) {
                    console.log('newDate: ' + event.newDate);
                    console.log('oldDate: ' + event.oldDate);
                    $("#ExpireDate").datepicker('setDate', _self.getUpdatedDate(event.newDate, _self.curPayment.pack.NoOfDays));

                    //_self.updateDiffDays();
                });


            });

        },
        closePaymentAddModel: function () {
            this.paymentAddModalVisible = false;
        },

        handleParsingPaymentSaveForm: function () {
            var _self = this;
            _self.curPayment.UserSid = (_self.curPayment.UserSid || 0);
            this.curPayment.JoinDate = $("#joindate").val();
            this.curPayment.UserId = jutil.getParameterByName("userid") || this.curPayment.UserId;
            this.curPayment.ExpireDate = $("#ExpireDate").val();
            this.curPayment.SType = 1;
            this.curPayment.PaymentStatus = 1;

            Object.keys(this.curPayment).forEach(function (key) {
                _self.curPayment[key] = (_self.curPayment[key]) ? _self.curPayment[key] : undefined;
            });
            var argins = this.curPayment;

            if (Object.keys(this.formErrors).length > 0) {
                return;
            }

            return argins;
        },

        submittedPaymentSaveForm: function (response) {
            if (response.scode == 200) {

                this.paymentAddModalVisible = false;
                this.$refs.vuetable.refresh();
                this.$snotify.success('The Payment Information saved successfully..!', 'Save Payment', {
                    timeout: 2000,
                    showProgressBar: false,
                    closeOnClick: false,
                    pauseOnHover: true
                });
            } else {
                this.$snotify.error('Failed to save..!', 'Save Payment', {
                    timeout: 2000,
                    showProgressBar: false,
                    closeOnClick: false,
                    pauseOnHover: true
                });

            }

        },

        onLoading() {
            console.log('loading... show your spinner here')
        },
        onLoaded() {
            console.log('loaded! .. hide your spinner here')
        },
        onPaginationData(paginationData) {
            this.$refs.pagination.setPaginationData(paginationData)
        },
        onChangePage(page) {
            this.$refs.vuetable.changePage(page)
        },
        editRow(rowData) {
            this.paymentAddModalVisible = true;
            this.curPayment = rowData;
            var _self = this;
            var curdate = (this.curPayment.JoinDate || '');
            setTimeout(() => {
                // _self.updatePackage();
                // _self.curPayment.pack = rowData.pack;
                $("#joindate").on('pick.datepicker', function (event) {
                    console.log('newDate: ' + event.newDate);
                    console.log('oldDate: ' + event.oldDate);
                    $("#ExpireDate").datepicker('setDate', _self.getUpdatedDate(event.newDate, _self.curPayment.NoOfDays));

                    //_self.updateDiffDays();
                });



                $('#joindate').datepicker({
                    format: 'dd/MM/yyyy',
                    placeholder: 'Please select Join Date',
                    defaultValue: curdate,
                });
            }, 600);
            if (this.curPayment.ExpireDate) {
                setTimeout(() => {
                    // _self.updatePackage();
                    // _self.curPayment.pack = rowData.pack;
                    $('#ExpireDate').datepicker({
                        format: 'dd/MM/yyyy',
                        placeholder: 'Please select Join Date',
                        defaultValue: _self.curPayment.ExpireDate,
                    });
                }, 600);
            }

        },

        humaniseDays: function (diff) {
            // The string we're working with to create the representation
            var str = '';
            // Map lengths of `diff` to different time periods
            var values = [[' year', 365], [' month', 30], [' day', 1]];

            // Iterate over the values...
            for (var i = 0; i < values.length; i++) {
                var amount = Math.floor(diff / values[i][1]);

                // ... and find the largest time value that fits into the diff
                if (amount >= 1) {
                    // If we match, add to the string ('s' is for pluralization)
                    str += amount + values[i][0] + (amount > 1 ? 's' : '') + ' ';

                    // and subtract from the diff
                    diff -= amount * values[i][1];
                }
            }

            return str;
        },

        deleteRow(rowData) {
            var UserSid = rowData.UserSid;
            this.$snotify.confirm('Are you sure want to delete this Payment?', 'Delete Payment', {
                timeout: 0,
                closeOnClick: false,
                pauseOnHover: true,
                buttons: [
                    {
                        text: 'Yes', action: (toast) => {
                            console.log('Clicked: Yes');
                            this.$snotify.remove(toast.id);
                            var route = "/api/v1/payment/delpayment?usersid=" + UserSid;
                            $.get(route).then((response) => {
                                if (response.scode == 200) {

                                    this.$snotify.success('The Payment has been deleted successfully..!', 'Delete Payment', {
                                        timeout: 2000,
                                        showProgressBar: false,
                                        closeOnClick: false,
                                        pauseOnHover: true
                                    });
                                    this.$refs.vuetable.refresh();
                                } else {
                                    this.$snotify.error('Unable to delete this Payment..!', 'Delete Payment', {
                                        timeout: 2000,
                                        showProgressBar: false,
                                        closeOnClick: false,
                                        pauseOnHover: true
                                    });
                                }
                            });

                        }, bold: false
                    },

                    {
                        text: 'No',
                        action: (toast) => {
                            console.log('Clicked: No');
                            this.$snotify.remove(toast.id);
                        },
                        bold: true
                    },
                ]
            });
            //alert("You clicked delete on"+ JSON.stringify(rowData))
        },

    }
});
