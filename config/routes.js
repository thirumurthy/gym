/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

module.exports.routes = {


    //  ╦ ╦╔═╗╔╗ ╔═╗╔═╗╔═╗╔═╗╔═╗
    //  ║║║║╣ ╠╩╗╠═╝╠═╣║ ╦║╣ ╚═╗
    //  ╚╩╝╚═╝╚═╝╩  ╩ ╩╚═╝╚═╝╚═╝
    'GET /oldroot': { action: 'view-homepage-or-redirect' },
    'GET /welcome': { action: 'dashboard/view-welcome' },

    'GET /faq': { view: 'pages/faq' },
    'GET /legal/terms': { view: 'pages/legal/terms' },
    'GET /legal/privacy': { view: 'pages/legal/privacy' },
    'GET /contact': { view: 'pages/contact' },

    'GET /signup': { action: 'entrance/view-signup' },
    'GET /email/confirm': { action: 'entrance/confirm-email' },
    'GET /email/confirmed': { view: 'pages/entrance/confirmed-email' },

    'GET /login': { action: 'entrance/view-login' },
    'GET /password/forgot': { action: 'entrance/view-forgot-password' },
    'GET /password/new': { action: 'entrance/view-new-password' },

    'GET /account': { action: 'account/view-account-overview' },
    'GET /account/password': { action: 'account/view-edit-password' },
    'GET /account/profile': { action: 'account/view-edit-profile' },

    // manual page
    'GET /payments': { action: 'payment/view-payments' },
    'GET /package': { action: 'package/view-getpackage' },
    'GET /report': { action: 'report/view-getreport' },
    'GET /branch': { action: 'branch/view-getbranch' },
    'GET /admin/user': { action: 'admin/view-admin-user' },
    'GET /admin/queryImport': { action: 'admin/view-query-import' },
    'GET /': { action: 'template/view-index' },


    //  ╔═╗╔═╗╦  ╔═╗╔╗╔╔╦╗╔═╗╔═╗╦╔╗╔╔╦╗╔═╗
    //  ╠═╣╠═╝║  ║╣ ║║║ ║║╠═╝║ ║║║║║ ║ ╚═╗
    //  ╩ ╩╩  ╩  ╚═╝╝╚╝═╩╝╩  ╚═╝╩╝╚╝ ╩ ╚═╝
    // Note that, in this app, these API endpoints may be accessed using the `Cloud.*()` methods
    // from the CloudSDK library.
    '/api/v1/account/logout': { action: 'account/logout' },
    'PUT   /api/v1/account/update-password': { action: 'account/update-password' },
    'PUT   /api/v1/account/update-profile': { action: 'account/update-profile' },
    'PUT   /api/v1/account/update-billing-card': { action: 'account/update-billing-card' },
    'PUT   /api/v1/entrance/login': { action: 'entrance/login' },
    'POST  /api/v1/entrance/signup': { action: 'entrance/signup' },
    'POST  /api/v1/entrance/send-password-recovery-email': { action: 'entrance/send-password-recovery-email' },
    'POST  /api/v1/entrance/update-password-and-login': { action: 'entrance/update-password-and-login' },
    'POST  /api/v1/deliver-contact-form-message': { action: 'deliver-contact-form-message' },
    // manual apis
    'POST /api/v1/user/login': { action: 'user/login' },
    'GET /api/v1/user/listusers': { action: 'user/listusers' },
    'POST /api/v1/user/saveuser': { action: 'user/saveuser' },
    'GET /api/v1/user/del-user': { action: 'user/del-user' },
    'GET /api/v1/branch/listbranch': { action: 'branch/listbranch' },
    'POST /api/v1/branch/savebranch': { action: 'branch/savebranch' },
    'GET /api/v1/branch/deletebranch': { action: 'branch/deletebranch' },
    'GET /api/v1/package/listpackage': { action: 'package/listpackage' },
    'POST /api/v1/package/savepackage': { action: 'package/savepackage' },
    'GET /api/v1/package/delpackage': { action: 'package/delpackage' },
    'POST /api/v1/payment/savepayment': { action: 'payment/savepayment' },
    'GET /api/v1/payment/delpayment': { action: 'payment/delpayment' },
    'GET /api/v1/payment/listpayment': { action: 'payment/listpayment' },
    'GET /api/v1/admin/listadmin': { action: 'admin/listadmin' },
    'GET /api/v1/admin/deleteadmin': { action: 'admin/deleteadmin' },
    'POST /api/v1/admin/saveadmin': { action: 'admin/saveadmin' },

    // file upload
    'POST /api/v1/files/uploadfile': { action: 'files/uploadfile' },
    'POST /api/v1/admin/processquery': { action: 'admin/process-query' },

// report
'GET /api/v1/report/get-by-year': { action: 'report/get-by-year' },
'GET /api/v1/report/get-by-month': { action: 'report/get-by-month' },

    //  ╦ ╦╔═╗╔╗ ╦ ╦╔═╗╔═╗╦╔═╔═╗
    //  ║║║║╣ ╠╩╗╠═╣║ ║║ ║╠╩╗╚═╗
    //  ╚╩╝╚═╝╚═╝╩ ╩╚═╝╚═╝╩ ╩╚═╝


    //  ╔╦╗╦╔═╗╔═╗  ╦═╗╔═╗╔╦╗╦╦═╗╔═╗╔═╗╔╦╗╔═╗
    //  ║║║║╚═╗║    ╠╦╝║╣  ║║║╠╦╝║╣ ║   ║ ╚═╗
    //  ╩ ╩╩╚═╝╚═╝  ╩╚═╚═╝═╩╝╩╩╚═╚═╝╚═╝ ╩ ╚═╝
    '/terms': '/legal/terms',
    '/logout': '/api/v1/account/logout',

};