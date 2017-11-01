<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="OperationsReport.aspx.cs" Inherits="IFNBilling.WebApp.UI.OperationsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function OnDateSelected(sender, eventArgs) {
                //debugger;
                var datepicker1 = $find("<%= FromDate.ClientID %>");
                var date = datepicker1.get_selectedDate();
                var datepicker2 = $find("<%= ToDate.ClientID %>");
                datepicker2.set_minDate(date);

                var currentDate = new Date();
                var toDate = new Date(date);
                toDate.setDate(date.getDate() + 91);
                if (toDate > currentDate) {
                    //datepicker2.set_selectedDate(currentDate);
                    datepicker2.set_maxDate(currentDate);
                }
                else {
                    datepicker2.set_maxDate(toDate);
                }
            }
        </script>
    </Telerik:RadScriptBlock>
    <br />
    <h4>
        <label for="Head" id="Heads" runat="server">BSB Data Dump Report</label>
    </h4>
    <br />
    <Telerik:RadWindowManager ID="Radpopupwindow" runat="server"></Telerik:RadWindowManager>
    <div id="divOnTimeReportFilterControls" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" runat="server" ID="aspBtnBack" OnClick="aspBtnBack_Click" />
        <div class="form-group">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forProdType">Production Type</label>
                <Telerik:RadDropDownList ID="ddlProdType" runat="server" AutoPostBack="false" Width="200px" SelectedValue='<%#Bind("Name") %>' InitialValue="(Select)">
                    <Items>
                        <Telerik:DropDownListItem Text="(Select)" Value="-1" />
                        <Telerik:DropDownListItem Text="(TypeSet,Translation,SideJob)" Value="1" />
                        <Telerik:DropDownListItem Text="Media" Value="2" />
                        <Telerik:DropDownListItem Text="Hospitality" Value="3" />
                        <Telerik:DropDownListItem Text="Print" Value="4" />
                    </Items>
                </Telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlProdType" runat="server" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="ddlProdType" ErrorMessage="Select Production Type" InitialValue="(Select)" ValidationGroup="SubmitValidation"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group" id="DateRange">
            <div class="col-xs-8">
                <label class="col-xs-2" for="forFromDate">Completed Batch Date </label>
                <Telerik:RadDatePicker AutoPostBack="false" class="col-xs-2" DateInput-ReadOnly="true" ID="FromDate" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ClientEvents-OnDateSelected="OnDateSelected" />
                <label class="col-" for="forToDate">To   </label>
                <Telerik:RadDatePicker AutoPostBack="false" class="col-xs-2" DateInput-ReadOnly="true" ID="ToDate" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" ClientEvents-OnDateSelected="OnDateSelected" />
                <asp:CompareValidator ID="dateCompareValidator" runat="server" ControlToValidate="ToDate" ControlToCompare="FromDate" ForeColor="Red"
                    Operator="GreaterThanEqual" Type="Date" ErrorMessage="Please correct the Date Range" Display="Dynamic" ValidationGroup="SubmitValidation">
                </asp:CompareValidator>
            </div>
            <div class="col-xs-8">
                <small class="col-xs-4"></small>
                <small class="col-xs-4">* Max period length – 3 Months</small>
            </div>
        </div>
        <Telerik:RadButton ID="rdbtnGenerate" runat="server" Text="Generate" AutoPostBack="true" OnClick="rdbtnGenerate_Click" ValidationGroup="SubmitValidation"
            Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" Style="clear: both; margin-left: 15px;" SingleClick="false">
        </Telerik:RadButton>
    </div>
    <br />
</asp:Content>