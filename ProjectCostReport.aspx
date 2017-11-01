<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="ProjectCostReport.aspx.cs" Inherits="IFNBilling.WebApp.UI.ProjectCostReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" style="height:auto">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server" style="height:auto">
    <script type="text/javascript">
        function GridCreated(sender, args) {
            var scrollArea = sender.GridDataDiv;
            scrollArea.style.height ="750px";
        }
    </script>
    <h4>
        <label for="Head" id="Head" runat="server">Project Cost Report</label>
         <asp:Label ID="lblProjectName" runat="server" Font-Size="Small" Font-Bold="true" style="float:right"></asp:Label>
    </h4>
    <br />

    <div id="costreportopts" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="aspBtnBack" OnClick="aspBtnBack_Click" />&nbsp;
    <label for="forFrom">From</label>&nbsp;
            <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radDateFrom"></Telerik:RadDatePicker>
        &nbsp;
    <label for="forFrom">To</label>&nbsp;
            <Telerik:RadDatePicker runat="server" DateInput-ReadOnly="true" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ID="radDateTo"></Telerik:RadDatePicker>
        &nbsp;
     <Telerik:RadButton ID="radBtnGenerate" Text="View" runat="server" Skin="MetroTouch" BackColor="#25a0da" OnClick="radBtnGenerate_Click" AutoPostBack="true" ForeColor="White"
         SingleClick="true" Style="clear: both;">
     </Telerik:RadButton>
        &nbsp;
      <Telerik:RadButton ID="radBtnExport" Text="Export to Excel" runat="server" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White"
          SingleClick="true" Style="clear: both;" Visible="false">
      </Telerik:RadButton> 
        
        <div style="float: right">

            <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="ExportToExcel" AutoPostBack="true" Width="30px" Height="30px" OnClick="ExportToExcel_Click" runat="server" Visible="true"></asp:ImageButton>
            <asp:ImageButton AlternateText="Export To PDF" ToolTip="Export To PDF" ImageUrl="~/App_Themes/Default/Images/pdf.png" ID="ExportToPdf" AutoPostBack="true" OnClick="ExportToPdf_Click"  Width="28px" Height="28px" Visible="true" runat="server" ></asp:ImageButton>
        </div>


    </div>
    <br />
    <br />

    <div class="col-lg-12" id="test">
        <div class="form-group" id="CostReport" runat="server">
            <Telerik:RadGrid ID="radGrdProjectCost" OnNeedDataSource="radGrdProjectCost_NeedDataSource" ClientSettings-Scrolling-AllowScroll="true" Height="800px" ShowHeader="true" runat="server" >
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="true"/>
                     <ClientEvents OnGridCreated="GridCreated" />
                </ClientSettings>
                <MasterTableView ShowHeadersWhenNoRecords="true" ShowHeader="true" AutoGenerateColumns="false" Width="100%">
                    <NoRecordsTemplate>
                        <table id="Table1" width="100%" border="0" cellpadding="20" cellspacing="20" runat="server">
                            <tr>
                                <td id="Td1" align="center" runat="server">
                                    <b>No Results found</b>

                                </td>
                            </tr>
                        </table>
                    </NoRecordsTemplate>
                    <Columns>
                        <Telerik:GridBoundColumn UniqueName="ProjectNumber" HeaderText="ProjectNumber" Display="false"></Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn UniqueName="serviceType" HeaderText="Service Type" DataField="Item"></Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn UniqueName="unitType" HeaderText="Unit Type" DataField="UnitType"></Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn UniqueName="completedunits" HeaderText="Completed Units" DataField="Pages"></Telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </Telerik:RadGrid>
        </div>  

    </div>
            <asp:HiddenField id="hdnProjectName" runat="server" />
          <asp:HiddenField id="hdnProjectTypename" runat="server" />
</asp:Content>
