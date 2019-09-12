<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProductionModule.aspx.cs" Inherits="Inventory_System.ProductionModule1" %>



<asp:Content ID="ProductionHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
            <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/Pagination.css" rel="stylesheet" />
    <link href="css/Pagination.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="ProductionBodyContent" ContentPlaceHolderID="BodyContent" runat="server">



     <div class="spacer"></div>

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Enter Order</h3>
                </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-centered">

                            <!-- Ordered Dish -->
                            <div class="form-group  col-md-4 col-sm-4">
                                <label for="ddlMenuList" class="control-label" >Dish To Order</label>
                                <asp:DropDownList  ID="ddlMenuList" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlMenuList_SelectedIndexChanged"></asp:DropDownList>
                            </div>  
                            
                            <!-- Quantity -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtbox_Quantity" class="control-label">Quantity</label>
                                <asp:TextBox ID="txtbox_Quantity" type="text"  runat="server" CssClass="form-control" placeholder="Enter Quantity"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtbox_Quantity"  ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  ControlToValidate="txtbox_Quantity" runat="server" ErrorMessage="Only Numbers allowed" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </div>
                            
                             <!-- Lead Time -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtLeadTime" class="control-label">Lead Time</label>
                                <asp:TextBox ID="txtLeadTime" type="text"  runat="server" CssClass="form-control" placeholder="Enter Lead Time (in minutes)"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtLeadTime"  ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"  ControlToValidate="txtLeadTime" runat="server" ErrorMessage="Only Numbers allowed" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                     <!-- Buttons -->
                    <div class="row">
                        <div class="col-centered text-center">
                            <asp:Button ID="btn_Cancel" cssclass="btn btn-danger" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                            <asp:Button ID="btn_Add" Style="margin-left: 10px;" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click" />
                        </div>
                    </div>


                     <%--Hidden Text box for Dish Id Validation for SQL Script--%>
                                <asp:TextBox ID="txtbox_DishID" runat="server" required="" Visible="false"></asp:TextBox>


                </div>
            </div>


            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Production Data</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="gridOrderedDish" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" AllowPaging="true" PageSize="10" OnPageIndexChanging="gridOrderedDish_PageIndexChanging">
                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                        <Columns>
                            <asp:BoundField DataField="Dish" HeaderText="Dish" />
                            <asp:BoundField DataField="Order" HeaderText="Order" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                            <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                            <asp:BoundField DataField="Duration" HeaderText="Duration" />
                            <asp:BoundField DataField="LeadTime" HeaderText="LeadTime" />
                        </Columns>
                    </asp:GridView>

                      <!-- Buttons -->
                    <div class="row">
                        <div class="col-centered text-center">
                            <asp:Button ID="btn_Proceed" Style="margin-top: 30px" class="btn btn-primary" runat="server" Text="Next" CausesValidation="false"  OnClick="btn_Proceed_Click" />
                        </div>
                    </div>
                </div>
            </div>


             <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Inventory Status</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="gridProdMod" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover">
                        <HeaderStyle CssClass="GridHeader" />
                        <AlternatingRowStyle CssClass="GridAltItem" />
                        <Columns>
                            <asp:BoundField DataField="Dish" HeaderText="Dish" />
                            <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" />
                            <asp:BoundField DataField="TotalQty" HeaderText="Quantity" />
                            <asp:BoundField DataField="ItemQuantity" HeaderText="Stock Level" />
                            <asp:BoundField DataField="QtyLeft" HeaderText="QtyLeft" />
                        </Columns>
                    </asp:GridView>

                      <!-- Buttons -->
                    <div class="row">
                        <div class="col-centered text-center">
                             <asp:Button ID="btn_Validate" class="btn btn-primary" runat="server" Text="Validate" OnClick="btn_Validate_Click" CausesValidation="false" Style="margin-left: 10px" />
                            <asp:Button ID="btn_PurchaseGood" class="btn btn-primary" runat="server" Text="Purchase Goods" OnClick="btn_PurchaseGood_Click" CausesValidation="false" Style="margin-left: 10px" />
                            <asp:Button ID="btn_ProcessOrder" class="btn btn-primary" runat="server" Text="Process Order" OnClick="btn_ProcessOrder_Click" CausesValidation="false" Style="margin-left: 10px" />
                        </div>
                    </div>
                </div>
            </div>



           
        

</asp:Content>