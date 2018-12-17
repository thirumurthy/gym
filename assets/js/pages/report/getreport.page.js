parasails.registerPage('getreport', {
  //  ╦╔╗╔╦╔╦╗╦╔═╗╦    ╔═╗╔╦╗╔═╗╔╦╗╔═╗
  //  ║║║║║ ║ ║╠═╣║    ╚═╗ ║ ╠═╣ ║ ║╣
  //  ╩╝╚╝╩ ╩ ╩╩ ╩╩═╝  ╚═╝ ╩ ╩ ╩ ╩ ╚═╝
  data: {
    //…
    pdfPath : "/api/v1/report/get-by-month",
    isShowPdf : false,
    rptObj : { bid:0, rptType:0},
    lstbranch: [{ bid: "1", Name: "Malumichambatti" }],
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

    setTimeout(() => {
      $('#rptyear').datepicker({
        type : "year",
          format: 'dd/MM/yyyy',
          placeholder: 'Please select Year',
      });
  }, 600);

  setTimeout(() => {
    $('#rptmonth').datepicker({
      type : "month",
        format: 'MM',
        placeholder: 'Please select Month',
    });
}, 600);


  },

  //  ╦╔╗╔╔╦╗╔═╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔╔═╗
  //  ║║║║ ║ ║╣ ╠╦╝╠═╣║   ║ ║║ ║║║║╚═╗
  //  ╩╝╚╝ ╩ ╚═╝╩╚═╩ ╩╚═╝ ╩ ╩╚═╝╝╚╝╚═╝
  methods: {
    //…

    generateReport (){
      if(this.rptObj.rptType==1){
        this.pdfPath = "/api/v1/report/get-by-month?year="+$('#rptyear').val()+"&bid="+this.rptObj.bid+"&month="+$("#rptmonth").val();
        //$("#rptframe").attr("src","/api/v1/report/get-by-month?year="+$('#rptyear').val()+"&bid="+this.rptObj.bid+"&month="+$("#rptmonth").val());

      }
      else{
        this.pdfPath = "/api/v1/report/get-by-year?year="+$('#rptyear').val()+"&bid="+this.rptObj.bid;

      }
      this.isShowPdf = true;
    }

  }
});
