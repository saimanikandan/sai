<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="rptCompletedPages.aspx.cs" Inherits="IFNBilling.WebApp.UI.UI_Pages.Reports.rptCompletedPages" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <Telerik:RadScriptBlock ID="rdScriptBlock" runat="server">
        <script>
            function RequestStart(sender, args) {
                if (args.get_eventTarget().indexOf("Export") >= 0) {
                    args.set_enableAjax(false);
                }
            }
            function ValidationCriteria(source, args) {
                var chkbox = $find('<%= ddlLanguage.ClientID %>');
                args.IsValid = chkbox.get_checkedItems().length > 0;
            }
        </script>
    </Telerik:RadScriptBlock>
    
    <Telerik:RadAjaxLoadingPanel ID="rdAjaxLoader" runat="server" />
    <Telerik:RadAjaxManager ID="rdAjaxMgr" runat="server">
        <ClientEvents OnRequestStart="RequestStart" />
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="ddlVertical">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="ddlProdType" />
                    <Telerik:AjaxUpdatedControl ControlID="ddlLanguage" />
                    <Telerik:AjaxUpdatedControl ControlID="DateRange" />
                    <Telerik:AjaxUpdatedControl ControlID="radBtnGenerate" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="ddlProdType">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="ddlLanguage" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="DateRange" />
                    <Telerik:AjaxUpdatedControl ControlID="radBtnGenerate" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="ddlLanguage">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="DateRange" />
                    <Telerik:AjaxUpdatedControl ControlID="radBtnGenerate" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="dtDateFrom">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="radBtnGenerate" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="dtDateTo">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="radBtnGenerate" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="radBtnGenerate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdLevel1Grid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel1Grid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel2HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdLevel2Grid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel2Grid" LoadingPanelID="rdAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" LoadingPanelID="rdAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdLevel3Grid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="lblLevel3HeaderMessage" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLevel3Grid" LoadingPanelID="rdAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManager>
    <h4>
        <label for="Head" id="Heads" runat="server">Completed Pages and Batches Report</label>
    </h4>
    <div id="divCompletedPages">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="aspBtnBack" OnClick="aspBtnBack_Click" />
        <div class="form-group">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forLanguage">Project Vertical</label>
                <Telerik:RadDropDownList ID="ddlVertical" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVertical_SelectedIndexChanged" AppendDataBoundItems="true" >
                      <Items>
                        <Telerik:DropDownListItem Text="All" Value="-1" />                        
                    </Items>
                </Telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlVertical" runat="server" Display="Dynamic" ForeColor="Red" 
                                            ControlToValidate="ddlVertical" ErrorMessage="Select Project Vertical" InitialValue="(Select)" ValidationGroup="SubmitValidation"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forProdType">Production Type</label>
                <Telerik:RadDropDownList ID="ddlProdType" runat="server" AutoPostBack="true" SelectedValue='<%#Bind("Name") %>' InitialValue="(Select)"
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
        <div class="form-group">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forLanguage">Language</label>
                <Telerik:RadComboBox ID="ddlLanguage" runat="server" EnableCheckAllItemsCheckBox="true" CheckBoxes="true" ExpandDirection="Down" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged">
                </Telerik:RadComboBox>
                <asp:CustomValidator ID="CustomValidatorLanguage" runat="server" ClientValidationFunction="ValidationCriteria" ErrorMessage="Select Language" ValidationGroup="SubmitValidation"> 
                </asp:CustomValidator> 
            </div>
        </div>
        <div class="form-group" id="DateRange">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forFromDate">Date Range </label>
                <Telerik:RadDatePicker AutoPostBack="true" class="col-xs-2" DateInput-ReadOnly="true" ID="FromDate" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB"
                    OnSelectedDateChanged="FromDate_SelectedDateChanged" />
                <label class="col-" for="forToDate">To   </label>
                <Telerik:RadDatePicker AutoPostBack="true" class="col-xs-2" DateInput-ReadOnly="true" ID="ToDate" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB"
                    OnSelectedDateChanged="ToDate_SelectedDateChanged" />
                <asp:CompareValidator ID="dateCompareValidator" runat="server" ControlToValidate="ToDate" ControlToCompare="FromDate" ForeColor="Red"
                    Operator="GreaterThanEqual" Type="Date" ErrorMessage="Please correct the Date Range" Display="Dynamic" ValidationGroup="SubmitValidation" >
                </asp:CompareValidator>
            </div>
        </div>
        <Telerik:RadButton ID="radBtnGenerate" Text="Generate" runat="server" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
            SingleClick="true" Style="clear: both;" OnClick="radBtnGenerate_Click" ValidationGroup="SubmitValidation" />
    </div>

    <Telerik:RadGrid ID="rdLevel1Grid" runat="server" AutoGenerateColumns="false"
        OnNeedDataSource="rdLevel1Grid_NeedDataSource"
        OnItemDataBound="rdLevel1Grid_ItemDataBound"
        OnItemCommand="rdLevel1Grid_ItemCommand"
        AllowPaging="true" PageSize="10" EnableViewState="false">
        <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top">
            <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
        </MasterTableView>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
    </Telerik:RadGrid>
    <br />
    <asp:Label ID="lblLevel2HeaderMessage" runat="server" Visible="false"></asp:Label>
    <br />
    <Telerik:RadGrid ID="rdLevel2Grid" runat="server"
        OnNeedDataSource="rdLevel2Grid_NeedDataSource"
        OnItemDataBound="rdLevel2Grid_ItemDataBound"
        OnItemCommand="rdLevel2Grid_ItemCommand"
        AllowPaging="true" PageSize="10" EnableViewState="false">
        <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top">
            <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
        </MasterTableView>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
    </Telerik:RadGrid>
    <br />
    <asp:Label ID="lblLevel3HeaderMessage" runat="server"></asp:Label>
    <br />
    <Telerik:RadGrid ID="rdLevel3Grid" runat="server"
        OnNeedDataSource="rdLevel3Grid_NeedDataSource"
        AllowPaging="true" PageSize="10" EnableViewState="false">
        <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top">
            <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
        </MasterTableView>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
    </Telerik:RadGrid>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
