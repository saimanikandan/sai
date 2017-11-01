<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="LogReports.aspx.cs" Inherits="IFNBilling.WebApp.UI.LogReports" %>
<asp:Content ID="ContentLogReports" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <Telerik:RadWindowManager ID="Radpopupwindow" runat="server"></Telerik:RadWindowManager>
    <h4>
        <label for="Head" id="Head" runat="server">Log Report</label>
        <asp:Label ID="lblProjectName" runat="server" Font-Size="Small" Font-Bold="true" Style="float: right"></asp:Label>
    </h4>
    <br />

    <div id="divBulkUpdateHistory" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" OnClick="aspLogBack_Click" runat="server" ID="aspLogBack" />&nbsp;
    <label for="forFrom">Project Number</label>
     <Telerik:RadNumericTextBox ID="radTxtBulkProjectNumber" NumberFormat-AllowRounding="false" NumberFormat-DecimalDigits="0" ValidationGroup="BatchUpdate" NumberFormat-GroupSeparator="" runat="server" Width="190"></Telerik:RadNumericTextBox>
     <Telerik:RadButton ID="radbutBulkGo" Text="GO" runat="server" Skin="MetroTouch"  BackColor="#25a0da" ForeColor="White" OnClick="radbutBulkGo_Click" UseSubmitBehavior="false" ValidationGroup="BatchUpdate" />
    <label for="forFrom">Job Number</label>
      <Telerik:RadDropDownList ID="radDdlJobNumbers" runat="server" OnSelectedIndexChanged="radDdlJobNumbers_SelectedIndexChanged" AutoPostBack="true"></Telerik:RadDropDownList>
        &nbsp;
        <label for="forFrom">Module Types</label>
      <Telerik:RadDropDownList ID="RadDropDownModule" runat="server" OnSelectedIndexChanged="RadDropDownModule_SelectedIndexChanged" AutoPostBack="true"></Telerik:RadDropDownList>

     <Telerik:RadButton ID="radLogGenerate" OnClick="radLogGenerate_Click" Text="View Log" runat="server" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
         SingleClick="true" Style="clear: both;" ValidationGroup="LogProjectandBatch">
     </Telerik:RadButton>
        &nbsp;
        <asp:RequiredFieldValidator ID="rqBulkProdType" ControlToValidate="radDdlJobNumbers" InitialValue="(Select)" ErrorMessage="Please select Job Number" runat="server" Display="Dynamic" ValidationGroup="LogProjectandBatch"/>
           <asp:RequiredFieldValidator runat="server" ID="ValidatorProjectNumber" ErrorMessage="Please Enter Project Number" ControlToValidate="radTxtBulkProjectNumber" InitialValue="" ValidationGroup="LogProjectandBatch" />
         <asp:RequiredFieldValidator ID="RequiredRadDropDownModule" ControlToValidate="RadDropDownModule" InitialValue="(Select)" ErrorMessage="Please select Module" runat="server" Display="Dynamic" ValidationGroup="LogProjectandBatch"/>
        <Telerik:RadButton ID="radBtnExport" Text="Export to Excel" runat="server" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White"
            SingleClick="true" Style="clear: both;" Visible="false">
        </Telerik:RadButton>
    </div>

    <div id="divLogUpdateHistoryGrid" runat="server" style="padding-bottom: 30px;padding-top: 10px">
        <div id="divGridExportToExcel" runat="server" visible="true">
                <asp:Label runat="server" ID="lblGridCaption" Font-Size="Small" Font-Bold="true" Style="float: left" />
                <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="LogGridExportToExcel" AutoPostBack="true" Width="30px" Height="30px" runat="server" Visible="true" Style="float: right" OnClick="LogGridExportToExcel_Click"></asp:ImageButton>
        </div>
        <Telerik:RadGrid ID="rdLogGrid" runat="server" AutoGenerateColumns="true"  AllowSorting="true" AllowFilteringByColumn="true" ShowGroupPanel="False"
            AllowPaging="true" PageSize="50" Width="100%" Height="400px" GroupingSettings-CaseSensitive="false"  OnNeedDataSource="rdLogGrid_NeedDataSource"
             OnPreRender="rdLogGrid_PreRender" >
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
      <Telerik:RadAjaxLoadingPanel ID="rdBulkAjaxLoader" runat="server" />
    <Telerik:RadAjaxManagerProxy ID="AjaxManagerproxy1" runat="server">
        
    <AjaxSettings>

        <Telerik:AjaxSetting AjaxControlID="radbutBulkGo">
            <UpdatedControls>
                <Telerik:AjaxUpdatedControl ControlID="radTxtBulkProjectNumber" />
                <Telerik:AjaxUpdatedControl ControlID="radDdlJobNumbers" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

         <Telerik:AjaxSetting AjaxControlID="rdLogGrid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="rdLogGrid"  LoadingPanelID="rdBulkAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

            <Telerik:AjaxSetting AjaxControlID="radLogGenerate">
            <UpdatedControls>
               <Telerik:AjaxUpdatedControl ControlID="divLogUpdateHistoryGrid"  LoadingPanelID="rdBulkAjaxLoader" />
                    <Telerik:AjaxUpdatedControl ControlID="rdLogGrid"  />
                </UpdatedControls>
            </Telerik:AjaxSetting>

         <Telerik:AjaxSetting AjaxControlID="LogGridExportToExcel">
            <UpdatedControls>
                <Telerik:AjaxUpdatedControl ControlID="rdLogGrid" LoadingPanelID="rdBulkAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        <Telerik:AjaxSetting AjaxControlID="rdLogGrid">
            <UpdatedControls>
                  <Telerik:AjaxUpdatedControl ControlID="rdLogGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
    </AjaxSettings>
    </Telerik:RadAjaxManagerProxy>
</asp:Content>
