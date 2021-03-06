var fonts = {
	Roboto: {
		normal: 'fonts/Roboto-Regular.ttf',
		bold: 'fonts/Roboto-Medium.ttf',
		italics: 'fonts/Roboto-Italic.ttf',
		bolditalics: 'fonts/Roboto-MediumItalic.ttf'
	}
};

var PdfPrinter = require('pdfmake');
var printer = new PdfPrinter(fonts);
var fs = require('fs');

module.exports = {


  friendlyName: 'Get by month',


  description: '',


  inputs: {

    year  : {
      type : "number",
      required : false
    },
    bid : {
      type : "number",
      required : false
    },
    month : {
      type : "number",
      required : false
    }
  },


  exits: {

  },


  fn: async function (inputs, exits) {

     
    this.res.type('application/pdf');


    var REPORT_MONTH_SQL = 'call sp_report_getMonthly( $1, $2, $3, $4 )';
      
    var rawResult = await sails.sendNativeQuery(REPORT_MONTH_SQL, [ inputs.month||0, inputs.year||0, 0, inputs.bid||0 ]);

    var rptlst =rawResult.rows[0];
    var bodydata = [];
    bodydata.push(["S.No","Month Name", "Joined Date", "Paid Amount", "Balance Amount" ])
    if(rptlst.length>0){
      for(var i=0;i<rptlst.length;i++){
        
        bodydata.push([i+1, rptlst[i].MonthName, rptlst[i].JoinDate,  rptlst[i].PaidAmount, rptlst[i].BalanceAmount]);
      }

      bodydata.push(["","","Total Amount",rptlst[0].TotalAmount,rptlst[0].TotalDue]);
    }
    var tabledata = {
      table: {
        headerRows: 1,
        widths: [ '*', 'auto', 100, '*' , 'auto'],
        body: bodydata,

      }
    };

    var docDefinition = {
      info: {
        title: 'Gym Report',
        author: 'Thirumurthy',
        subject: 'Gym Report',
        keywords: 'Gym Report',
      },
      pageSize: 'A4',
      pageMargins: [ 40, 60, 40, 60 ],
      header: { text:'\n\n\Gym - Monthy Report' , alignment: 'center'},
      footer: {
        columns: [
          'Gym Zone Report',
          { text: '2018', alignment: 'right' }
        ]
      },
      content: [
        
        {
          
          image: 'assets/images/logo_report.png',
          width: 100,
          height: 100
        },"\n",
        
        tabledata
      ]
    };

    var pdfDoc = printer.createPdfKitDocument(docDefinition);
pdfDoc.pipe(this.res );
pdfDoc.end();

//var downloading = await sails.startDownload('sample.pdf');
//return exits.success(downloading);

  }


};
