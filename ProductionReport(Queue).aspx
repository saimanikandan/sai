<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="ProductionReport(Queue).aspx.cs" Inherits="IFNBilling.WebApp.UI.ProductionReport_Queue_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h4>
        <label for="Head" id="Head" runat="server">Production Queue Status Report</label>
        <asp:Label ID="lblProjectName" runat="server" Font-Size="Small" Font-Bold="true" Style="float: right"></asp:Label>
    </h4>
    <br />
    <div id="ProductionQueueReports" runat="server">
        <asp:ImageButton ImageUrl="~/App_Themes/Default/Images/backicon.png" OnClick="aspBtnBack_Click" runat="server" ID="aspBtnBack" />&nbsp;
    <label for="forFrom">Production Type</label>&nbsp;
        <Telerik:RadDropDownList ID="radDdlProdType" runat="server"></Telerik:RadDropDownList>
        &nbsp;
    <label for="forFrom">Job Status</label>&nbsp;
           <Telerik:RadDropDownList ID="radDdlJobStatus" runat="server"></Telerik:RadDropDownList>
        &nbsp;
     <Telerik:RadButton ID="radBtnGenerate" OnClick="radBtnGenerate_Click" Text="Generate" runat="server" Skin="MetroTouch" BackColor="#25a0da" AutoPostBack="true" ForeColor="White"
         SingleClick="true" Style="clear: both;">
     </Telerik:RadButton>
        &nbsp;
        <asp:RequiredFieldValidator ID="rqvProdType" ControlToValidate="radDdlProdType" InitialValue="(Select)" ErrorMessage="Please select Production Type" runat="server" Display="Dynamic" />
        <Telerik:RadButton ID="radBtnExport" Text="Export to Excel" runat="server" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White"
            SingleClick="true" Style="clear: both;" Visible="false">
        </Telerik:RadButton>
        <div style="float: right" runat="server" visible="true">
            <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="ExportToExcel" AutoPostBack="true" Width="30px" Height="30px" runat="server" Visible="true" OnClick="QReportExportToExcel_Click"></asp:ImageButton>
            <asp:ImageButton AlternateText="Export To PDF" ToolTip="Export To PDF" ImageUrl="~/App_Themes/Default/Images/pdf.png" ID="ExportToPdf" AutoPostBack="true" Width="28px" Height="28px" Visible="false" runat="server"></asp:ImageButton>
        </div>
    </div>
    <br />
    <div class="col-lg-12" id="divReports" style="padding-bottom: 40px">
        <div class="form-group" id="QueueReport" runat="server">
            <Telerik:RadGrid ID="radGrdQueueReport" ClientSettings-Scrolling-AllowScroll="true" OnItemCreated="radGrdQueueReport_ItemCreated" OnNeedDataSource="radGrdQueueReport_NeedDataSource" Height="300px" ShowHeader="true" runat="server">
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="true" />

                </ClientSettings>
                <MasterTableView DataKeyNames="ProjectTypeName" ShowHeadersWhenNoRecords="true" ShowHeader="true" AutoGenerateColumns="false" Width="100%">
                    <NoRecordsTemplate>
                        <table id="Table1" width="100%" border="0" cellpadding="20" cellspacing="20" runat="server">
                            <tr>
                                <td id="Td1" align="center" runat="server">
                                    <b>No Results found</b>
                                </td>
                            </tr>
                        </table>
                    </NoRecordsTemplate>
                    <ColumnGroups>
                        <Telerik:GridColumnGroup HeaderText="Overdue" Name="Overdue" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup HeaderText="Due Today" Name="DueToday" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup HeaderText="Jobs by Due Date" Name="JobsbyDue" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup Name="DAT" HeaderText="Tomorrow" ParentGroupName="JobsbyDue" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup Name="DATT" HeaderText="DayAfter" ParentGroupName="JobsbyDue" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup Name="DATTT" HeaderText="TwoDaysAfter" ParentGroupName="JobsbyDue" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup Name="RestofDays" HeaderText="Rest" ParentGroupName="JobsbyDue" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                        <Telerik:GridColumnGroup Name="Total" HeaderText="Total" HeaderStyle-HorizontalAlign="Center"></Telerik:GridColumnGroup>
                    </ColumnGroups>
                    <Columns>
                        <Telerik:GridBoundColumn UniqueName="ProjectType" HeaderText="ProjectType" Display="true" DataField="ProjectTypeName"></Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn UniqueName="OJobs" HeaderText="Jobs" Visible="true" ColumnGroupName="Overdue">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkJobs_OD" runat="server" Text='<%#Eval("OverDue_Jobs") %>' CommandArgument='<%# Eval("ProjectTypeID") + "^" + Eval("ProjectTypeName")  %>'
                                    Enabled='<%# ((int?)Eval("OverDue_Jobs") >0  && (string)Eval("ProjectTypeName") != "TOTAL") ? true : false %>'
                                    OnClick="GetDetails_Click" CommandName="OD"></asp:LinkButton>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                        <Telerik:GridBoundColumn UniqueName="OPages" HeaderText="Pages" DataField="OverDue_NoOfPages" ColumnGroupName="Overdue"></Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn UniqueName="DTJobs" HeaderText="Jobs" Visible="true" ColumnGroupName="DueToday">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkJobs_D1" runat="server" Text='<%#Eval("Due_Today") %>' CommandArgument='<%# Eval("ProjectTypeID") + "^" + Eval("ProjectTypeName") %>'
                                    Enabled='<%# ((int?)Eval("Due_Today") >0  && (string)Eval("ProjectTypeName") != "TOTAL") ? true : false %>'
                                    OnClick="GetDetails_Click" CommandName="D0"></asp:LinkButton>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                        <Telerik:GridBoundColumn UniqueName="DTPages" HeaderText="Pages" DataField="Due_NoOfPages" ColumnGroupName="DueToday"></Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn UniqueName="JBTomJobs" HeaderText="Jobs" Visible="true" ColumnGroupName="DAT">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkJobs_D2" runat="server" Text='<%#Eval("Tomoro") %>' CommandArgument='<%# Eval("ProjectTypeID") + "^" + Eval("ProjectTypeName") %>'
                                    Enabled='<%# ((int?)Eval("Tomoro") >0  && (string)Eval("ProjectTypeName") != "TOTAL") ? true : false %>'
                                    OnClick="GetDetails_Click" CommandName="D1"></asp:LinkButton>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                        <Telerik:GridBoundColumn UniqueName="JBTomPages" HeaderText="Pages" DataField="Tomoro_NoOfPages" ColumnGroupName="DAT"></Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn UniqueName="JBDAJobs" HeaderText="Jobs" Visible="true" ColumnGroupName="DATT">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkJobs_D3" runat="server" Text='<%#Eval("DATomoro") %>' CommandArgument='<%# Eval("ProjectTypeID") + "^" + Eval("ProjectTypeName") %>'
                                    Enabled='<%# ((int?)Eval("DATomoro") >0  && (string)Eval("ProjectTypeName") != "TOTAL") ? true : false %>'
                                    OnClick="GetDetails_Click" CommandName="D2"></asp:LinkButton>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                        <Telerik:GridBoundColumn UniqueName="JBDAPages" HeaderText="Pages" DataField="DATomoro_NoOfPages" ColumnGroupName="DATT"></Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn UniqueName="JBRDJobs" HeaderText="Jobs" Visible="true" ColumnGroupName="DATTT">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkJobs_D4" runat="server" Text='<%#Eval("After2Days") %>' CommandArgument='<%# Eval("ProjectTypeID") + "^" + Eval("ProjectTypeName") %>'
                                    Enabled='<%# ((int?)Eval("After2Days") >0  && (string)Eval("ProjectTypeName") != "TOTAL") ? true : false %>'
                                    OnClick="GetDetails_Click" CommandName="D3"></asp:LinkButton>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                        <Telerik:GridBoundColumn UniqueName="JBRDPages" HeaderText="Pages" DataField="After2Days_NoOfPages" ColumnGroupName="DATTT"></Telerik:GridBoundColumn>
                        <Telerik:GridTemplateColumn UniqueName="JBRDJobs" HeaderText="Jobs" Visible="true" ColumnGroupName="RestofDays">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkJobs_D4Above" runat="server" Text='<%#Eval("RestOfDays") %>' CommandArgument='<%# Eval("ProjectTypeID") + "^" + Eval("ProjectTypeName") %>'
                                    Enabled='<%# ((int?)Eval("RestOfDays") >0  && (string)Eval("ProjectTypeName") != "TOTAL") ? true : false %>'
                                    OnClick="GetDetails_Click" CommandName="D4"></asp:LinkButton>
                            </ItemTemplate>
                        </Telerik:GridTemplateColumn>
                        <Telerik:GridBoundColumn UniqueName="JBRDPages" HeaderText="Pages" DataField="RestOfDays_NoOfPages" ColumnGroupName="RestofDays"></Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn UniqueName="TotJobs" HeaderText="Jobs" DataField="TOTAL_JOBS" ColumnGroupName="Total"></Telerik:GridBoundColumn>
                        <Telerik:GridBoundColumn UniqueName="TotPages" HeaderText="Pages" DataField="TOTAL_PAGES" ColumnGroupName="Total"></Telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </Telerik:RadGrid>
        </div>
        <br />
        <div class="form-group" id="divQDrilldownReport" runat="server">
            <div id="divDrilldown" runat="server" visible="true">
                <asp:Label runat="server" ID="lblDrilldownCaption" Font-Size="Small" Font-Bold="true" Style="float: left" />
                <asp:ImageButton AlternateText="Export To Excel" ToolTip="Export To Excel" ImageUrl="~/App_Themes/Default/Images/Office-Excel-icon.png" ID="imgDrilldown" AutoPostBack="true" Width="30px" Height="30px" runat="server" Visible="true" Style="float: right" OnClick="QDrilldownReportExportToExcel_Click"></asp:ImageButton>
            </div>
            <Telerik:RadGrid ID="radGrdBatchDetails" ClientSettings-Scrolling-AllowScroll="true" AllowPaging="True" AllowSorting="true"
                AllowFilteringByColumn="true" PageSize="20" Height="400px" ShowHeader="true" runat="server" AutoGenerateColumns="true" ShowGroupPanel="False"
                OnNeedDataSource="radGrdBatchDetails_NeedDataSource" GroupingSettings-CaseSensitive="false"
                OnPreRender="radGrdBatchDetails_OnPreRender">
                <ClientSettings EnablePostBackOnRowClick="false" Resizing-ClipCellContentOnResize="false" EnableRowHoverStyle="true" AllowKeyboardNavigation="true" KeyboardNavigationSettings-EnableKeyboardShortcuts="true"
                    Selecting-AllowRowSelect="true" Resizing-AllowResizeToFit="true" Resizing-ResizeGridOnColumnResize="true"
                    Scrolling-AllowScroll="true" Scrolling-UseStaticHeaders="true" Scrolling-SaveScrollPosition="true" />
                <PagerStyle Mode="NextPrevAndNumeric" Position="Top" PageSizeControlType="RadDropDownList" AlwaysVisible="True"></PagerStyle>
                <HeaderStyle  Width="100%" />
                <ItemStyle  Width="100%" />
                <ClientSettings AllowDragToGroup="True">
                    <Scrolling AllowScroll="true" ScrollHeight="100%" UseStaticHeaders="True" SaveScrollPosition="true" />
                </ClientSettings>
                <MasterTableView Width="100%" TableLayout="Fixed" >
                    <NoRecordsTemplate>
                        <table id="Table1" width="100%" border="0" cellpadding="20" cellspacing="20" runat="server">
                            <tr>
                                <td id="Td1" align="center" runat="server">
                                    <b>No Results found</b>
                                </td>
                            </tr>
                        </table>
                    </NoRecordsTemplate>
                </MasterTableView>
            </Telerik:RadGrid>
        </div>
    </div>
</asp:Content>
