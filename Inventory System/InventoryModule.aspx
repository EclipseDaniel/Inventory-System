<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="InventoryModule.aspx.cs" Inherits="Inventory_System.InventoryModule" %>

<asp:Content ID="InventoryHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/Pagination.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="InventoryBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

            <div class="spacer"></div>

            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Inventory Details</h3>
                </div>
                <div class="panel-body">



                    <div class="row">
                        <div class="col-centered">

                            <!-- Quantity Check -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label  for="txtCheckQuantity" class="control-label">Check Inventory</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">Unit</span>
                                        <asp:TextBox ID="txtCheckQuantity" type="text" ReadOnly="false" runat="server" CssClass="form-control" ></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="checkInventory" Text="Check Inventory" CssClass="btn btn-default" runat="server"  OnClick="checkInventory_Click" CausesValidation="false"></asp:Button>
                                    </span>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <!-- Hidden -->
                    <asp:TextBox Visible="false" ID="txtItemID" runat="server"></asp:TextBox>

                    <div class="row">
                        <div class="col-centered">


                            <!-- Item Name -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtItemName" class="control-label">Item Name</label>
                                <asp:TextBox ID="txtItemName" type="text"  runat="server" CssClass="form-control" placeholder="Enter Item Name"></asp:TextBox>
                            </div>

                            <!-- Category -->
                            <div class="form-group  col-md-4 col-sm-4">
                                <label for="ddlistCategory" class="control-label" >Category</label>
                                <asp:DropDownList  ID="ddlistCategory" runat="server" CssClass="form-control" >
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Condiments" Value="Condiments"></asp:ListItem>
                                    <asp:ListItem Text="Seasonings" Value="Seasonings"></asp:ListItem>
                                    <asp:ListItem Text="Meats" Value="Meats"></asp:ListItem>
                                    <asp:ListItem Text="Vegetables" Value="Vegetables"></asp:ListItem>
                                    <asp:ListItem Text="Fruits" Value="Fruits"></asp:ListItem>
                                    <asp:ListItem Text="Pastry" Value="Pastry"></asp:ListItem>
                                    <asp:ListItem Text="Grain" Value="Grain"></asp:ListItem>
                                    <asp:ListItem Text="Beverage" Value="Beverage"></asp:ListItem>
                                    <asp:ListItem Text="Oil" Value="Oil"></asp:ListItem>
                                    <asp:ListItem Text="Kitchenware" Value="Kitchenware"></asp:ListItem>
                                </asp:DropDownList>
                            </div>     

                            <!-- Quantity -->
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="txtItemQuantity" class="control-label">Quantity</label>
                                    <asp:TextBox ID="txtItemQuantity" type="text"  runat="server" CssClass="form-control" placeholder="Enter Quantity"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtItemQuantity"  ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  ControlToValidate="txtItemQuantity" runat="server" ErrorMessage="Only Numbers allowed" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-centered">
                            <!-- Item Unit -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtItemUnit" class="control-label">Item Unit</label>
                                <asp:TextBox ID="txtItemUnit" type="text" runat="server" CssClass="form-control" placeholder="Enter Item Unit (ex: kg, pc) "></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="This field is required" ControlToValidate="txtItemUnit" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                            </div>

                            <!-- Status -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="ddListStatus" class="control-label">Status</label>
                                 <asp:DropDownList ID="ddListStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                                    <asp:ListItem Text="Critical" Value="Critical"></asp:ListItem>
                                    <asp:ListItem Text="Spoiled" Value="Spoiled"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <!-- Supplier Name -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtSupplierItem" class="control-label">Supplier Name</label>
                                <asp:TextBox ID="txtSupplierItem" type="text" runat="server" CssClass="form-control" placeholder="Enter Supplier Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-centered">
                            <!-- Item Delivery Date -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtItemDeliveryDate" class="control-label">Item Delivery Date</label>
                                <asp:TextBox ID="txtItemDeliveryDate" type="date" CssClass="form-control" runat="server" TextMode="Date" />
                            </div>

                            <!-- Item Expiration Date -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtItemExpirationDate" class="control-label">Item Expiration Date</label>
                                <asp:TextBox ID="txtItemExpirationDate" type="date" CssClass="form-control" runat="server" TextMode="Date" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-centered">
                            <!-- Critical Level -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtCriticalLevel" class="control-label">Critical Level</label>
                                <asp:TextBox ID="txtCriticalLevel" type="text" runat="server" CssClass="form-control" placeholder="Enter Critical Level Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="This field is required" ControlToValidate="txtCriticalLevel" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator  ControlToValidate="txtCriticalLevel" runat="server" ErrorMessage="Only Numbers allowed" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </div>

                            <!-- Optimal Level -->
                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                <label for="txtOptimalLevel" class="control-label">Optimal Level</label>
                                <asp:TextBox ID="txtOptimalLevel" type="text" runat="server" CssClass="form-control" placeholder="Enter Optimal Level Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="This field is required" ControlToValidate="txtOptimalLevel" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator  ControlToValidate="txtOptimalLevel" runat="server" ErrorMessage="Only Numbers allowed" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="row">
                        <div class="col-paddinglefttop text-center">
                            <asp:Button ID="btnSave" cssclass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                            <asp:Button ID="btn_Delete" cssclass="btn btn-danger" Style="margin-left: 20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                            <asp:Button ID="btn_Clear" cssclass="btn btn-default" Style="margin-left: 20px;" runat="server" Text="Clear" CausesValidation="false"  OnClick="btn_Clear_Click"  />
                        </div>
                    </div>

                      <br />
                        <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtItemNo" runat="server" Visible="false"></asp:TextBox>

                </div>
            </div>


            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">Critical Level</h3>
                </div>
                <div class="panel-body">
                        <asp:GridView ID="gridViewCritical" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center" PageSize="10" AllowPaging="true" OnPageIndexChanging="gridViewCritical_PageIndexChanging">
                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                            <HeaderStyle CssClass ="GridHeader"/>
                            <AlternatingRowStyle CssClass ="GridAltItem" />
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                                <asp:BoundField DataField="ItemStatus" HeaderText="Item Status" />
                                <asp:BoundField DataField="ItemSupplier" HeaderText="Item Supplier" />
                                <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Item Delivery Date" />
                                <asp:BoundField DataField="ItemExpirationDate" HeaderText="Item Expiration Date" />
                                <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk_Click" CausesValidation="false">Create P.O.</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Inventory Details</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="gridViewItem" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center" PageSize="10" AllowPaging="true" OnPageIndexChanging="gridViewItem_PageIndexChanging">
                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                        <HeaderStyle CssClass ="GridHeader"/>
                        <AlternatingRowStyle CssClass ="GridAltItem" />
                        <Columns>
                            <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                            <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                            <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                            <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                            <asp:BoundField DataField="ItemStatus" HeaderText="Item Status" />
                            <asp:BoundField DataField="ItemSupplier" HeaderText="Item Supplier" />
                            <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Item Delivery Date" />
                            <asp:BoundField DataField="ItemExpirationDate" HeaderText="Item Expiration Date" />
                            <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
                            <asp:BoundField DataField="CriticalLevel" HeaderText="Critical Level" />
                            <asp:BoundField DataField="OptimalLevel" HeaderText="Optimal Level" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk2_Click" CausesValidation="false">View</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">Expired</h3>
                </div>
                <div class="panel-body">
                       <asp:GridView ID="gridViewItemExpiration" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center" PageSize="10" AllowPaging="true" OnPageIndexChanging="gridViewItemExpiration_PageIndexChanging" >
                           <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                            <HeaderStyle CssClass ="GridHeader"/>
                            <AlternatingRowStyle CssClass ="GridAltItem" />
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                                <asp:BoundField DataField="ItemStatus" HeaderText="Item Status" />
                                <asp:BoundField DataField="ItemSupplier" HeaderText="Item Supplier" />
                                <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Item Delivery Date" />
                                <asp:BoundField DataField="ItemExpirationDate" HeaderText="Item Expiration Date" />
                                <asp:BoundField DataField="ItemUnit" HeaderText="Item Unit" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("ItemID") %>' OnClick="lnk_Click" CausesValidation="false">View</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                </div>
            </div>


                   


</asp:Content>

