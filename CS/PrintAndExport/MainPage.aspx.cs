using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing.Printing;
using DevExpress.Web;
using DevExpress.XtraCharts.Printing;

namespace PrintAndExport {
    public partial class MainPage : System.Web.UI.Page {
        protected override void OnLoad(EventArgs e) {
        }

        protected void OnCbOrientationInit(object sender, EventArgs e) {
            if(IsPostBack) return;
            ASPxComboBox comboBox = sender as ASPxComboBox;
            if(comboBox == null) return;
            comboBox.Items.Add(new ListEditItem("Portrait", false));
            comboBox.Items.Add(new ListEditItem("Landscape", true));
        }

        protected void OnCbSizeModeInit(object sender, EventArgs e) {
            if(IsPostBack) return;
            ASPxComboBox comboBox = sender as ASPxComboBox;
            if(comboBox == null) return;
            Array sizeModes = Enum.GetValues(typeof(PrintSizeMode));
            foreach(PrintSizeMode sizeMode in sizeModes) {
                comboBox.Items.Add(new ListEditItem(sizeMode.ToString(), sizeMode.ToString()));
            }
        }

        protected void OnCbPaperKindInit(object sender, EventArgs e) {
            if(IsPostBack) return;
            ASPxComboBox comboBox = sender as ASPxComboBox;
            if(comboBox == null) return;
            Array paperKinds = Enum.GetValues(typeof(PaperKind));
            foreach(PaperKind paperKind in paperKinds) {
                comboBox.Items.Add(new ListEditItem(paperKind.ToString(), paperKind.ToString()));
            }
        }
    }
}