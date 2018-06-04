Vue.use(Vuetable);
 
parasails.registerPage('getbranch', {
    //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
    //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
    //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
    components: {
        'vuetable-pagination': Vuetable.VuetablePagination
    },
    data: {
        //…
        branchAddModalVisible: false,
        curBranch: {},
        formErrors: {},
        cloudError: {},
        // Syncing / loading state
        syncing: false,
        fields: [{
                name: 'Place',
                title: 'Place',
                sortField: 'Place'
            },
            {
                name: 'Name',
                title: 'Name',
                sortField: 'Name'
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

        openBranchAddModel: function() {
            this.branchAddModalVisible = true;
            this.curBranch = {};
            this.curBranch.bid = 0;
        },

        closeBranchAddModel: async function() {
            this.branchAddModalVisible = false;

        },
        onPaginationData(paginationData) {
            this.$refs.pagination.setPaginationData(paginationData)
        },
        onChangePage(page) {
            this.$refs.vuetable.changePage(page)
        },
        editRow(rowData) {
            this.branchAddModalVisible = true;
            this.curBranch = rowData;
        },
        deleteRow(rowData) {
            var bid = rowData.bid;

            this.$snotify.confirm('Are you sure want to delete this branch?', 'Delete Branch', {
                timeout: 0,
                closeOnClick: false,
                pauseOnHover: true,
                buttons: [
                    { text: 'Yes', action: (toast) => {
                        console.log('Clicked: Yes');
                        this.$snotify.remove(toast.id);
                        var route = "/api/v1/branch/deletebranch?bid="+bid;
                        $.get(route).then((response)=>{
                            if (response.scode == 200) {
                                 
                                this.$snotify.success('The Branch has been deleted successfully..!', 'Delete Branch', {
                                    timeout: 2000,
                                    showProgressBar: false,
                                    closeOnClick: false,
                                    pauseOnHover: true
                                });
                                this.$refs.vuetable.refresh();
                            } else {
                                this.$snotify.error('Unable to delete this branch..!', 'Delete Branch', {
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

        },
        onLoading() {
            console.log('loading... show your spinner here')
        },
        onLoaded() {
            console.log('loaded! .. hide your spinner here')
        },

        submittedBranchSaveForm: async function(response) {

            if (response.scode == 200) {
                this.branchAddModalVisible = false;
                this.$snotify.success('The Branch Information saved successfully..!', 'Save Branch', {
                    timeout: 2000,
                    showProgressBar: false,
                    closeOnClick: false,
                    pauseOnHover: true
                });
            } else {
                this.$snotify.error('Failed to save..!', 'Save Branch', {
                    timeout: 2000,
                    showProgressBar: false,
                    closeOnClick: false,
                    pauseOnHover: true
                });

            }

        },
        handleParsingBranchSaveForm: function() {
            var _self = this;
            Object.keys(this.curBranch).forEach(function(key) {
                _self.curBranch[key] = (_self.curBranch[key]) ? _self.curBranch[key] : undefined;
            });
            var argins = this.curBranch;

            if (Object.keys(this.formErrors).length > 0) {
                return;
            }

            return argins;

        }


    }
});