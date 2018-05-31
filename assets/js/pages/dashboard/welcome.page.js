///////////////////////////////////////
///////// reference : https://codepen.io/ratiw/pen/GmJayw
///////// reference : https://github.com/ratiw/vuetable-2
//////////////////////////////////////
/**
 * http://blog.dniccumdesign.com/how-to-add-sass-scss-support-to-a-sailsjs-application/
 * https://artemsky.github.io/vue-snotify/
 * https://artemsky.github.io/vue-snotify/documentation/essentials/styling.html
 * https://github.com/artemsky/vue-snotify/tree/master/src/styles
 * 
 */


Vue.use(Vuetable);
 

parasails.registerPage('welcome', {
  //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
  //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
  //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
   
  

  components: {
    'vuetable-pagination': Vuetable.VuetablePagination
   },
   data: {
     // Form data
    formData: { /* … */ },
 

    // Syncing / loading state
    syncing: false,

    curUser : {}, 
    cloudError : {},
    formErrors : {},
    lstbranch : [{bid:"1",Name:"Malumichambatti"}],
    userAddModalVisible : false,
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
    PayNow(rowData){

      window.location.href = "/payments?userid="+rowData.UserId ;
      
    },
    editRow(rowData){
      this.userAddModalVisible = true;
      this.curUser = rowData;
      

      var curdate = (this.curUser.JoinDate || '');
      setTimeout(() => {
        $('#joindate').datepicker({
          format: 'dd/MM/yyyy',
          placeholder: 'Please select Join Date',
          defaultValue: curdate,
          } );
      }, 600);
     
      
      //alert("You clicked edit on"+ JSON.stringify(rowData))
    },
    deleteRow(rowData){
      this.$snotify.confirm('Are you sure want to delete this user?', 'Delete User', {
        timeout: 0, 
        closeOnClick: false,
        pauseOnHover: true,
        buttons: [
          {text: 'Yes', action: () => console.log('Clicked: Yes'), bold: false},
           
          {text: 'No', action: (toast) => {console.log('Clicked: No'); this.$snotify.remove(toast.id); }, bold: true},
        ]
      });
      //alert("You clicked delete on"+ JSON.stringify(rowData))
    },
    onLoading() {
      console.log('loading... show your spinner here')
    },
    onLoaded() {
      console.log('loaded! .. hide your spinner here')
    },

    
    openUserAddModel: async function() {
      this.curUser. UserId = 0 ;
      this.userAddModalVisible = true;
      $(function() {
        $('#joindate').datepicker({
                  // date format
          format: 'dd/MM/yyyy',

          // placeholder text
          placeholder: 'Please select Join Date',
           // default date
          defaultValue: '',
        } );
    });

    },

    closeUserAddModel: async function() {
      this.userAddModalVisible = false;
       
    },
    handleParsingUserSaveForm:  function(){
       
        var _self= this;    
      Object.keys(this.curUser).forEach(function(key) {
        _self. curUser[key] = (_self. curUser[key] ) ?_self. curUser[key] : undefined ; 
      });
      var argins= this.curUser;

      if (Object.keys(this.formErrors).length > 0) {
        return;
      }

      return argins;
    },
    submittedUserSaveForm : async function(response){

      if(response.scode==200)
      {
        this.userAddModalVisible = false;
        this.$snotify.success('The user Information saved successfully..!', 'Save User', {
          timeout: 2000,
          showProgressBar: false,
          closeOnClick: false,
          pauseOnHover: true
        });
      }
      else{
        this.$snotify.success('Failed to save..!', 'Save User', {
          timeout: 2000,
          showProgressBar: false,
          closeOnClick: false,
          pauseOnHover: true
        });

      }

      

    },

  }
});
