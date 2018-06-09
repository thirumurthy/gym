parasails.registerPage('getpackage', {
  //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
  //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
  //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
  data: {
    //…
    curPackage : {},
    formData: { /* … */ },
    prlst : [{ id:1, name : "Days"}, {id:2, name : "Month"}, {id:3, name:"Year"}],
   
    // Syncing / loading state
    syncing: false,
 
    cloudError: {},
    formErrors: {},
    lstbranch: [{ bid: "1", Name: "Malumichambatti" }],
    packageAddModalVisible: false,
    fields: [ 
        {
            name: 'Name',
            title: 'Name',
            sortField: 'Name'
        },
        {
            name: 'NoOfDays',
            title: 'Validity(Days)',
            sortField: 'NoOfDays'
        },
        {
            name: 'Amount',
            title: "Amount",
            sortField: 'Amount'
          },
          {
            name: 'SubType',
            title: "Type",
            sortField: 'SubType'
          },
          {
              name: 'branchname',
              title: 'Branch Name',
              sortField: 'branchname'
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
      this.packageAddModalVisible = true;
      this.curPackage = {};
      this.curPackage.Sid = 0;
      this.curPackage.ptype = 1;
      this.curPackage.period = 0;
    },
    getdays : function(){
        return this.curPackage.period * ( (this.curPackage.ptype==1) ? 1: (this.curPackage.ptype==2?30:365   ) ) ;
    },
    closePackageAddModel : function(){
      this.packageAddModalVisible = false;
    },
    handleParsingPackageSaveForm : function(){

      var _self = this; 
      this.curPackage.NoOfDays = this.getdays();
      Object.keys(this.curPackage ).forEach(function(key) {
          _self.curPackage[key] = (_self.curPackage[key]) ? _self.curPackage[key] : undefined;
      });
      var argins = this.curPackage;

      if (Object.keys(this.formErrors).length > 0) {
          return;
      }

      return argins;

    },
    submittedPackageSaveForm : function(response){

      if (response.scode == 200) {
         
        this.packageAddModalVisible = false;
        this.$refs.vuetable.refresh();
        this.$snotify.success('The Package Information saved successfully..!', 'Save Package', {
            timeout: 2000,
            showProgressBar: false,
            closeOnClick: false,
            pauseOnHover: true
        });
    } else {
        this.$snotify.error('Failed to save..!', 'Save Package', {
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
  this.packageAddModalVisible = true;
  this.curPackage = rowData; 
},
deleteRow(rowData) {
    var Sid = rowData.Sid;
  this.$snotify.confirm('Are you sure want to delete this Package?', 'Delete Package', {
      timeout: 0,
      closeOnClick: false,
      pauseOnHover: true,
      buttons: [
        { text: 'Yes', action: (toast) => {
            console.log('Clicked: Yes');
            this.$snotify.remove(toast.id);
            var route = "/api/v1/package/delpackage?sid="+Sid;
            $.get(route).then((response)=>{
                if (response.scode == 200) {
                     
                    this.$snotify.success('The Package has been deleted successfully..!', 'Delete Package', {
                        timeout: 2000,
                        showProgressBar: false,
                        closeOnClick: false,
                        pauseOnHover: true
                    });
                    this.$refs.vuetable.refresh();
                } else {
                    this.$snotify.error('Unable to delete this Package..!', 'Delete Package', {
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
