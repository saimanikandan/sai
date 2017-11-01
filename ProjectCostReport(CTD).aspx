<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="ProjectCostReport(CTD).aspx.cs" Inherits="IFNBilling.WebApp.UI.ProjectCostReport_CTD_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <style>
        .TotalCostCss {
            font-size: 12pt;
            text-decoration: none;
            font-weight: bold;
            color: Red;
        }
    </style>

    <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

        <script type="text/javascript">

            function onRequestStart(sender, args) {
                if (args.get_eventTarget().indexOf("radBtnGenerate") >= 0)
                    args.set_enableAjax(false);
            }
            //function GridCreated(sender, args) {
            //    var scrollArea = sender.GridDataDiv;
            //    scrollArea.style.height = "615px";
            //}
        </script>

    </Telerik:RadScriptBlock>

    <div>
        <h4>
            <label for="Head" id="Head" runat="server">Cost To Date (CTD) Report </label>
            <asp:Label ID="lblProjectName" runat="server" Font-Size="Small" Font-Bold="true" Style="float: right"></asp:Label>

        </h4>
        <h4>
            <asp:Label ID="lblClientCompany" runat="server" Font-Size="Small" Font-Bold="true" Style="float: right; margin-top: -10px !important"></asp:Label>
        </h4>
    </div>
    <br />
    <div id="ctdopts" runat="server" visible="false">
        <div style="float: left">

            <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="CTDBack" OnClick="CTDBack_Click" />&nbsp;
            <label for="forFrom">From</label>&nbsp;
            <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radDateFrom"></Telerik:RadDatePicker>
            &nbsp;
    <label for="forFrom">To</label>&nbsp;
            <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radDateTo"></Telerik:RadDatePicker>
            &nbsp;
     <Telerik:RadButton ID="radBtnGenerate" Text="Generate" runat="server" OnClick="radBtnGenerate_Click" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
         Style="clear: both;">
     </Telerik:RadButton>
        </div>
    </div>
    <%--<asp:Label ID="errorMessage" Text="From Date should not be greater than To Date" ForeColor="Red" runat="server" Visible="false"></asp:Label>--%>
    <div class="col-lg-12">
        <asp:HiddenField ID="hdnProjectName" runat="server" />
        <asp:HiddenField ID="hdnProjectTypename" runat="server" />
    </div>
    <Telerik:RadWindowManager ID="Radpopupwindow" runat="server"></Telerik:RadWindowManager>
    <Telerik:RadAjaxLoadingPanel ID="rdAjaxLoader" runat="server" />
    <Telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" ClientEvents-OnRequestStart="onRequestStart">
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="radBtnGenerate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="radBtnGenerate" UpdatePanelRenderMode="Inline" LoadingPanelID="rdAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

        </AjaxSettings>
    </Telerik:RadAjaxManager>



</asp:Content>
