<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="rptOpenBatches.aspx.cs" Inherits="IFNBilling.WebApp.UI.rptOpenBatches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h4>
        <label for="Head" id="Heads" runat="server">Open Batches Report</label>
    </h4>    
       <Telerik:RadScriptBlock ID="rdScriptBlock" runat="server">
        <script>
            function RequestStart(sender, args) {
                if (args.get_eventTarget().indexOf("Export") >= 0) {
                    args.set_enableAjax(false);
                }
            }
        </script>
    </Telerik:RadScriptBlock>
    <Telerik:RadAjaxLoadingPanel ID="rdAjaxLoader" runat="server" />
    <Telerik:RadAjaxManager ID="rdAjaxMGR" runat="server">
        <ClientEvents OnRequestStart="RequestStart" />
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="ddlVertical">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divParentGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="ddlProdType">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divParentGrid" />                    
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdbtnGenerate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divParentGrid" LoadingPanelID="rdAjaxLoader" />                    
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="rdParentGrid">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divParentGrid" />
                    <Telerik:AjaxUpdatedControl ControlID="rdParentGrid" LoadingPanelID="rdAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="GridExportToExcel">
                <UpdatedControls>                    
                    <Telerik:AjaxUpdatedControl ControlID="rdParentGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManager>
    <div id="divOnTimeReportFilterControls" runat="server">        
        <div class="form-inline">        
                <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="aspBtnBack" OnClick="aspBtnBack_Click" />    
                <label for="forLanguage">&nbsp;&nbsp;Project Vertical&nbsp;&nbsp;</label>
                <Telerik:RadDropDownList ID="ddlVertical" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVertical_SelectedIndexChanged" AppendDataBoundItems="true" >
                    <Items>
                        <Telerik:DropDownListItem Text="All" Value="-1" Selected="true" />                        
                    </Items>
                </Telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlVertical" runat="server" Display="Dynamic" ForeColor="Red" 
                    ControlToValidate="ddlVertical" ErrorMessage="Select Project Vertical" InitialValue="(Select)" ValidationGroup="SubmitValidation"></asp:RequiredFieldValidator>
               
                <label for="forProdType">&nbsp;&nbsp;Production Type</label>
                <Telerik:RadDropDownList ID="ddlProdType" runat="server" AutoPostBack="true" SelectedValue='<%# Bind("Name") %>' InitialValue="(Select)"
                        OnSelectedIndexChanged="ddlProdType_SelectedIndexChanged">
                        <Items>                            
                            <Telerik:DropDownListItem Text="All" Value="All" Selected="true" />
                            <Telerik:DropDownListItem Text="TypeSet" Value="TypeSet" />
                            <Telerik:DropDownListItem Text="Translation" Value="Translation" />
                            <Telerik:DropDownListItem Text="Side jobs" Value="Side jobs" />
                            <Telerik:DropDownListItem Text="Media" Value="Media" />
                            <Telerik:DropDownListItem Text="Hospitality" Value="Hospitality" />
                            <Telerik:DropDownListItem Text="Print" Value="Print" />
                        </Items>
                </Telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlProdType" runat="server" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="ddlProdType" ErrorMessage="Select Production Type" InitialValue="(Select)" ValidationGroup="SubmitValidation"></asp:RequiredFieldValidator>
                
                <Telerik:RadButton ID="rdbtnGenerate" runat="server" Text="Generate" AutoPostBack="true" OnClick="rdbtnGenerate_Click" ValidationGroup="SubmitValidation"
                            Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" Style="clear: both; margin-left: 15px; vertical-align:middle " SingleClick="false">
                </Telerik:RadButton>
           
        </div>
    </div>
    <br />
    <div id="divParentGrid" runat="server" style="padding-bottom: 30px;padding-top: 10px">
        <div id="divGridExportToExcel" runat="server" visible="true">
                <asp:Label runat="server" ID="lblGridCaption" Font-Size="Small" Font-Bold="true" Style="float: left" />
                <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="GridExportToExcel" AutoPostBack="true" Width="30px" Height="30px" runat="server" Visible="true" Style="float: right" OnClick="GridExportToExcel_Click"></asp:ImageButton>
        </div>
        <Telerik:RadGrid ID="rdParentGrid" runat="server" AutoGenerateColumns="true"  AllowSorting="true" AllowFilteringByColumn="true" ShowGroupPanel="False"
            AllowPaging="true" PageSize="50" Width="100%" Height="600px" GroupingSettings-CaseSensitive="false"
            OnNeedDataSource="rdParentGrid_NeedDataSource"  OnPreRender="rdParentGrid_PreRender" >
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
</asp:Content>
