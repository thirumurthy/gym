/**
 * Policy Mappings
 * (sails.config.policies)
 *
 * Policies are simple functions which run **before** your actions.
 *
 * For more information on configuring policies, check out:
 * https://sailsjs.com/docs/concepts/policies
 */

module.exports.policies = {

  '*': 'is-logged-in',

  // Bypass the `is-logged-in` policy for:
  'entrance/*': true,
  'account/logout': true,
  'view-homepage-or-redirect': true,
  'deliver-contact-form-message': true,
  'user/*': true,
  'payment/*': true,
  'package/listpackage': true,
  'package/delpackage': 'is-super-admin',
  'package/savepackage': 'is-super-admin',
  
  'report/*':'is-super-admin',
  'files/*':true,
  
  'branch/listbranch':true,
  'branch/deletebranch':'is-super-admin',
  'branch/savebranch':'is-super-admin',
  'branch/view-getbranch':'is-super-admin',
  

  'admin/*' : 'is-super-admin',
  'template/*': true
};
