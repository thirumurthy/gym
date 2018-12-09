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
        'vuetable-pagination': Vuetable.VuetablePagination,
        FileUpload : VueUploadComponent,
        Cropper : 'cropperjs'
    },
    data: {
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
        userAddModalVisible: false,
        moreParams : {filter : "", Branch:"", tabselection:"1" },
        userType : 0,
        bid : 0,
        fields: [{
                name: 'gymnumber',
                title: '<span class="orange glyphicon glyphicon-user"></span>Mucle Zone ID',
                sortField: 'gymnumber'
            },
            {
                name: 'id',
                title: 'Auto ID',
                sortField: 'id'
            },
            {
                name: 'Name',
                title: 'Name',
                sortField: 'Name'
            },
            {
                name: 'bName',
                title : 'Branch',
                sortField:'bName'
            },
            {
                name: 'PlanName',
                title : 'Plan Name',
                sortField:'PlanName'
            },
            {
                name: 'JoinDate',
                title: 'Joined Date',
                sortField: 'JoinDate'
            },
            {
                name: 'ExpireDate',
                title: 'Expire Date',
                sortField: 'ExpireDate'
            },

            {
                name: 'ExpireDays',
                title: "Expire In",
                sortField: 'ExpireDays'
            },
            
            {
                name: 'BalanceAmount',
                title: 'Balance Amount',
                sortField: 'BalanceAmount'
            },
            {
                name: 'DueDate',
                title: 'Due Date',
                sortField: 'DueDate'
            },
            {
                name: '__slot:actions',
                title: 'Action'
            },
            
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
        if(this.userType>1){
            setTimeout(() => {
                $('#bid'+this.bid).prop('checked', true);
            }, 1000);
            
        }
        
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


        onPaginationData(paginationData) {
            this.$refs.pagination.setPaginationData(paginationData)
        },
        onChangePage(page) {
            this.$refs.vuetable.changePage(page)
        },
        PayNow(rowData) {

            window.location.href = "/payments?userid=" + rowData.UserId+"&bid="+rowData.bid;

        },
        userDisplayMode(tabselection){
            this.moreParams.tabselection = tabselection;
           // this.setDisplayFields() ;
            this.$refs.vuetable.refresh();
        },  
       /*  setDisplayFields() {
            var i,resp=false;
            for (i = 0; i < this.fields.length; i++) {
                if (this.fields[i].name == "DueDate") {
                    if(this.moreParams.tabselection==2){
                        this.fields.splice(i,1);
                    }
                    resp= true;
                }
            }
        
            if( resp==false && this.moreParams.tabselection==1){
                this.fields.splice(10, 0,  {
                    name: 'DueDate',
                    title: 'Due Date',
                    sortField: 'DueDate'
                });
            }
        }, */
        onRowClass(dataItem, index) {
            // put your logic here
            // to reference selectedTo, use `this.$refs.vuetable.selectedTo`
            // and return the CSS class name you want
            // this.$refs.vuetable.selectedTo.indexOf(dataItem.ExpireDays) 
            
            return   dataItem.ExpireDays?  (
            
            (dataItem.ExpireDays < 15)
              ? 'table-danger'
              : (dataItem.ExpireDays <30?'table-warning':'' ) ) :''
          },

        editRow(rowData) {
            this.userAddModalVisible = true;
            this.curUser = rowData;
            this.files = [];
            this.files.push({url: this.curUser.filename?"/userfiles/avatar/"+this.curUser.UserId+"/"+this.curUser.UserId+"/"+this.curUser.filename:"/userfiles/avatar/avatar.png" } );

            var curdate = (this.curUser.JoinDate || '');
            setTimeout(() => {
                $('#joindate').datepicker({
                    format: 'dd/MM/yyyy',
                    placeholder: 'Please select Join Date',
                    defaultValue: curdate,
                });
            }, 600);


            //alert("You clicked edit on"+ JSON.stringify(rowData))
        },
        deleteRow(rowData) {
            var UserId= rowData.UserId||0;
            this.$snotify.confirm('Are you sure want to delete this user?', 'Delete User', {
                timeout: 0,
                closeOnClick: false,
                pauseOnHover: true,
                buttons: [
                    {
                        text: 'Yes', action: (toast) => {
                            console.log('Clicked: Yes');
                            this.$snotify.remove(toast.id);
                            var route = "/api/v1/user/del-user?userid=" + UserId;
                            $.get(route).then((response) => {
                                if (response.scode == 200) {

                                    this.$snotify.success('The User has been deleted successfully..!', 'Delete User', {
                                        timeout: 2000,
                                        showProgressBar: false,
                                        closeOnClick: false,
                                        pauseOnHover: true
                                    });
                                    this.$refs.vuetable.refresh();
                                } else {
                                    this.$snotify.error('Unable to delete this User..!', 'Delete User', {
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
            $(function() {
                $('#joindate').datepicker({
                    // date format
                    format: 'dd/MM/yyyy',

                    // placeholder text
                    placeholder: 'Please select Join Date',
                    // default date
                    defaultValue: '',
                });
            });

        },

        closeUserAddModel: async function() {
            this.userAddModalVisible = false;
            this.$refs.vuetable.refresh();

        },
        checkBranch: function(eventval){
            this.moreParams.Branch = this.checkedBranch.toString();
            this.$refs.vuetable.refresh();
            
        },
        searchUser: function(){
            this.moreParams.filter = this.userfilter;
            this.$refs.vuetable.refresh();
        },
        handleParsingUserSaveForm: function() {

            var _self = this;
            this.curUser.JoinDate = $("#joindate").val();
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
                file.postAction = "/api/v1/files/uploadfile?userid="+this.curUser.UserId+"&id="+this.curUser.UserId+"&utype=avatar";
                return await component.uploadHtml4(file)
            }
            
          }

        // file upload methods

    }
});