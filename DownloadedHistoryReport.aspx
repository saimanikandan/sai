<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DownloadedHistoryReport.aspx.cs" Inherits="IFNBilling.WebApp.UI.DownloadedHistoryReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

        <script type="text/javascript">
            

            function RequestStart(sender, args) {

                

                if (args.get_eventTarget().indexOf("DownloadedHistoryExportToExcel") >= 0)
                    args.set_enableAjax(false);

                if (args.get_eventTarget().indexOf("Download") >= 0)
                    args.set_enableAjax(false);

               
            }
            function GridCreated(sender, args) {
                var scrollArea = sender.GridDataDiv;
                scrollArea.style.height = "615px";
            }
           </script>

    </Telerik:RadScriptBlock>

    <h4>
        <label for="Head" id="Head" runat="server">CTD History Report</label>
    </h4>
    <br />
      <div id="divBulkUpdateHistory" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" OnClick="aspBulkBtnBack_Click" runat="server" ID="aspBulkBtnBack" />&nbsp;
    <label for="forFrom">Report Generated From</label>
     <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="false" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radFromDate" ValidationGroup="DownloadedProjectandJobs"></Telerik:RadDatePicker>
    <label for="forFrom">Report Generated To</label>
      <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="false" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radToDate" ValidationGroup="DownloadedProjectandJobs"></Telerik:RadDatePicker>
        &nbsp;
     <Telerik:RadButton ID="radBtnGenerate" OnClick="radBtnGenerate_Click" Text="View" runat="server" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
         Style="clear: both;" ValidationGroup="DownloadedProjectandJobs">
     </Telerik:RadButton>
        &nbsp;
        <asp:RequiredFieldValidator ID="rqBulkProdType" ControlToValidate="radFromDate" InitialValue="" ErrorMessage="Please select from date" runat="server" Display="Dynamic" ValidationGroup="DownloadedProjectandJobs"/>
           <asp:RequiredFieldValidator runat="server" ID="ValidatorProjectNumber" ErrorMessage="Please select To date" ControlToValidate="radToDate" InitialValue="" ValidationGroup="DownloadedProjectandJobs" />
        <Telerik:RadButton ID="radBtnExport" Text="Export to Excel" runat="server" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" AutoPostBack="true"
            Style="clear: both;" Visible="false">
        </Telerik:RadButton>
    </div>
     <asp:Label ID="errorMessage" Text="From Date should not be greater than To Date" ForeColor="Red" runat="server" Visible="false"></asp:Label>
    
        
       
        <div id="divDownloadedHistoryGrid" runat="server" style="padding-bottom: 30px;padding-top: 10px">
            <div id="divGridExportToExcel" runat="server" visible="true">
                <asp:Label runat="server" ID="lblGridCaption" Font-Size="Small" Font-Bold="true" Style="float: left" />
                <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="DownloadedHistoryExportToExcel" AutoPostBack="true" Width="30px" Height="30px" runat="server" Visible="true" Style="float: right" OnClick="DownloadedHistoryExportToExcel_Click"></asp:ImageButton>
        </div>
        <Telerik:RadGrid ID="rdDownloadedHistoryGrid" runat="server" AutoGenerateColumns="false" AllowSorting="true" AllowFilteringByColumn="true" ShowGroupPanel="false"
            AllowPaging="true" PageSize="50" Width="100%" Height="400px" GroupingSettings-CaseSensitive="false"
            OnNeedDataSource="rdDownloadedHistoryGrid_NeedDataSource" OnItemCommand="rdDownloadedHistoryGrid_ItemCommand" >
             <PagerStyle Mode="NextPrevAndNumeric" Position="Top" PageSizeControlType="RadDropDownList" AlwaysVisible="True"></PagerStyle>
                    <ClientSettings>
                        <Scrolling AllowScroll="true" UseStaticHeaders="True" SaveScrollPosition="false" />
                        <ClientEvents OnGridCreated="GridCreated" />
                    </ClientSettings>
                    <ExportSettings ExportOnlyData="true">
                    </ExportSettings>
                    <MasterTableView ShowHeadersWhenNoRecords="true" ShowHeader="true" AutoGenerateColumns="false" ClientDataKeyNames="ProjectNumber,Fromdate,ToDate,CreatedBy,DownloadingDate,DownloadLink" Width="100%">
                        <CommandItemSettings ShowAddNewRecordButton="false" ShowCancelChangesButton="true" ShowRefreshButton="false" SaveChangesText="Save" CancelChangesText="Cancel" />

                        <BatchEditingSettings OpenEditingEvent="Click" EditType="Cell"  />

                        <NoRecordsTemplate>
                            <table id="Table1" width="100%" border="0" cellpadding="20" cellspacing="20" runat="server">
                                <tr>
                                    <td id="Td1" align="center" runat="server" font-family="Arial" font-size="10pt">
                                        <b>No Results found</b>

                                    </td>
                                </tr>
                            </table>
                        </NoRecordsTemplate>
                        <Columns>
                                <Telerik:GridBoundColumn HeaderText="Project Number" CurrentFilterFunction="StartsWith" HeaderStyle-Width="150px" FilterControlWidth="130px" ItemStyle-Wrap="true" AutoPostBackOnFilter="true" HeaderStyle-Wrap="true" ShowFilterIcon="false" UniqueName="ProjectNumber" DataField="ProjectNumber" ItemStyle-HorizontalAlign="left">
                                    <ItemStyle Wrap="true" />
                                </Telerik:GridBoundColumn>

                                <Telerik:GridTemplateColumn HeaderStyle-Width="100px" UniqueName="Fromdate" >
                                    <HeaderTemplate>
                                        <asp:Label ID="lblFromdate" runat="server" Text="From Date"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="txtFromdate" runat="server" Text='<%# Convert.ToDateTime(Eval("FromDate")).ToString("dd-MM-yyyy") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FilterTemplate>
                                        <Telerik:RadDateTimePicker ID="radFromdate" DateInput-ReadOnly="true" TimePopupButton-Visible="false" AutoPostBackControl="Both" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" runat="server"></Telerik:RadDateTimePicker>
                                    </FilterTemplate>
                                </Telerik:GridTemplateColumn>

                                <Telerik:GridTemplateColumn HeaderStyle-Width="100px" UniqueName="ToDate"  >
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
                            
                               <Telerik:GridBoundColumn HeaderText="Created By" CurrentFilterFunction="StartsWith" HeaderStyle-Width="150px" FilterControlWidth="130px" ItemStyle-Wrap="true" AutoPostBackOnFilter="true" HeaderStyle-Wrap="true" ShowFilterIcon="false" UniqueName="CreatedBy" DataField="CreatedBy" ItemStyle-HorizontalAlign="left">
                                    <ItemStyle Wrap="true" />
                                </Telerik:GridBoundColumn>


                                <Telerik:GridTemplateColumn HeaderStyle-Width="100px" UniqueName="DownloadingDate" >
                                    <HeaderTemplate>
                                        <asp:Label ID="lblDownloadingDate" runat="server" Text="Report Generated Date"></asp:Label>
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
        </Telerik:RadGrid>
    </div>
      <Telerik:RadWindowManager ID="Radpopupwindow" runat="server"></Telerik:RadWindowManager>
    <Telerik:RadAjaxLoadingPanel ID="rdAjaxLoader" runat="server" />
    <Telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" >
          <ClientEvents OnRequestStart="RequestStart" />
        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="radFromDate" >
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="errorMessage" />
                         <Telerik:AjaxUpdatedControl ControlID="divDownloadedHistoryGrid" LoadingPanelID="rdAjaxLoader" />   
                </UpdatedControls>
            </Telerik:AjaxSetting>
            <Telerik:AjaxSetting AjaxControlID="radToDate" >
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="errorMessage" UpdatePanelRenderMode="Inline" />
                         <Telerik:AjaxUpdatedControl ControlID="divDownloadedHistoryGrid" LoadingPanelID="rdAjaxLoader" />   
                </UpdatedControls>
            </Telerik:AjaxSetting>

            <Telerik:AjaxSetting AjaxControlID="radBtnGenerate" >
                <UpdatedControls>
                     <Telerik:AjaxUpdatedControl ControlID="errorMessage" UpdatePanelRenderMode="Inline"/>
                       <Telerik:AjaxUpdatedControl ControlID="divDownloadedHistoryGrid" LoadingPanelID="rdAjaxLoader" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

           <Telerik:AjaxSetting AjaxControlID="divDownloadedHistoryGrid">
                <UpdatedControls>
                     <Telerik:AjaxUpdatedControl ControlID="errorMessage" UpdatePanelRenderMode="Inline" />
                    <Telerik:AjaxUpdatedControl ControlID="rdDownloadedHistoryGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

            
           <Telerik:AjaxSetting AjaxControlID="rdDownloadedHistoryGrid">
                <UpdatedControls>
                     <Telerik:AjaxUpdatedControl ControlID="divDownloadedHistoryGrid" />
                    <Telerik:AjaxUpdatedControl ControlID="rdDownloadedHistoryGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

            
           <Telerik:AjaxSetting AjaxControlID="DownloadedHistoryExportToExcel">
                <UpdatedControls>            
                     <Telerik:AjaxUpdatedControl ControlID="divDownloadedHistoryGrid" />        
                    <Telerik:AjaxUpdatedControl ControlID="rdDownloadedHistoryGrid" />
                </UpdatedControls>
            </Telerik:AjaxSetting>
            </AjaxSettings>
        </Telerik:RadAjaxManager>

</asp:Content>
