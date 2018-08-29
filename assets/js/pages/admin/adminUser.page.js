Vue.use(Vuetable);

parasails.registerPage('admin-user', {
  //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
  //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
  //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
  components: {
    'vuetable-pagination': Vuetable.VuetablePagination,
    FileUpload : VueUploadComponent,
    Cropper : 'cropperjs'
},

  data: {
    //…
    
        // Form data
        formData: { /* … */ },

        // file upload
        files: [],
        edit: false,
        cropper: false,
        // file upload

        // Syncing / loading state
        syncing: false,

        curUser: {},
        cloudError: {},
        formErrors: {},
        userfilter : "",
        checkedBranch : [],
        lstbranch: [{ bid: "1", Name: "Malumichambatti" }], 
        lstRoles: [{ rid:1,RoleName : "Admin" }, { rid:2, RoleName : "Trainee"}],
        userAddModalVisible: false,
        moreParams : {filter : "", Branch:"" },
        fields: [{
                name: 'userRole',
                title: '<span class="orange glyphicon glyphicon-user"></span>Role',
                sortField: 'userRole'
            },
            {
                name: 'Username',
                title: 'User Name',
                sortField: 'Username'
            },
            {
                name: 'bName',
                title : 'Branch',
                sortField:'bName'
            },
            {
                name: 'phone',
                title: "Phone",
                sortField: 'phone'
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
  watch: {
    edit(value) {
      if (value) {
        this.$nextTick(function () {
          if (!this.$refs.editImage) {
            return
          }
          let cropper = new Cropper(this.$refs.editImage, {
            aspectRatio: 1 / 1,
            viewMode: 1,
          })
          this.cropper = cropper
        })
      } else {
        if (this.cropper) {
          this.cropper.destroy()
          this.cropper = false
        }
      }
    }
  },

  methods: {
    //…

    onPaginationData(paginationData) {
      this.$refs.pagination.setPaginationData(paginationData)
  },
  onChangePage(page) {
      this.$refs.vuetable.changePage(page)
  },
  editRow(rowData) {
    this.userAddModalVisible = true;
    this.curUser = rowData;
    this.files = [];
    this.files.push({url: this.curUser.filename?"/userfiles/adminphoto/"+this.curUser.UserId+"/"+this.curUser.UserId+"/"+this.curUser.filename:"/userfiles/avatar/avatar.png" } );

 
},

deleteRow(rowData) {
  this.$snotify.confirm('Are you sure want to delete this user?', 'Delete User', {
      timeout: 0,
      closeOnClick: false,
      pauseOnHover: true,
      buttons: [
          { text: 'Yes', action: () => console.log('Clicked: Yes'), bold: false },

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

onLoading() {
  console.log('loading... show your spinner here')
},
onLoaded() {
  console.log('loaded! .. hide your spinner here')
},
openUserAddModel: async function() {
  this.curUser = {};
  this.curUser.UserId = 0;
  this.userAddModalVisible = true;
},
closeUserAddModel: async function() {
  this.userAddModalVisible = false;
  this.$refs.vuetable.refresh();

},
handleParsingUserSaveForm: function() {

  var _self = this;
   
  Object.keys(this.curUser).forEach(function(key) {
      _self.curUser[key] = (_self.curUser[key]) ? _self.curUser[key] : undefined;
  });
  var argins = this.curUser;

  if (Object.keys(this.formErrors).length > 0) {
      return;
  }

  return argins;
},

submittedUserSaveForm: async function(response) {

  if (response.scode == 200) {
      this.userAddModalVisible = false;
      this.$refs.vuetable.refresh();
      this.$snotify.success('The user Information saved successfully..!', 'Save User', {
          timeout: 2000,
          showProgressBar: false,
          closeOnClick: false,
          pauseOnHover: true
      });
  } else {
      this.$snotify.error('Failed to save..!', 'Save User', {
          timeout: 2000,
          showProgressBar: false,
          closeOnClick: false,
          pauseOnHover: true
      });

  }



},


        // file upload methods

        editSave() {
          this.edit = false
          let oldFile = this.files[0]
          let binStr = atob(this.cropper.getCroppedCanvas().toDataURL(oldFile.type).split(',')[1])
          let arr = new Uint8Array(binStr.length)
          for (let i = 0; i < binStr.length; i++) {
            arr[i] = binStr.charCodeAt(i)
          }
          let file = new File([arr], oldFile.name, { type: oldFile.type })
          let result=this.$refs.upload.update(oldFile.id, {
            file,
            type: file.type,
            size: file.size,
            active: true,
          })
          console.log(result);
        },
        alert(message) {
          alert(message)
        },
        inputFile(newFile, oldFile, prevent) {
          if (newFile && !oldFile) {
            this.$nextTick(function () {
              this.edit = true
            })
          }
          if (!newFile && oldFile) {
            this.edit = false
          }
        },
        inputFilter(newFile, oldFile, prevent) {
          if (newFile && !oldFile) {
            if (!/\.(gif|jpg|jpeg|png|webp)$/i.test(newFile.name)) {
              this.alert('Your choice is not a picture')
              return prevent()
            }
          }
          if (newFile && (!oldFile || newFile.file !== oldFile.file)) {
            newFile.url = ''
            let URL = window.URL || window.webkitURL
            if (URL && URL.createObjectURL) {
              newFile.url = URL.createObjectURL(newFile.file)
            }
          }
        },
      

        customAction : async function (file, component) {
          // return await component.uploadPut(file)
          if(this.curUser.UserId>0)
          {
              file.postAction = "/api/v1/files/uploadfile?userid="+this.curUser.UserId+"&id="+this.curUser.UserId+"&utype=adminphoto";
              return await component.uploadHtml4(file)
          }
          
        }

      // file upload methods


  }
});
