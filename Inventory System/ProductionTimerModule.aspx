<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProductionTimerModule.aspx.cs" Inherits="Inventory_System.ProductionTimerModule" %>



<asp:Content ID="ProductionHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />


</asp:Content>




<asp:Content ID="ProductionBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

    <asp:Timer runat="server" ID="UpdateTimer" Interval="1000" OnTick="UpdateTimer_Tick" />
    
    <div class="spacer"></div>
    
    <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Production Data</h3>
                </div>
                <div class="panel-body">
                    
                    <asp:UpdatePanel runat="server" ID="TimePanel" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:GridView ID="gridOrderedDish" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                                <HeaderStyle CssClass="GridHeader" />
                                <AlternatingRowStyle CssClass="GridAltItem" />


                                <Columns>
                                    <asp:BoundField DataField="MenuID" HeaderText="Menu ID" />
                                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                    <asp:BoundField DataField="Order" HeaderText="Order" />
                                    <asp:BoundField DataField="OrderStatus" HeaderText="Status" />
                                    <asp:BoundField DataField="Duration" HeaderText="Duration" />
                                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                                    <asp:BoundField DataField="LeadTime" HeaderText="Lead Time" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                            <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Container.DataItemIndex %>' OnClick="lnk_Click" CausesValidation="false">Complete</asp:LinkButton>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
    
    
    
    
    
              
</asp:Content>