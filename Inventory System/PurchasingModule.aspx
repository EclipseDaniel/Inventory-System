<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="PurchasingModule.aspx.cs" Inherits="Inventory_System.PurchasingModule" %>


<asp:Content ID="PurchasingHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
       
    <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/Pagination.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="PurchasingBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

                        <div class="spacer"></div>
                        
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">Purchasing Details</h3>
                            </div>
                            <div class="panel-body">

                                    <div class="row">
                                        <div class="col-centered">
                                            <!-- Item Name -->
                                            <div class="form-group   col-md-4 col-sm-4">
                                                <label for="txtItemName" class="control-label">Item Name</label>
                                                <asp:TextBox ID="txtItemName" type="text"  runat="server" CssClass="form-control" placeholder="Enter Item Name"></asp:TextBox>
                                            </div>

                           
                                            <!-- Category -->
                                            <div class="form-group  col-md-4 col-sm-4">
                                                <label for="dDlistCategory" class="control-label" >Category</label>
                                                <asp:DropDownList  ID="dDlistCategory" runat="server" CssClass="form-control" >
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


                                              <!-- Item Price -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtItemPrice" class="control-label">Item Price</label>
                                                <asp:TextBox ID="txtItemPrice" type="text" runat="server" CssClass="form-control" placeholder="Enter Item Price"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtItemPrice" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtItemPrice" runat="server" ErrorMessage="Only Numbers allowed" ForeColor="Red"  ValidationExpression="\d+"> </asp:RegularExpressionValidator>
                                            </div>
                             
                                            <!-- Total Price -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                              <label  for="txtTotalPrice" class="control-label">Total Price</label>
                                                  <div class="input-group">
                                                    <span class="input-group-addon">Php</span>
                                                        <asp:TextBox ID="txtTotalPrice" type="text" ReadOnly="false" runat="server" CssClass="form-control" ></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="btnCompute" Text="Compute" CssClass="btn btn-default" runat="server"  OnClick="btnCompute_Click"></asp:Button>
                                                    </span>
                                                  </div>
                                            </div>

                                        
                                        </div>
                                    </div>

                                  
                                    <div class="row">
                                        <div class="col-centered">
                                                <!-- Supplier Name -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtSupplierName" class="control-label">Supplier Name</label>
                                                <asp:TextBox ID="txtSupplierName" type="text" runat="server" CssClass="form-control" placeholder="Enter Supplier Name"></asp:TextBox>
                                            </div>


                                            <!-- Shipped By -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtShippedBy" class="control-label">Shipped-By</label>
                                                <asp:TextBox ID="txtShippedBy" type="text" runat="server" CssClass="form-control" placeholder="Enter Shipped-By"></asp:TextBox>
                                            </div>

                                         

                                            <!-- Address -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtAddress" class="control-label">Supplier Address</label>
                                                 <asp:TextBox ID="txtAddress" type="text" runat="server" CssClass="form-control" placeholder="Enter Supplier Address" TextMode="MultiLine"></asp:TextBox>
                                            </div>

                                        </div>
                                    </div>

                                  

                                     <div class="row">
                                        <div class="col-centered">

                                              <!-- Date -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtDate" class="control-label">Date</label>
                                                <asp:TextBox ID="txtDate" type="date" CssClass="form-control" runat="server" TextMode="Date" />
                                            </div>


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
                                         
                                            <!-- Terms -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtTerms" class="control-label">Terms</label>
                                                <asp:TextBox ID="txtTerms" type="text" runat="server" CssClass="form-control" placeholder="Enter Terms" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                          
                                            
                                            <!-- Notes -->
                                            <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                                <label for="txtNotes" class="control-label">Notes</label>
                                                <asp:TextBox ID="txtNotes" type="text"  runat="server" CssClass="form-control" placeholder="Enter Notes" TextMode="MultiLine"></asp:TextBox>
                                            </div>

                                        </div>
                                    </div>
                                    
                                    <!-- Buttons -->
                                    <div class="row">
                                        <div class="col-paddinglefttop text-center">
                                            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                                            <asp:Button ID="btn_Delete" CssClass="btn btn-danger " Style="margin-left: 20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                                            <asp:Button ID="btn_Clear" CssClass="btn btn-default" Style="margin-left: 20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click" CausesValidation="false" />
                                            <asp:Button ID="btnReceived" CssClass="btn btn-default" Style="margin-left: 20px;" runat="server" Text="Receive" Enabled="false" OnClick="btnReceived_Click"  />
                                        </div>
                                    </div>

                                    <br />
                      
                                    <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtPurchaseID" runat="server" Visible="false"></asp:TextBox>

                                  
                            </div>
                        </div>
                       
              
                         <div class="panel panel-primary">
                             <div class="panel-heading">
                                <h3 class="panel-title">Purchase Order Data</h3>
                            </div>
                            <div class="panel-body">
                                        <div class="col-centered">
                                            <asp:GridView ID="gridViewPurchase" runat="server" AutoGenerateColumns="false"  Width="887px" CssClass="table table-striped table-hover" AllowPaging="true" PageSize="10" OnPageIndexChanging="gridViewPurchase_PageIndexChanging">
                                                <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                                <HeaderStyle CssClass ="GridHeader"/>
                                                <AlternatingRowStyle CssClass ="GridAltItem" />
                                                <Columns>
                                                    <asp:BoundField DataField="PurchaseID" HeaderText="Purchase ID" />
                                                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                                    <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                                    <asp:BoundField DataField="ItemQuantity" HeaderText="Item Quantity" />
                                                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                                                    <asp:BoundField DataField="ShippedBy" HeaderText="Shipped-By" />
                                                    <asp:BoundField DataField="Terms" HeaderText="Terms" />
                                                    <asp:BoundField DataField="Notes" HeaderText="Remarks" />
                                                    <asp:BoundField DataField="Date" HeaderText="Date" />
                                                    <asp:BoundField DataField="ItemDeliveryDate" HeaderText="Delivery Date" />
                                                    <asp:BoundField DataField="ItemExpirationDate" HeaderText="Expiry Date" />
                                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("PurchaseID") %>' OnClick="lnk_Click" CausesValidation="false">View</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                </div>
                             </div>



</asp:Content>