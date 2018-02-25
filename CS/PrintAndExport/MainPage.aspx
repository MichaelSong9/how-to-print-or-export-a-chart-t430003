<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="PrintAndExport.MainPage" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print/Export</title>
    <script>
        function OnCommandExecuted(s, e) {
            switch (e.item.name) {
                case "print": chartControl.Print(); break;
                case "exportPdf": chartControl.SaveToDisk("pdf"); break;
                case "exportXls": chartControl.SaveToDisk("xls"); break;
                case "exportXlsx": chartControl.SaveToDisk("xlsx"); break;
                case "exportRtf": chartControl.SaveToDisk("rtf"); break;
                case "exportMht": chartControl.SaveToDisk("mht"); break;
                case "exportPng": chartControl.SaveToDisk("png"); break;
                case "exportJpeg": chartControl.SaveToDisk("jpeg"); break;
                case "exportBmp": chartControl.SaveToDisk("bmp"); break;
                case "exportTiff": chartControl.SaveToDisk("tiff"); break;
                case "exportGif": chartControl.SaveToDisk("gif"); break;
            }
        }

        function OnOrientationInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var isLandscape = printOptions.GetLandscape() ? "True" : "False";
            cbOrientation.SetSelectedItem(cbOrientation.FindItemByValue(isLandscape));
        }
        function OnOrientationSelectedIndexChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var isLandscape = s.GetSelectedItem().value;
            printOptions.SetLandscape(isLandscape);
        }

        function OnSizeModeInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var sizeMode = printOptions.GetSizeMode();
            var sizeModeItem = cbSizeMode.FindItemByValue(sizeMode);
            cbSizeMode.SetSelectedItem(sizeModeItem);
        }
        function OnSizeModeSelectedIndexChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var sizeMode = s.GetSelectedItem().value;
            printOptions.SetSizeMode(sizeMode);
        }

        function OnPaperKindInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var paperKind = printOptions.GetPaperKind();
            var paperKindItem = cbPaperKind.FindItemByValue(paperKind);
            cbPaperKind.SetSelectedItem(paperKindItem);
            UpdateCustomPaperParameterEditors(paperKind);
        }
        function OnPaperKindSelectedIndexChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var paperKind = s.GetSelectedItem().value;
            printOptions.SetPaperKind(paperKind);
            UpdateCustomPaperParameterEditors(paperKind);
        }
        function UpdateCustomPaperParameterEditors(paperKind) {
            var customPaperSettings = document.getElementById("customPaperSettings");
            if (paperKind == "Custom") {
                customPaperSettings.classList.remove("disabled");
                tbCustomPaperName.SetEnabled(true);
                seCustomPaperWidth.SetEnabled(true);
                seCustomPaperHeight.SetEnabled(true);
            }
            else {
                customPaperSettings.classList.add("disabled");
                tbCustomPaperName.SetEnabled(false);
                seCustomPaperWidth.SetEnabled(false);
                seCustomPaperHeight.SetEnabled(false);
            }
        }

        function OnMarginTopInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var marginTop = printOptions.GetMarginTop();
            seMarginTop.SetNumber(marginTop);
        }
        function OnMarginTopChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetMarginTop(seMarginTop.GetNumber());
        }

        function OnMarginLeftInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var marginLeft = printOptions.GetMarginLeft();
            seMarginLeft.SetNumber(marginLeft);
        }
        function OnMarginLeftChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetMarginLeft(seMarginLeft.GetNumber());
        }

        function OnMarginBottomInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var marginBottom = printOptions.GetMarginBottom();
            seMarginBottom.SetNumber(marginBottom);
        }
        function OnMarginBottomChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetMarginBottom(seMarginBottom.GetNumber());
        }

        function OnMarginRightInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var marginRight = printOptions.GetMarginRight();
            seMarginRight.SetNumber(marginRight);
        }
        function OnMarginRightChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetMarginRight(seMarginRight.GetNumber());
        }

        function OnCustomPaperNameInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var customPaperName = printOptions.GetCustomPaperName();
            tbCustomPaperName.SetText(customPaperName);
        }
        function OnCustomPaperNameChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetCustomPaperName(tbCustomPaperName.GetText());
        }

        function OnCustomPaperWidthInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var customPaperWidth = printOptions.GetCustomPaperWidth();
            seCustomPaperWidth.SetNumber(customPaperWidth);
        }
        function OnCustomPaperWidthChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetCustomPaperWidth(seCustomPaperWidth.GetNumber());
        }

        function OnCustomPaperHeightInit(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            var customPaperWidth = printOptions.GetCustomPaperWidth();
            seCustomPaperWidth.SetNumber(customPaperWidth);
        }
        function OnCustomPaperHeightChanged(s, e) {
            var printOptions = chartControl.GetPrintOptions();
            printOptions.SetCustomPaperWidth(seCustomPaperWidth.GetNumber());
        }
    </script>
    <style type="text/css">
        .subgroup-caption {
            padding-top: 6px;
            padding-bottom: 4px;
        }

        .item {
            padding: 2px;
        }

        .disabled {
            pointer-events: none;
            color: lightgray;
        }
    </style>
