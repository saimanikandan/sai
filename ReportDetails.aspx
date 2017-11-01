<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ReportDetails.aspx.cs" Inherits="IFNBilling.WebApp.UI.ReportDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <style type="text/css">
        div.SubMenu {
            margin: 0px;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
            color: rgb(37, 160, 218);
            font-size: small;
            font-weight: bold;
            padding-top: 2px;
            padding-top: 5px;
            padding-bottom: 5px;
            width: auto;
            white-space: nowrap;
            height: 35px;
        }
    </style>
    <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

        <script type="text/javascript">
            function Clear(sender, args) {
                var elements = document.getElementsByTagName("input");
                for (var i = 0; i < elements.length; i++) {
                    if (elements[i].type == "text") {
                        elements[i].value = "";
                    }
                }
            }

            function OnClientButtonClickingHandler(sender, eventArgs) {
                if (eventArgs.get_item().get_value() == "noPostback") {
                    eventArgs.set_cancel(true);
                }
            }

            function OnClientItemClicking(sender, eventArgs) {
                eventArgs.set_cancel(true); // Cancel the postback
            }

            function OnClientItemClicked(sender, args) {

                document.getElementById('<%=hfClickItem.ClientID %>').value = args.get_item().get_text();

                var projectDistroGrid = $find("<%= radGridProjectSearch.ClientID %>");
                if (typeof projectDistroGrid != "undefined" && projectDistroGrid != null) {
                    projectDistroGrid.get_masterTableView().rebind();
                }

                //eventArgs.set_cancel(true); // Cancel the postback
                //alert("The " + args.get_item().get_text() + " item has parthiban clicked");
            }

        </script>

    </Telerik:RadScriptBlock>

    <Telerik:RadSplitter ID="radSplitter" runat="server" Width="100%" Height="750px" Orientation="Vertical">

        <Telerik:RadPane ID="radLeftPane" runat="server" Width="20%" Visible="true">

            <div style="padding-right: 0px; font-size: 100px;">

                <Telerik:RadPanelBar runat="server" ID="RadPanelBarReport" Height="510px" Width="100%" ExpandMode="FullExpandedItem" CausesValidation="false" OnClientItemClicked="OnClientItemClicked" RenderMode="Lightweight">

                    <Items>

                        <Telerik:RadPanelItem Text="Project Cost Reports" Style="padding-right: 0px; font-size: 16px" SelectedCssClass="active" CssClass="" Expanded="false" Visible="false">

                            <ContentTemplate>

                                <table>
                                    <tr>
                                        <td>
                                            <div class="col-xs-offset-1">
                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Number</label>
                                                    <div>
                                                        <Telerik:RadNumericTextBox ID="radTxtProjectNumber" MaxLength="9" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" runat="server" Width="200px"></Telerik:RadNumericTextBox>
                                                    </div>
                                                </div>

                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Status</label>
                                                    <div>
                                                        <Telerik:RadDropDownList ID="radDdlProjectStatus" runat="server" SelectedText="Select" Width="200px">
                                                        </Telerik:RadDropDownList>
                                                    </div>
                                                </div>
                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Type</label>
                                                    <div>
                                                        <Telerik:RadDropDownList ID="radDdlProjectType" runat="server" SelectedText="Select" Width="200px">
                                                        </Telerik:RadDropDownList>
                                                    </div>
                                                </div>

                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Start Date From </label>
                                                    <div>
                                                        <Telerik:RadDatePicker DateInput-ReadOnly="true" ID="radclrProjectDateFrom" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" />

                                                    </div>
                                                </div>
                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Start Date To</label>
                                                    <div>
                                                        <Telerik:RadDatePicker DateInput-ReadOnly="true" ID="radclrProjectDateTo" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" />


                                                    </div>
                                                </div>
                                                <br />
                                                <div>
                                                    <Telerik:RadButton ID="radBtnSearch" runat="server" Text="Search" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" OnClick="projectSearchClick" ValidationGroup="" />
                                                    <Telerik:RadButton ID="radBtnClear" runat="server" Text="Clear" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" OnClientClicked="Clear" OnClick="radBtnClear_Click" />
                                                </div>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="word" ID="error" ForeColor="Red" />

                                            </div>

                                        </td>
                                    </tr>
                                </table>

                            </ContentTemplate>


                        </Telerik:RadPanelItem>

                        <Telerik:RadPanelItem Text="Cost To Date (CTD) Report" runat="server" PostBack="false" Style="padding-right: 0px; font-size: 16px" CssClass="" Expanded="True">

                            <ContentTemplate>

                                <table style="visibility: visible">
                                    <tr>
                                        <td>
                                            <div>
                                                <h4>&nbsp;</h4>
                                            </div>
                                            <div class="col-xs-offset-1">
                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Number</label>
                                                    <div>
                                                        <Telerik:RadNumericTextBox ID="ctdradTxtProjectNumber" NumberFormat-DecimalDigits="0" MaxLength="9" NumberFormat-GroupSeparator="" runat="server" Width="200px"></Telerik:RadNumericTextBox>
                                                    </div>
                                                </div>

                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Status</label>
                                                    <div>
                                                        <Telerik:RadDropDownList ID="ctdradDdlProjectStatus" runat="server" SelectedText="Select" Width="200px">
                                                        </Telerik:RadDropDownList>
                                                    </div>
                                                </div>
                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Type</label>
                                                    <div>
                                                        <Telerik:RadDropDownList ID="ctdradDdlProjectType" runat="server" SelectedText="Select" Width="200px">
                                                        </Telerik:RadDropDownList>
                                                    </div>
                                                </div>

                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Start Date From </label>
                                                    <div>
                                                        <Telerik:RadDatePicker DateInput-ReadOnly="true" ID="ctdradclrProjectDateFrom" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" />

                                                    </div>
                                                </div>
                                                <div style="margin-top: 10px">
                                                    <label class="control-label">Project Start Date To</label>
                                                    <div>
                                                        <Telerik:RadDatePicker DateInput-ReadOnly="true" ID="ctdradclrProjectDateTo" runat="server" Width="200px" DateInput-DisplayDateFormat="dd-MMM-yyyy" Calendar-CultureInfo="en-GB" />


                                                    </div>
                                                </div>
                                                <br />
                                                <div>
                                                    <Telerik:RadButton ID="ctdradBtnSearch" runat="server" Text="Search" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" OnClick="ctdprojectSearchClick" ValidationGroup="" />
                                                    <Telerik:RadButton ID="ctdradBtnClear" runat="server" Text="Clear" Skin="MetroTouch" BackColor="#25a0da" ForeColor="White" OnClientClicked="Clear" OnClick="ctdradBtnClear_Click" />
                                                </div>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="word" ID="ctderror" ForeColor="Red" />

                                            </div>

                                        </td>
                                    </tr>
                                </table>

                            </ContentTemplate>


                        </Telerik:RadPanelItem>

                        <Telerik:RadPanelItem Text="Production Reports" PostBack="false" Style="padding-right: 0px; font-size: 16px" CssClass="" Visible="true" Expanded="True">
                            <Items>
                                <Telerik:RadPanelItem NavigateUrl="ProductionReport(Queue).aspx" Text="Queue Status" />
                                <Telerik:RadPanelItem NavigateUrl="RptCompletedPages.aspx" Text="Pages Completed" />
                                <Telerik:RadPanelItem NavigateUrl="RptReceivedVsCompleted.aspx" Text="Received Vs Completed" />
                                <Telerik:RadPanelItem NavigateUrl="RptOnTime.aspx" Text="On Time" />
                                <Telerik:RadPanelItem NavigateUrl="rptOpenBatches.aspx" Text="Open Batches" />
                                <Telerik:RadPanelItem NavigateUrl="BulkUpdateHistory.aspx" Text="Bulk Update History" />
                                 <Telerik:RadPanelItem NavigateUrl="LogReports.aspx" Text="Log Report" />
                                 <Telerik:RadPanelItem NavigateUrl="DownloadedHistoryReport.aspx" Text="CTD History" />                                
                            </Items>                          
                        </Telerik:RadPanelItem>

                        <Telerik:RadPanelItem Text="Operations Reports (India)" PostBack="false" Style="padding-right: 0px; font-size: 16px" CssClass="" Visible="true" Expanded="True">
                            <Items>
                                <Telerik:RadPanelItem NavigateUrl="OperationsReport.aspx" Text="BSB Data Dump Report" />
                            </Items>
                        </Telerik:RadPanelItem>

                    </Items>
                </Telerik:RadPanelBar>
                <asp:HiddenField ID="hfClickItem" runat="server" />

            </div>



        </Telerik:RadPane>

        <Telerik:RadSplitBar ID="radSplitBar" runat="server" CollapseMode="Forward" EnableResize="false" Height="100%">
        </Telerik:RadSplitBar>
        <Telerik:RadPane ID="radRightPane" runat="server" Width="80%">
            <div style="float: left">
                <asp:Label runat="server" ID="lblReportTitle" CssClass="h4"></asp:Label>
            </div>
            <div class="text-right">
                <div style="padding-bottom: 30px" />
            </div>
            <div>
                <Telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">

                    <Telerik:RadGrid runat="server" ID="radGridProjectSearch" AllowPaging="True" OnItemCreated="radGridProjectSearch_ItemCreated" OnNeedDataSource="prj_results_grid_NeedDataSource" AllowSorting="true" OnItemDataBound="radGridProjectSearch_ItemDataBound"
                        ClientSettings-EnableRowHoverStyle="true" Height="700px" OnItemCommand="radGridProjectSearch_ItemCommand" ClientSettings-AllowKeyboardNavigation="true"
                        AutoGenerateColumns="false" PageSize="20" ClientSettings-EnablePostBackOnRowClick="false" AllowFilteringByColumn="true" ClientSettings-Resizing-ClipCellContentOnResize="false"
                        ClientSettings-Selecting-AllowRowSelect="true" ClientSettings-Resizing-AllowResizeToFit="true" ClientSettings-Resizing-ResizeGridOnColumnResize="true"
                        ClientSettings-Scrolling-AllowScroll="true" ClientSettings-Scrolling-UseStaticHeaders="true" ClientSettings-Scrolling-SaveScrollPosition="true" ShowGroupPanel="True" GroupingSettings-CaseSensitive="false">
                        <PagerStyle Mode="NextPrevAndNumeric" Position="Top" PageSizeControlType="RadDropDownList" AlwaysVisible="True"></PagerStyle>
                        <ClientSettings AllowDragToGroup="True">
                            <Scrolling AllowScroll="true" ScrollHeight="100%" UseStaticHeaders="True" SaveScrollPosition="true" />
                        </ClientSettings>
                        <MasterTableView TableLayout="fixed" DataKeyNames="ProjectStatusName,ProjectNumber, ProjectName, ProjectTypeName" Width="100%">
                            <Columns>

                                <Telerik:GridButtonColumn ButtonType="LinkButton" CommandName="ProjectNumber" Visible="false" ItemStyle-Font-Overline="false"
                                    ItemStyle-Font-Underline="true" ItemStyle-HorizontalAlign="left" HeaderText="Project Number" CurrentFilterFunction="Contains" UniqueName="ProjectNumber" DataTextField="ProjectNumber" HeaderStyle-Width="90px" ItemStyle-Width="105px" FilterControlWidth="80px" />

                                <Telerik:GridBoundColumn HeaderText="Project Number" Visible="true" DataField="ProjectNumber" UniqueName="ProjectNumber" HeaderStyle-Width="75px" ShowFilterIcon="false" AllowFiltering="false" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Left" />

                                <Telerik:GridBoundColumn HeaderText="Project Name" CurrentFilterFunction="StartsWith" HeaderStyle-Width="150px" FilterControlWidth="140px" ItemStyle-Wrap="true" AutoPostBackOnFilter="true" HeaderStyle-Wrap="true" ShowFilterIcon="false" UniqueName="ProjectName" DataField="ProjectName" ItemStyle-HorizontalAlign="left">
                                    <ItemStyle Wrap="true" />
                                </Telerik:GridBoundColumn>


                                <Telerik:GridBoundColumn HeaderText="Project Type" UniqueName="ProjectTypeName" AutoPostBackOnFilter="true"
                                    DataField="ProjectTypeName" ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle Width="140px" />
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <FilterTemplate>
                                        <Telerik:RadComboBox ID="radComboProjectType" DataTextField="ProjectTypeName" DataValueField="ProjectTypeName"
                                            Height="100px" runat="server" Width="130px" EnableEmbeddedSkins="true"
                                            AppendDataBoundItems="true"
                                            SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ProjectTypeName").CurrentFilterValue %>'
                                            OnClientSelectedIndexChanged="ProjectTypeNameIndexChanged" MarkFirstMatch="true">
                                            <Items>
                                                <Telerik:RadComboBoxItem Text="(ALL)" />
                                            </Items>
                                        </Telerik:RadComboBox>
                                        <Telerik:RadScriptBlock ID="radScriptProjectType" runat="server">
                                            <script type="text/javascript">
                                                function ProjectTypeNameIndexChanged(sender, args) {
                                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                    tableView.filter("ProjectTypeName", args.get_item().get_value(), "EqualTo");
                                                }
                                            </script>
                                        </Telerik:RadScriptBlock>
                                    </FilterTemplate>
                                </Telerik:GridBoundColumn>



                                <Telerik:GridBoundColumn HeaderText="Company" Visible="false" ItemStyle-Wrap="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="160px" FilterControlWidth="155px" HeaderStyle-Wrap="true" ShowFilterIcon="false" UniqueName="CompanyName" DataField="CompanyName" ItemStyle-HorizontalAlign="left">
                                    <ItemStyle Wrap="true" />
                                </Telerik:GridBoundColumn>

                                <Telerik:GridBoundColumn HeaderText="Project Status" UniqueName="ProjectStatusName" AutoPostBackOnFilter="true"
                                    DataField="ProjectStatusName" ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <FilterTemplate>
                                        <Telerik:RadComboBox ID="radComboProjectStatus" DataTextField="ProjectStatusName" DataValueField="ProjectStatusName"
                                            Height="100px" runat="server" Width="105px" EnableEmbeddedSkins="true"
                                            AppendDataBoundItems="true"
                                            SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ProjectStatusName").CurrentFilterValue %>'
                                            OnClientSelectedIndexChanged="ProjectStatusNameIndexChanged" MarkFirstMatch="true">
                                            <Items>
                                                <Telerik:RadComboBoxItem Text="(ALL)" />
                                            </Items>
                                        </Telerik:RadComboBox>
                                        <Telerik:RadScriptBlock ID="radScriptProjectStatus" runat="server">
                                            <script type="text/javascript">
                                                function ProjectStatusNameIndexChanged(sender, args) {
                                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                    tableView.filter("ProjectStatusName", args.get_item().get_value(), "EqualTo");
                                                }
                                            </script>
                                        </Telerik:RadScriptBlock>
                                    </FilterTemplate>
                                </Telerik:GridBoundColumn>

                                <Telerik:GridBoundColumn HeaderText="Project Phase" UniqueName="ProjectPhaseName" AutoPostBackOnFilter="true"
                                    DataField="CodeDescription" ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle Width="80px" />
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <FilterTemplate>
                                        <Telerik:RadComboBox ID="radComboProjectPhase" DataTextField="CodeDescription" DataValueField="CodeDescription"
                                            Height="100px" runat="server" Width="80px" EnableEmbeddedSkins="true"
                                            AppendDataBoundItems="true"
                                            SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ProjectPhaseName").CurrentFilterValue %>'
                                            OnClientSelectedIndexChanged="ProjectPhaseNameIndexChanged" MarkFirstMatch="true">
                                            <Items>
                                                <Telerik:RadComboBoxItem Text="(ALL)" />
                                            </Items>
                                        </Telerik:RadComboBox>
                                        <Telerik:RadScriptBlock ID="radScriptProjectPhase" runat="server">
                                            <script type="text/javascript">
                                                function ProjectPhaseNameIndexChanged(sender, args) {
                                                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                    tableView.filter("ProjectPhaseName", args.get_item().get_value(), "EqualTo");
                                                }
                                            </script>
                                        </Telerik:RadScriptBlock>
                                    </FilterTemplate>
                                </Telerik:GridBoundColumn>

                                <Telerik:GridBoundColumn HeaderText="No of Jobs" Visible="false" DataField="NoofJobs" UniqueName="unDeleteContact" HeaderStyle-Width="75px" ShowFilterIcon="false" AllowFiltering="false" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" />
                                <%--<Telerik:GridHyperLinkColumn HeaderText="Report" Visible="true" Groupable="false" ImageUrl="~/App_Themes/Default/Images/AddNewContact.png" UniqueName="AddJob" AllowFiltering="false" DataNavigateUrlFormatString="~/UI_Pages/Reports/ProjectCostReport.aspx?pid={0}" DataNavigateUrlFields="ProjectNumber" AllowSorting="false" HeaderStyle-Width="75px" ItemStyle-Width="70px" />--%>
                                <Telerik:GridHyperLinkColumn HeaderText="Report" Visible="true" Groupable="false" UniqueName="AddJob" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="75px" ItemStyle-Width="70px" />
                            </Columns>
                        </MasterTableView>
                    </Telerik:RadGrid>
                </Telerik:RadAjaxPanel>
            </div>
        </Telerik:RadPane>



    </Telerik:RadSplitter>


    
    <Telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">

        <AjaxSettings>
            <Telerik:AjaxSetting AjaxControlID="radBtnSearch">
                <UpdatedControls>
                    <Telerik:AjaxUpdatedControl ControlID="radGridProjectSearch" />

                    <Telerik:AjaxUpdatedControl ControlID="radclrProjectDateFrom" />
                    <Telerik:AjaxUpdatedControl ControlID="radclrProjectDateTo" />
                    <Telerik:AjaxUpdatedControl ControlID="error" />

                    <Telerik:AjaxUpdatedControl ControlID="ctdradclrProjectDateFrom" />
                    <Telerik:AjaxUpdatedControl ControlID="ctdradclrProjectDateTo" />
                    <Telerik:AjaxUpdatedControl ControlID="ctderror" />

                    <Telerik:AjaxUpdatedControl ControlID="radGridProjectSearch" />
                </UpdatedControls>
            </Telerik:AjaxSetting>

        </AjaxSettings>



    </Telerik:RadAjaxManager>




</asp:Content>
