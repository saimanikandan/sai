<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="rptReceivedVsCompleted.aspx.cs" Inherits="IFNBilling.WebApp.UI.rptReceivedVsCompleted" %>

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
        <label for="Head" id="Heads" runat="server">Received Vs Completed Report</label>
    </h4>
    <div id="divCompletedPages">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="aspBtnBack" OnClick="aspBtnBack_Click" />
        <div class="form-group">
            <div class="col-xs-8">
                <label class="col-xs-2 required" for="forProdType">Production Type</label>
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
                <label class="col-xs-2 required" for="forLanguage">Language</label>
               <table>
                   <tr>
                    <td><Telerik:RadComboBox ID="ddlLanguage" runat="server" EnableCheckAllItemsCheckBox="true" CheckBoxes="true" ExpandDirection="Down" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged"></Telerik:RadComboBox>
                       </td>
                       <td>
                        <asp:CustomValidator class="col-xs-2" ID="CustomValidatorLanguage" runat="server" ClientValidationFunction="ValidationCriteria" ErrorMessage="Select Language" ValidationGroup="SubmitValidation" Width="300px"> 
                         </asp:CustomValidator>
                       </td>
                   </tr>
               </table>
                
               
            </div>
        </div>
        <div class="form-group" id="divyear">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forFromDate">Date Type</label>
               <Telerik:RadButton ID="RadBtnYears" runat="server" AutoPostBack="true" GroupName="YearType" ToggleType="Radio" OnClick="RadBtnYears_Click" ButtonType="ToggleButton" Text="Year" ></Telerik:RadButton>
                <label class="col-" for="forToDate"></label>
                <Telerik:RadButton ID="RadBtnCustom" runat="server" AutoPostBack="true" GroupName="YearType" ToggleType="Radio" OnClick="RadBtnCustom_Click" ButtonType="ToggleButton" Text="Date Range" Checked="true"></Telerik:RadButton>
            </div>
        </div>
        <div class="form-group" id="DateRange" runat="server" visible="true">
            <div class="col-xs-8">
                <label class="col-xs-2 required" for="forFromDate">Date Range</label>
                <Telerik:RadDatePicker AutoPostBack="true" class="col-xs-2" DateInput-ReadOnly="true" ID="dtDateFrom" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB"
                    OnSelectedDateChanged="dtDateFrom_SelectedDateChanged" />
                <label class="col-" for="forToDate">To&nbsp</label>
                <Telerik:RadDatePicker AutoPostBack="true" class="col-xs-2" DateInput-ReadOnly="true" ID="dtDateTo" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" OnSelectedDateChanged="dtDateTo_SelectedDateChanged" />
                <asp:CompareValidator ID="dateCompareValidator" runat="server" ControlToValidate="dtDateTo" ControlToCompare="dtDateFrom" ForeColor="Red"
                    Operator="GreaterThanEqual" Type="Date" ErrorMessage="Please correct the Date Range" Display="Dynamic" ValidationGroup="SubmitValidation">
                </asp:CompareValidator>
            </div>
        </div>
        <div class="form-group" id="DivRadMonthYearPicker" runat="server" visible="false">
            <div class="col-xs-8">
                <label class="col-xs-2 required" for="forFromDate">Date Range</label>
                <table>
                    <tr>
                        <td><Telerik:RadMonthYearPicker AutoPostBack="true" class="col-xs-2" ID="RadMonthYearFrom" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="MMM-yyyy" runat="server" Width="200px" /></td>
                        <td><label class="col-" for="forToDate">To &nbsp</label></td>
                        <td><Telerik:RadMonthYearPicker AutoPostBack="true"  class="col-xs-2" ID="RadMonthYearTo" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="MMM-yyyy"  runat="server" Width="200px"  /></td>
                        <td><asp:CompareValidator ID="YearPickerCompareValidator" runat="server" ControlToValidate="RadMonthYearTo" ControlToCompare="RadMonthYearFrom" ForeColor="Red"
                         Operator="GreaterThanEqual" Type="Date" ErrorMessage="Please correct the Date Range" Display="Dynamic" ValidationGroup="SubmitValidation">
                         </asp:CompareValidator></td>
                    </tr>
                </table>
                
               
                
            </div>
        </div>
        <Telerik:RadButton ID="radBtnGenerate" Text="Generate" runat="server" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
            Style="clear: both; margin-left: 15px;" OnClick="radBtnGenerate_Click" ValidationGroup="SubmitValidation" />
    </div>
    <Telerik:RadGrid ID="rdLevel1Grid" runat="server" AutoGenerateColumns="false"
        OnNeedDataSource="rdLevel1Grid_NeedDataSource"
        OnItemDataBound="rdLevel1Grid_ItemDataBound"
        OnItemCommand="rdLevel1Grid_ItemCommand"
        OnPreRender="rdLevel1Grid_PreRender"
        AllowPaging="true" PageSize="10" Width="100%" Height="400px"
        EnableViewState="false">
        <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top">
            <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
        </MasterTableView>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
        <ClientSettings>
            <Scrolling UseStaticHeaders="true" AllowScroll="true" />
        </ClientSettings>
    </Telerik:RadGrid>
    <br />
    <asp:Label ID="lblLevel2HeaderMessage" runat="server" Visible="false"></asp:Label>
    <br />
    <Telerik:RadGrid ID="rdLevel2Grid" runat="server"
        OnNeedDataSource="rdLevel2Grid_NeedDataSource"
        OnItemDataBound="rdLevel2Grid_ItemDataBound"
        OnItemCommand="rdLevel2Grid_ItemCommand"
        AllowPaging="true" PageSize="10"
        EnableViewState="false">
        <MasterTableView PagerStyle-AlwaysVisible="true" CommandItemDisplay="Top">
            <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
        </MasterTableView>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"></ExportSettings>
    </Telerik:RadGrid>
    <br />
    <asp:Label ID="lblLevel3HeaderMessage" runat="server" Visible="false"></asp:Label>
    <br />
    <Telerik:RadGrid ID="rdLevel3Grid" runat="server" AutoGenerateColumns="false"
        OnNeedDataSource="rdLevel3Grid_NeedDataSource"
        AllowPaging="true" PageSize="10"
        EnableViewState="false">
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
</asp:Content>
