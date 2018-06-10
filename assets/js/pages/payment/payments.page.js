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
    paymentAddModalVisible: false,
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
  },
  mounted: async function() {
    //…
  },

  //  ╦╔╗╔╔╦╗╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
  //  ║║║║ ║ ║╣ ╠╦╝╠═╣║   ║ ║║ ║║║║╚═╗
  //  ╩╝╚╝ ╩ ╚═╝╩╚═╩ ╩╚═╝ ╩ ╩╚═╝╝╚╝╚═╝
  methods: {
    //…

    openPackageAddModel : function(){
      this.paymentAddModalVisible = true;
    },
    closePackageAddModel : function(){
      this.packageAddModalVisible = false;
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
