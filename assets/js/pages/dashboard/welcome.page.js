///////////////////////////////////////
///////// reference : https://codepen.io/ratiw/pen/GmJayw
///////// reference : https://github.com/ratiw/vuetable-2
//////////////////////////////////////



Vue.use(Vuetable);

parasails.registerPage('welcome', {
  //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
  //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
  //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
   
  

  components: {
    'vuetable-pagination': Vuetable.VuetablePagination
   },
   data: {
    dashboardModalVisible: false,
     fields: [
       { 
         name: 'id', 
         title: '<span class="orange glyphicon glyphicon-user"></span>Mucle Zone ID',
         sortField: 'id'
       }, 
       {
         name: 'Name',
         title: 'Name',
         sortField: 'Name'
       },
       {
         name:'ExpireDays',
         title: "Expire In",
         sortField: 'ExpireDays'
       }
       ,
       {
         name: 'JoinDate',
         title: 'Joined Date',
         sortField: 'JoinDate'
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


    onPaginationData (paginationData) {
      this.$refs.pagination.setPaginationData(paginationData)
    },
    onChangePage (page) {
      this.$refs.vuetable.changePage(page)
    },
    editRow(rowData){
      alert("You clicked edit on"+ JSON.stringify(rowData))
    },
    deleteRow(rowData){
      alert("You clicked delete on"+ JSON.stringify(rowData))
    },
    onLoading() {
      console.log('loading... show your spinner here')
    },
    onLoaded() {
      console.log('loaded! .. hide your spinner here')
    },

    clickOpenDashboardModalButton: async function() {
      this.dashboardModalVisible = true;
    },

    closeDashboardModal: async function() {
      this.dashboardModalVisible = false;
    },

  }
});
