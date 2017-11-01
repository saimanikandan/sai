<%@ Page Title="CTD" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProjectCostToDate.aspx.cs" Inherits="IFNBilling.WebApp.UI.ProjectCostToDate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
   <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

        <script type="text/javascript">
       function GridCreated(sender, args) {
                var scrollArea = sender.GridDataDiv;
                scrollArea.style.height = "615px";
        }
       </script>
    </Telerik:RadScriptBlock>
    <style type="text/css">
        
    </style>
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
    <div id="ctdoptsctd" runat="server">
        <div style="float: left">
            <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="CTDBack" OnClick="CTDBack_Click" />&nbsp;
            <label for="forFrom">From</label>&nbsp;
            <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radDateFrom"></Telerik:RadDatePicker>
            &nbsp;
    <label for="forFrom">To</label>&nbsp;
            <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radDateTo"></Telerik:RadDatePicker>
            &nbsp;
     <Telerik:RadButton ID="radBtnGenerate" Text="Download" runat="server" OnClick="radBtnGenerate_Click" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
         Style="clear: both;">
     </Telerik:RadButton>
            <asp:Label ID="errorMessage" Text="From Date should not be greater than To Date" ForeColor="Red" runat="server" Visible="false"></asp:Label>

        </div>
        <div style="float: right;">
            <asp:Label ID="lblTotalCost" runat="server" Font-Size="Small" Font-Bold="true" ForeColor="Red" Style="padding-right: 5px"></asp:Label>
        </div>
        <div class="text-left">
            <div style="padding-bottom: 30px" />
        </div>
        <div class="text-right">
            <div style="padding-bottom: 30px" />
        </div>
    </div>
    <div id="divCTDHistory" runat="server">
        <Telerik:RadGrid ID="CTDHistory" runat="server" AutoGenerateColumns="true" AllowSorting="true" AllowFilteringByColumn="true" ShowGroupPanel="False" Visible="false"
            AllowPaging="true" PageSize="50" Width="100%" Height="600px" GroupingSettings-CaseSensitive="false">
            <MasterTableView PagerStyle-AlwaysVisible="true" TableLayout="Fixed" CommandItemDisplay="Top" EditFormSettings-EditColumn-ShowFilterIcon="false" Width="100%">
                <CommandItemSettings ShowExportToExcelButton="false" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
            </MasterTableView>
            <ClientSettings EnablePostBackOnRowClick="false" EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="true" />
                <Resizing AllowResizeToFit="true" ResizeGridOnColumnResize="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
            </ClientSettings>
        </Telerik:RadGrid>
    </div>
    <div id="divRadCostToDateHistory" runat="server">
        <Telerik:RadGrid runat="server" ID="RadCostToDateHistory" AllowPaging="True" AllowSorting="false" AutoGenerateColumns="false"
            OnItemCommand="RadCostToDateHistory_ItemCommand" OnPreRender="RadCostToDateHistory_PreRender" OnItemDataBound="RadCostToDateHistory_ItemDataBound" OnNeedDataSource="RadCostToDateHistory_NeedDataSource"
            PageSize="20" AllowFilteringByColumn="true" GroupingSettings-CaseSensitive="false">
            <PagerStyle Mode="NextPrevAndNumeric" Position="Top" PageSizeControlType="RadDropDownList" AlwaysVisible="True"></PagerStyle>
            <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" EnablePostBackOnRowClick="false"
                Selecting-AllowRowSelect="true" Resizing-ClipCellContentOnResize="false" Resizing-AllowResizeToFit="true"
                Resizing-ResizeGridOnColumnResize="true" Scrolling-AllowScroll="true" Scrolling-UseStaticHeaders="true"
                Scrolling-SaveScrollPosition="true" ClientEvents-OnRowSelected="OpenTranslationDetails">
                <Scrolling AllowScroll="true" UseStaticHeaders="True" SaveScrollPosition="true" />
                <ClientEvents OnGridCreated="GridCreated" />
            </ClientSettings>
            <MasterTableView EditMode="InPlace" ClientDataKeyNames="ProjectNumber,Fromdate,ToDate,CreatedBy,DownloadingDate,DownloadLink" Width="100%">
                <%--<Columns>
                    <Telerik:GridBoundColumn UniqueName="ProjectNumber" HeaderText="Project Number" DataField="ProjectNumber" CurrentFilterFunction="Contains" AllowFiltering="false" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" FilterControlWidth="100px" HeaderStyle-Wrap="true" ShowFilterIcon="false" />
                    <Telerik:GridBoundColumn UniqueName="Fromdate" HeaderText="From Date" DataField="FromDate" CurrentFilterFunction="Contains" AllowFiltering="false" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" FilterControlWidth="50px" HeaderStyle-Wrap="true" ShowFilterIcon="false" />
                    <Telerik:GridBoundColumn UniqueName="ToDate" HeaderText="To Date" DataField="ToDate" CurrentFilterFunction="Contains" AllowFiltering="false" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" FilterControlWidth="50px" HeaderStyle-Wrap="true" ShowFilterIcon="false" />
                    <Telerik:GridBoundColumn UniqueName="CreatedBy" HeaderText="CreatedBy" DataField="CreatedBy" CurrentFilterFunction="Contains" AllowFiltering="false" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" FilterControlWidth="50px" HeaderStyle-Wrap="true" ShowFilterIcon="false" />
                    <Telerik:GridBoundColumn UniqueName="DownloadingDate" HeaderText="DownloadingDate" DataField="DownloadingDate" CurrentFilterFunction="Contains" AllowFiltering="false" AutoPostBackOnFilter="true" HeaderStyle-Width="200px" FilterControlWidth="50px" HeaderStyle-Wrap="true" ShowFilterIcon="false" />


                    <Telerik:GridTemplateColumn UniqueName="DownloadLink" HeaderStyle-Width="75px" ShowFilterIcon="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="ImgCopy1" runat="server" CommandName="DownloadLink" HeaderStyle-Width="60px" HeaderText="Download" Text="Download" UniqueName="DownloadLink" />
                        </ItemTemplate>
                    </Telerik:GridTemplateColumn>

                </Columns>--%>

                <Columns>
                    <Telerik:GridTemplateColumn HeaderStyle-Width="0px" UniqueName="ProjectNumber" ShowFilterIcon="false" Display="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ProjectNumber" runat="server" Visible="false" CssClass="formTextField" Width="0" />
                        </ItemTemplate>
                    </Telerik:GridTemplateColumn>
                    <Telerik:GridTemplateColumn HeaderStyle-Width="100px" UniqueName="Fromdate" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblFromdate" runat="server" Text="From Date"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtFromdate" runat="server" Text='<%# Convert.ToDateTime(Eval("Fromdate")).ToString("dd-MM-yyyy") %>'></asp:Label>
                        </ItemTemplate>
                        <FilterTemplate>
                            <Telerik:RadDateTimePicker ID="radFromdate" DateInput-ReadOnly="true" TimePopupButton-Visible="false" AutoPostBackControl="None" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" runat="server"></Telerik:RadDateTimePicker>
                        </FilterTemplate>
                    </Telerik:GridTemplateColumn>

                    <Telerik:GridTemplateColumn HeaderStyle-Width="100px" UniqueName="ToDate" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtToDate" runat="server" Text='<%# Convert.ToDateTime(Eval("ToDate")).ToString("dd-MM-yyyy") %>'></asp:Label>
                        </ItemTemplate>
                        <FilterTemplate>
                            <Telerik:RadDateTimePicker ID="radToDate" DateInput-ReadOnly="true" TimePopupButton-Visible="false" AutoPostBackControl="None" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" runat="server"></Telerik:RadDateTimePicker>
                        </FilterTemplate>
                    </Telerik:GridTemplateColumn>

                    <Telerik:GridTemplateColumn HeaderStyle-Width="70px" UniqueName="CreatedBy" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedBy" runat="server" Text="Created By"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# Eval("CreatedBy") %>
                        </ItemTemplate>
                        <FilterTemplate>
                            <Telerik:RadTextBox ID="radTxtCreatedBy" runat="server" TextMode="SingleLine" Width="120px" AutoPostBack="true"  MaxLength="255"></Telerik:RadTextBox>
                        </FilterTemplate>
                    </Telerik:GridTemplateColumn>

                    <Telerik:GridTemplateColumn HeaderStyle-Width="100px" UniqueName="DownloadingDate" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblDownloadingDate" runat="server" Text="To Date"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtDownloadingDate" runat="server" Text='<%# Convert.ToDateTime(Eval("DownloadingDate")).ToString("dd-MM-yyyy hh:mm") %>'></asp:Label>
                        </ItemTemplate>
                        <FilterTemplate>
                            <Telerik:RadDateTimePicker ID="radDownloadingDate" DateInput-ReadOnly="true" TimePopupButton-Visible="false" AutoPostBackControl="None" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" runat="server"></Telerik:RadDateTimePicker>
                        </FilterTemplate>
                    </Telerik:GridTemplateColumn>

                    <Telerik:GridTemplateColumn UniqueName="DownloadLink" HeaderStyle-Width="75px" ShowFilterIcon="false" AllowFiltering="false" HeaderText="Download">
                        <ItemTemplate>
                            <asp:LinkButton ID="ImgCopy1" runat="server" CommandName="DownloadLink" HeaderStyle-Width="60px" HeaderText="Download" Text="Download" UniqueName="DownloadLink" />
                        </ItemTemplate>
                    </Telerik:GridTemplateColumn>

                </Columns>
            </MasterTableView>
            <ClientSettings EnablePostBackOnRowClick="false" EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="true" />
                <Resizing AllowResizeToFit="true" ResizeGridOnColumnResize="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
            </ClientSettings>
        </Telerik:RadGrid>
    </div>

    <asp:HiddenField ID="hdnProjectName" runat="server" />
    <asp:HiddenField ID="hdnProjectTypename" runat="server" />
     <Telerik:RadWindowManager ID="Radpopupwindow" runat="server"></Telerik:RadWindowManager>
    <Telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <Telerik:RadAjaxManagerProxy ID="AjaxManagerproxy1" runat="server">
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="radBtnGenerate">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divCTDHistory" />
                    <Telerik:AjaxUpdatedControl ControlID="CTDHistory" />
                    <Telerik:AjaxUpdatedControl ControlID="divRadCostToDateHistory" />
                    <Telerik:AjaxUpdatedControl ControlID="RadCostToDateHistory" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

            <Telerik:AjaxSetting AjaxControlID="CTDHistory">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="divCTDHistory" />
                    <Telerik:AjaxUpdatedControl ControlID="divRadCostToDateHistory" />
                    <Telerik:AjaxUpdatedControl ControlID="RadCostToDateHistory" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
        </AjaxSettings>
    </Telerik:RadAjaxManagerProxy>
</asp:Content>