</head>

<body>
    <form id="form" runat="server">
        <div>
            <dx:ASPxRibbon
                ID="ribbon"
                runat="server">
                <Tabs>
                    <dx:RibbonTab
                        Name="rtMain"
                        Text="Print/Export">
                        <Groups>
                            <dx:RibbonGroup
                                Name="rgPrint"
                                Text="Print">
                                <Items>
                                    <dx:RibbonButtonItem
                                        Name="print"
                                        Size="Large"
                                        Text="Print Chart">
                                        <LargeImage IconID="print_print_32x32office2013" />
                                        <SmallImage IconID="print_print_16x16office2013" />
                                    </dx:RibbonButtonItem>
                                </Items>
                            </dx:RibbonGroup>
                            <dx:RibbonGroup
                                Name="rgExport"
                                Text="Export">
                                <Items>
                                    <dx:RibbonDropDownButtonItem Name="Export" Text="Export" Size="Large" DropDownMode="False">
                                        <Items>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportPdf"
                                                Text="Export to Pdf">
                                                <SmallImage IconID="export_exporttopdf_16x16office2013" />
                                                <LargeImage IconID="export_exporttopdf_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportJpeg"
                                                Text="Export to Jpeg">
                                                <SmallImage IconID="export_exporttoimg_16x16office2013" />
                                                <LargeImage IconID="export_exporttoimg_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportXlsx"
                                                Text="Export to Xlsx">
                                                <SmallImage IconID="export_exporttoxlsx_16x16office2013" />
                                                <LargeImage IconID="export_exporttoxlsx_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportXls"
                                                Text="Export to Xls">
                                                <SmallImage IconID="export_exporttoxls_16x16office2013" />
                                                <LargeImage IconID="export_exporttoxls_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportRtf"
                                                Text="Export to Rtf">
                                                <SmallImage IconID="export_exporttortf_16x16office2013" />
                                                <LargeImage IconID="export_exporttortf_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportMht"
                                                Text="Export to Mht">
                                                <SmallImage IconID="export_exporttomht_16x16office2013" />
                                                <LargeImage IconID="export_exporttomht_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportPng"
                                                Text="Export to Png">
                                                <SmallImage IconID="export_exporttoimg_16x16office2013" />
                                                <LargeImage IconID="export_exporttoimg_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportBmp"
                                                Text="Export to Bmp">
                                                <SmallImage IconID="export_exporttoimg_16x16office2013" />
                                                <LargeImage IconID="export_exporttoimg_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportTiff"
                                                Text="Export to Tiff">
                                                <SmallImage IconID="export_exporttoimg_16x16office2013" />
                                                <LargeImage IconID="export_exporttoimg_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                            <dx:RibbonDropDownButtonItem
                                                Name="exportGif"
                                                Text="Export to Gif">
                                                <SmallImage IconID="export_exporttoimg_16x16office2013" />
                                                <LargeImage IconID="export_exporttoimg_32x32office2013" />
                                            </dx:RibbonDropDownButtonItem>
                                        </Items>
                                        <LargeImage IconID="export_exportfile_32x32office2013">
                                        </LargeImage>
                                    </dx:RibbonDropDownButtonItem>
                                </Items>
                            </dx:RibbonGroup>
                            <dx:RibbonGroup
                                Name="rgOptions"
                                Text="Options">
                                <Items>
                                    <dx:RibbonTemplateItem Size="Large">
                                        <Template>
                                            <table>
                                                <tr>
                                                    <td class="item">
                                                        <dx:ASPxComboBox
                                                            ID="cbOrientation"
                                                            ClientInstanceName="cbOrientation"
                                                            runat="server"
                                                            Caption="Orientation:"
                                                            CaptionCellStyle-Width="75px"
                                                            Width="125px"
                                                            Paddings-Padding="2px"
                                                            AutoPostBack="false"
                                                            OnInit="OnCbOrientationInit">
                                                            <ClientSideEvents 
                                                                Init="OnOrientationInit"
                                                                SelectedIndexChanged="OnOrientationSelectedIndexChanged" />
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="item">
                                                        <dx:ASPxComboBox
                                                            ID="cbSizeMode"
                                                            ClientInstanceName="cbSizeMode"
                                                            runat="server"
                                                            Caption="Size Mode:"
                                                            CaptionCellStyle-Width="75px"
                                                            Width="125px"
                                                            AutoPostBack="false"
                                                            OnInit="OnCbSizeModeInit">
                                                            <ClientSideEvents 
                                                                Init="OnSizeModeInit"
                                                                SelectedIndexChanged="OnSizeModeSelectedIndexChanged" />
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="item">
                                                        <dx:ASPxComboBox
                                                            ID="cbPaperKind"
                                                            ClientInstanceName="cbPaperKind"
                                                            runat="server"
                                                            Caption="Paper Kind:"
                                                            CaptionCellStyle-Width="75px"
                                                            Width="125px"
                                                            AutoPostBack="false"
                                                            OnInit="OnCbPaperKindInit">
                                                            <ClientSideEvents 
                                                                Init="OnPaperKindInit"
                                                                SelectedIndexChanged="OnPaperKindSelectedIndexChanged" />
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </Template>
                                    </dx:RibbonTemplateItem>
                                    <dx:RibbonTemplateItem Size="Large" BeginGroup="true">
                                        <Template>
                                            <table>
                                                <caption class="subgroup-caption">Margins</caption>
                                                <tbody>
                                                    <tr>
                                                        <td class="item">
                                                            <dx:ASPxSpinEdit
                                                                ID="seMarginTop"
                                                                ClientInstanceName="seMarginTop"
                                                                runat="server"
                                                                Caption="Top"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100px"
                                                                DisplayFormatString="{0}/100 inch"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnMarginTopInit"
                                                                    NumberChanged="OnMarginTopChanged" />
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                        <td class="item">
                                                            <dx:ASPxSpinEdit
                                                                ID="seMarginBottom"
                                                                ClientInstanceName="seMarginBottom"
                                                                runat="server"
                                                                Caption="Bottom"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100px"
                                                                DisplayFormatString="{0}/100 inch"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnMarginBottomInit"
                                                                    NumberChanged="OnMarginBottomChanged" />
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="item">
                                                            <dx:ASPxSpinEdit
                                                                ID="seMarginLeft"
                                                                ClientInstanceName="seMarginLeft"
                                                                runat="server"
                                                                Caption="Left"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100px"
                                                                DisplayFormatString="{0}/100 inch"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnMarginLeftInit"
                                                                    NumberChanged="OnMarginLeftChanged" />
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                        <td class="item">
                                                            <dx:ASPxSpinEdit
                                                                ID="seMarginRight"
                                                                ClientInstanceName="seMarginRight"
                                                                runat="server"
                                                                Caption="Right:"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100px"
                                                                DisplayFormatString="{0}/100 inch"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnMarginRightInit"
                                                                    NumberChanged="OnMarginRightChanged" />
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </Template>
                                    </dx:RibbonTemplateItem>
                                    <dx:RibbonTemplateItem Size="Large" BeginGroup="true">
                                        <Template>
                                            <table id="customPaperSettings">
                                                <caption class="subgroup-caption">Custom Paper</caption>
                                                <tbody>
                                                    <tr>
                                                        <td class="item" colspan="2">
                                                            <dx:ASPxTextBox
                                                                ID="tbCustomPaperName"
                                                                ClientInstanceName="tbCustomPaperName"
                                                                runat="server"
                                                                Caption="Name"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100%"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnCustomPaperNameInit" 
                                                                    TextChanged="OnCustomPaperNameChanged"/>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="item">
                                                            <dx:ASPxSpinEdit
                                                                ID="seCustomPaperWidth"
                                                                ClientInstanceName="seCustomPaperWidth"
                                                                runat="server"
                                                                Caption="Width"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100px"
                                                                DisplayFormatString="{0}/100 inch"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnCustomPaperNameInit" 
                                                                    NumberChanged="OnCustomPaperWidthChanged"/>
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                        <td class="item">
                                                            <dx:ASPxSpinEdit
                                                                ID="seCustomPaperHeight"
                                                                ClientInstanceName="seCustomPaperHeight"
                                                                runat="server"
                                                                Caption="Height:"
                                                                CaptionCellStyle-Width="50px"
                                                                Number="0"
                                                                Width="100px"
                                                                DisplayFormatString="{0}/100 inch"
                                                                AutoPostBack="false">
                                                                <ClientSideEvents 
                                                                    Init="OnCustomPaperNameInit" 
                                                                    NumberChanged="OnCustomPaperHeightChanged"/>
                                                            </dx:ASPxSpinEdit>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </Template>
                                    </dx:RibbonTemplateItem>
                                </Items>
                            </dx:RibbonGroup>
                        </Groups>
                    </dx:RibbonTab>
                </Tabs>
                <ClientSideEvents CommandExecuted="OnCommandExecuted
