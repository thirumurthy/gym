parasails.registerPage('payments', {
  //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
  //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
  //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
  data: {
    //…
    curPayment : {},
    formData: { /* … */ },
    // Syncing / loading state
    syncing: false,
 
    cloudError: {},
    formErrors: {},
    lsttype : [{pid:0,Name :"--SELECT--"},{pid : 1,Name : "Fees"},{ pid : 2, Name : "Personal Trainee"},{ pid : 3, Name: "Diet"}],
    paymentAddModalVisible: false,
    moreParams : {userid : 0 },
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
  beforeMount: function() {
    // Attach any initial data from the server.
    _.extend(this, SAILS_LOCALS);
    this.moreParams.userid=jutil.getParameterByName("userid");
  },
  mounted: async function() {
    //…
    
  },

  //  ╦╔╗╔╔╦╗╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
  //  ║║║║ ║ ║╣ ╠╦╝╠═╣║   ║ ║║ ║║║║╚═╗
  //  ╩╝╚╝ ╩ ╚═╝╩╚═╩ ╩╚═╝ ╩ ╩╚═╝╝╚╝╚═╝
  methods: {
    //…

    openPaymentAddModel : function(){
      this.paymentAddModalVisible = true;
      var curdate = (this.curPayment.JoinDate || '');
             
            $(function() {
                $('#joindate').datepicker({
                    // date format
                    format: 'dd/MM/yyyy',

                    // placeholder text
                    placeholder: 'Please select Join Date',
                    // default date
                    defaultValue: curdate,
                });
            });

    },
    closePaymentAddModel : function(){
      this.paymentAddModalVisible = false;
    },

    handleParsingPaymentSaveForm : function(){
        var _self = this;
            this.curPayment.JoinDate = $("#joindate").val();
            this.curPayment.UserId = jutil.getParameterByName("userid"); 
            this.curPayment.ExpireDate =  $("#ExpireDate").val();
            this.curPayment.SType = 1;
            this.curPayment.PaymentStatus = 1;

            Object.keys(this.curPayment).forEach(function(key) {
                _self.curPayment[key] = (_self.curPayment[key]) ? _self.curPayment[key] : undefined;
            });
            var argins = this.curPayment;

            if (Object.keys(this.formErrors).length > 0) {
                return;
            }

            return argins;
    },
    
    submittedPaymentSaveForm : function(response){
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
  var curdate = (this.curPayment .JoinDate || '');
            setTimeout(() => {
                $('#joindate').datepicker({
                    format: 'dd/MM/yyyy',
                    placeholder: 'Please select Join Date',
                    defaultValue: curdate,
                });
            }, 600);
             
},

 humaniseDays : function(diff) {
    // The string we're working with to create the representation
    var str = '';
    // Map lengths of `diff` to different time periods
    var values = [[' year', 365], [' month', 30], [' day', 1]];
  
    // Iterate over the values...
    for (var i=0;i<values.length;i++) {
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
      { text: 'Yes', action: (toast) => {
          console.log('Clicked: Yes');
          this.$snotify.remove(toast.id);
          var route = "/api/v1/payment/delpayment?usersid="+UserSid;
          $.get(route).then((response)=>{
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

      }, bold: false },

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
