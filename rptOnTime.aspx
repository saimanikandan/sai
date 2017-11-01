<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="rptOnTime.aspx.cs" Inherits="IFNBilling.WebApp.UI.rptOnTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h4>
        <label for="Head" id="Heads" runat="server">Production (On-Time) Report</label>
    </h4>
    <Telerik:RadScriptBlock ID="rdScriptBlock" runat="server">
        <script>
            function RequestStart(sender, args) {
                if (args.get_eventTarget().indexOf("Export") >= 0) {
                    args.set_enableAjax(false);
                }
            }
            function OnClientClose() {                
                var rdLevel1Grid = $find("<%= rdLevel1Grid.ClientID %>");
                rdLevel1Grid.clearSelectedItems();
            }
        </script>
    </Telerik:RadScriptBlock>
    <Telerik:RadAjaxLoadingPanel ID="rdAjaxLoader" runat="server" />
    <Telerik:RadAjaxManager ID="rdAjaxMGR" runat="server">
        <ClientEvents OnRequestStart="RequestStart" />
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="ddlProdType">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="FromDate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="ToDate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdbtnGenerate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divParentGrid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="rdChildWindow" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdLevel1Grid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="rdChildWindow" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdChildGrid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdChildGrid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="rdbtnGenerate" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManager>
    <div id="divOnTimeReportFilterControls" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="aspBtnBack" OnClick="aspBtnBack_Click" />
        <div class="form-group">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forProdType">Production Type</label>
                <Telerik:RadDropDownList ID="ddlProdType" runat="server" AutoPostBack="true" Width="200px" SelectedValue='<%#Bind("Name") %>' InitialValue="(Select)"
                    OnSelectedIndexChanged="ddlProdType_SelectedIndexChanged">
                    <Items>
                        <Telerik:DropDownListItem Text="(Select)" Value="-1" />
                        <Telerik:DropDownListItem Text="TypeSet" Value="1" />
                        <Telerik:DropDownListItem Text="Translations (Incl. SideJob)" Value="2" />
                        <Telerik:DropDownListItem Text="All (Incl. Media)" Value="3" />
                    </Items>
                </Telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlProdType" runat="server" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="ddlProdType" ErrorMessage="Select Production Type" InitialValue="(Select)" ValidationGroup="SubmitValidation"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group" id="DateRange">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forFromDate">Batch Deadline Date </label>
                <Telerik:RadDatePicker AutoPostBack="true" class="col-xs-2" DateInput-ReadOnly="true" ID="FromDate" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB"
                    OnSelectedDateChanged="FromDate_SelectedDateChanged" />
                <label class="col-" for="forToDate">To   </label>
                <Telerik:RadDatePicker AutoPostBack="true" class="col-xs-2" DateInput-ReadOnly="true" ID="ToDate" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB"
                    OnSelectedDateChanged="ToDate_SelectedDateChanged" />
                <asp:CompareValidator ID="dateCompareValidator" runat="server" ControlToValidate="ToDate" ControlToCompare="FromDate" ForeColor="Red"
                    Operator="GreaterThanEqual" Type="Date" ErrorMessage="Please correct the Date Range" Display="Dynamic" ValidationGroup="SubmitValidation">
                </asp:CompareValidator>
            </div>
        </div>
        <Telerik:RadButton ID="rdbtnGenerate" runat="server" Text="Generate" AutoPostBack="true" OnClick="rdbtnGenerate_Click" ValidationGroup="SubmitValidation"
            Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" Style="clear: both; margin-left: 15px;" SingleClick="true">
        </Telerik:RadButton>
    </div>
    <div id="divParentGrid" runat="server">
        <Telerik:RadGrid ID="rdLevel1Grid" runat="server" AutoGenerateColumns="false"
            OnNeedDataSource="rdLevel1Grid_NeedDataSource"
            OnItemDataBound="rdLevel1Grid_ItemDataBound"
            OnItemCommand="rdLevel1Grid_ItemCommand"
            OnPreRender="rdLevel1Grid_PreRender"
            AllowPaging="true" PageSize="50" Width="100%" Height="600px"            
            EnableViewState="false">
            <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top">
                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
            </MasterTableView>
            <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
            <ClientSettings EnableAlternatingItems="false">
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
        </Telerik:RadGrid>
    </div>
    <br />
    <Telerik:RadWindow CssClass="" ID="rdChildWindow" runat="server" MinWidth="900px" MinHeight="500px" 
        Modal="true" CenterIfModal="true" Behaviors="Close,Move" OnClientClose="OnClientClose"
        DestroyOnClose="true" VisibleStatusbar="false">
        <Localization />
        <ContentTemplate>
            <Telerik:RadGrid ID="rdChildGrid" runat="server"
                OnNeedDataSource="rdChildGrid_NeedDataSource"
                AllowPaging="true" PageSize="10" ShowFooter="false" width="100%" Height="450px">
                <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top" TableLayout="Fixed" Width="100%">
                    <CommandItemSettings ShowExportToExcelButton="true" ShowRefreshButton="false" ShowAddNewRecordButton="false" />
                </MasterTableView>
                <ClientSettings>
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <ExportSettings FileName="OnTimeChildReport" IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true"></ExportSettings>
            </Telerik:RadGrid>
        </ContentTemplate>
    </Telerik:RadWindow>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