" />
            </dx:ASPxRibbon>
            <div style="margin: auto; width: 1262px; padding-top: 8px">
                <dx:WebChartControl
                    ID="chartControl"
                    ClientInstanceName="chartControl"
                    runat="server"
                    CrosshairEnabled="True"
                    Width="1262px"
                    Height="491px">
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend
                        Name="Default Legend"
                        AlignmentHorizontal="Right" />
                    <Titles>
                        <dx:ChartTitle Text="Great Lakes Gross State Product" />
                    </Titles>
                    <SeriesSerializable>
                        <dx:Series Name="1998">
                            <Points>
                                <dx:SeriesPoint ArgumentSerializable="Illinois" Values="423.721" />
                                <dx:SeriesPoint ArgumentSerializable="Indiana" Values="178.719" />
                                <dx:SeriesPoint ArgumentSerializable="Michigan" Values="308.845" />
                                <dx:SeriesPoint ArgumentSerializable="Ohio" Values="348.555" />
                                <dx:SeriesPoint ArgumentSerializable="Wisconsin" Values="160.274" />
                            </Points>
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView>
                                    <FillStyle FillMode="Solid" />
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                        <dx:Series Name="2001">
                            <Points>
                                <dx:SeriesPoint ArgumentSerializable="Illinois" Values="476.851" />
                                <dx:SeriesPoint ArgumentSerializable="Indiana" Values="195.769" />
                                <dx:SeriesPoint ArgumentSerializable="Michigan" Values="335.793" />
                                <dx:SeriesPoint ArgumentSerializable="Ohio" Values="374.771" />
                                <dx:SeriesPoint ArgumentSerializable="Wisconsin" Values="182.373" />
                            </Points>
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView>
                                    <FillStyle FillMode="Solid" />
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                        <dx:Series Name="2004">
                            <Points>
                                <dx:SeriesPoint ArgumentSerializable="Illinois" Values="528.904" />
                                <dx:SeriesPoint ArgumentSerializable="Indiana" Values="227.271" />
                                <dx:SeriesPoint ArgumentSerializable="Michigan" Values="372.576" />
                                <dx:SeriesPoint ArgumentSerializable="Ohio" Values="418.258" />
                                <dx:SeriesPoint ArgumentSerializable="Wisconsin" Values="211.727" />
                            </Points>
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView>
                                    <FillStyle FillMode="Solid" />
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                </dx:WebChartControl>
            </div>
        </div>
    </form>
</body>
</html>

