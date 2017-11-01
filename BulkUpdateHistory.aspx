<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="BulkUpdateHistory.aspx.cs" Inherits="IFNBilling.WebApp.UI.BulkUpdateHistory" %>

<asp:Content ID="bulkUpdateHist" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <Telerik:RadWindowManager ID="Radpopupwindow" runat="server"></Telerik:RadWindowManager>
<h4>
        <label for="Head" id="Head" runat="server">Bulk Update History Report</label>
        <asp:Label ID="lblProjectName" runat="server" Font-Size="Small" Font-Bold="true" Style="float: right"></asp:Label>
    </h4>
    <br />
      <div id="divBulkUpdateHistory" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" OnClick="aspBulkBtnBack_Click" runat="server" ID="aspBulkBtnBack" />&nbsp;
    <label for="forFrom">Project Number</label>
     <Telerik:RadNumericTextBox ID="radTxtBulkProjectNumber" NumberFormat-AllowRounding="false" NumberFormat-DecimalDigits="0" ValidationGroup="BatchUpdate" NumberFormat-GroupSeparator="" runat="server" Width="190"></Telerik:RadNumericTextBox>
     <Telerik:RadButton ID="radbutBulkGo" Text="GO" runat="server" Skin="MetroTouch"  BackColor="#25a0da" ForeColor="White" OnClick="radbutBulkGo_Click" UseSubmitBehavior="false" ValidationGroup="BulkProjectandBatch" />
    <label for="forFrom">Job Number</label>
      <Telerik:RadDropDownList ID="radDdlJobNumbers" runat="server" OnSelectedIndexChanged="radDdlJobNumbers_SelectedIndexChanged" AutoPostBack="true"></Telerik:RadDropDownList>
        &nbsp;
     <Telerik:RadButton ID="radBulkBtnGenerate" OnClick="radBulkBtnGenerate_Click" Text="Generate" runat="server" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
         SingleClick="true" Style="clear: both;" ValidationGroup="BulkProjectandJobs">
     </Telerik:RadButton>
        &nbsp;
        <asp:RequiredFieldValidator ID="rqBulkProdType" ControlToValidate="radDdlJobNumbers" InitialValue="(Select)" ErrorMessage="Please select Job Number" runat="server" Display="Dynamic" ValidationGroup="BulkProjectandJobs"/>
           <asp:RequiredFieldValidator runat="server" ID="ValidatorProjectNumber" ErrorMessage="Please Enter Project Number" ControlToValidate="radTxtBulkProjectNumber" InitialValue="" ValidationGroup="BulkProjectandBatch" />
        <Telerik:RadButton ID="radBtnExport" Text="Export to Excel" runat="server" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White"
            SingleClick="true" Style="clear: both;" Visible="false">
        </Telerik:RadButton>
    </div>

    <div id="divBulkUpdateHistoryGrid" runat="server" style="padding-bottom: 30px;padding-top: 10px">
        <div id="divGridExportToExcel" runat="server" visible="true">
                <asp:Label runat="server" ID="lblGridCaption" Font-Size="Small" Font-Bold="true" Style="float: left" />
                <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="BulkGridExportToExcel" AutoPostBack="true" Width="30px" Height="30px" runat="server" Visible="true" Style="float: right" OnClick="BulkGridExportToExcel_Click"></asp:ImageButton>
        </div>
        <Telerik:RadGrid ID="rdBulkUpdateHistoryGrid" runat="server" AutoGenerateColumns="true"  AllowSorting="true" AllowFilteringByColumn="true" ShowGroupPanel="False"
            AllowPaging="true" PageSize="50" Width="100%" Height="600px" GroupingSettings-CaseSensitive="false"  OnNeedDataSource="rdBulkUpdateHistoryGrid_NeedDataSource"
             OnPreRender="rdBulkUpdateHistoryGrid_PreRender" >
            <MasterTableView PagerStyle-AlwaysVisible="true" TableLayout="Fixed" CommandItemDisplay="Top" EditFormSettings-EditColumn-ShowFilterIcon="false" Width="100%">
                <CommandItemSettings ShowExportToExcelButton="false" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
            </MasterTableView>            
            <ClientSettings EnablePostBackOnRowClick="false" EnableRowHoverStyle="true" >
                <Selecting AllowRowSelect="true" />
                <Resizing AllowResizeToFit="true" ResizeGridOnColumnResize="true" />
                <Scrolling AllowScroll ="true" UseStaticHeaders="true" SaveScrollPosition="true" />
            </ClientSettings>
        </Telerik:RadGrid>
    </div>
    <br />
    <br />
    <br />
    <br />
       <Telerik:RadAjaxLoadingPanel ID="rdBulkAjaxLoader" runat="server" />
    <Telerik:RadAjaxManagerProxy ID="AjaxManagerproxy1" runat="server">
        
    <AjaxSettings>

        <Telerik:AjaxSetting AjaxControlID="radbutBulkGo">
            <UpdatedControls>
                <Telerik:AjaxUpdatedControl ControlID="radTxtBulkProjectNumber" />
                <Telerik:AjaxUpdatedControl ControlID="radDdlJobNumbers" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

         <Telerik:AjaxSetting AjaxControlID="rdBulkUpdateHistoryGrid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divBulkUpdateHistoryGrid"  LoadingPanelID="rdBulkAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="rdBulkUpdateHistoryGrid"  />
                </UpdatedControls>
            </Telerik:AjaxSetting>

            <Telerik:AjaxSetting AjaxControlID="radBulkBtnGenerate">
            <UpdatedControls>
               <Telerik:AjaxUpdatedControl ControlID="divBulkUpdateHistoryGrid"  LoadingPanelID="rdBulkAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="rdBulkUpdateHistoryGrid"  />
                </UpdatedControls>
            </Telerik:AjaxSetting>

         <Telerik:AjaxSetting AjaxControlID="BulkGridExportToExcel">
            <UpdatedControls>
                <Telerik:AjaxUpdatedControl ControlID="rdBulkUpdateHistoryGrid" LoadingPanelID="rdBulkAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        <Telerik:AjaxSetting AjaxControlID="rdBulkUpdateHistoryGrid">
            <UpdatedControls>
                  <Telerik:AjaxUpdatedControl ControlID="rdBulkUpdateHistoryGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
    </AjaxSettings>
    </Telerik:RadAjaxManagerProxy>
</asp:Content>