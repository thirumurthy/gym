/**
 * cloud.setup.js
 *
 * Configuration for this Sails app's generated browser SDK ("Cloud").
 *
 * Above all, the purpose of this file is to provide endpoint definitions,
 * each of which corresponds with one particular route+action on the server.
 *
 * > This file was automatically generated.
 * > (To regenerate, run `sails run rebuild-cloud-sdk`)
 */

Cloud.setup({

  /* eslint-disable */
  methods: {"confirmEmail":{"verb":"GET","url":"/email/confirm","args":["token"]},"logout":{"verb":"GET","url":"/api/v1/account/logout","args":[]},"updatePassword":{"verb":"PUT","url":"/api/v1/account/update-password","args":["password"]},"updateProfile":{"verb":"PUT","url":"/api/v1/account/update-profile","args":["fullName","emailAddress"]},"updateBillingCard":{"verb":"PUT","url":"/api/v1/account/update-billing-card","args":["stripeToken","billingCardLast4","billingCardBrand","billingCardExpMonth","billingCardExpYear"]},"login":{"verb":"POST","url":"/api/v1/user/login","args":["username","password"]},"signup":{"verb":"POST","url":"/api/v1/entrance/signup","args":["emailAddress","password","fullName"]},"sendPasswordRecoveryEmail":{"verb":"POST","url":"/api/v1/entrance/send-password-recovery-email","args":["emailAddress"]},"updatePasswordAndLogin":{"verb":"POST","url":"/api/v1/entrance/update-password-and-login","args":["password","token"]},"deliverContactFormMessage":{"verb":"POST","url":"/api/v1/deliver-contact-form-message","args":["emailAddress","topic","fullName","message"]},"listusers":{"verb":"GET","url":"/api/v1/user/listusers","args":["page","per_page","Branch","filter","tabselection"]},"saveuser":{"verb":"POST","url":"/api/v1/user/saveuser","args":["UserId","Name","EmailId","DOB","Address","bid","phone","JoinDate","height","weight","gymnumber"]},"delUser":{"verb":"GET","url":"/api/v1/user/del-user","args":["userid"]},"listbranch":{"verb":"GET","url":"/api/v1/branch/listbranch","args":[]},"savebranch":{"verb":"POST","url":"/api/v1/branch/savebranch","args":["bid","Place","Name"]},"deletebranch":{"verb":"GET","url":"/api/v1/branch/deletebranch","args":["bid"]},"listpackage":{"verb":"GET","url":"/api/v1/package/listpackage","args":["page","per_page","bid"]},"savepackage":{"verb":"POST","url":"/api/v1/package/savepackage","args":["Sid","NoOfDays","Amount","SType","bid","Name","period","ptype"]},"delpackage":{"verb":"GET","url":"/api/v1/package/delpackage","args":["sid"]},"savepayment":{"verb":"POST","url":"/api/v1/payment/savepayment","args":["UserSid","UserId","Sid","JoinDate","ExpireDate","SType","PaidAmount","BalanceAmount","PaymentStatus","DueDate","Notes"]},"delpayment":{"verb":"GET","url":"/api/v1/payment/delpayment","args":["delreason","usersid"]},"listpayment":{"verb":"GET","url":"/api/v1/payment/listpayment","args":["page","per_page","userid"]},"listadmin":{"verb":"GET","url":"/api/v1/admin/listadmin","args":["page","per_page","Branch","filter"]},"deleteadmin":{"verb":"GET","url":"/api/v1/admin/deleteadmin","args":["userId"]},"saveadmin":{"verb":"POST","url":"/api/v1/admin/saveadmin","args":["UserId","Name","Username","password","userType","bid","phone","isLock"]},"uploadfile":{"verb":"POST","url":"/api/v1/files/uploadfile","args":["utype","userid","id"]},"processQuery":{"verb":"POST","url":"/api/v1/admin/processquery","args":["filepath"]}}
  /* eslint-enable */

});
