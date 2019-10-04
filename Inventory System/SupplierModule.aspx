<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SupplierModule.aspx.cs" Inherits="Inventory_System.SupplierDetails" %>

<asp:Content ID="SupplierHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />

</asp:Content>



<asp:Content ID="SupplierBodyContent" ContentPlaceHolderID="BodyContent" runat="server">


    <!-- This panel is Used for disabling controls -->
     <asp:Panel ID="pnlPage" runat="server" >
        <div class="spacer"></div>
                        
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Supplier Details</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-centered">
                        
                        <!-- Supplier Name -->
                        <div class="form-group   col-md-4 col-sm-4">
                            <label for="txtSupplierName" class="control-label">Supplier Name</label>
                            <asp:TextBox ID="txtSupplierName" type="text"  runat="server" CssClass="form-control" placeholder="Enter Supplier Name"></asp:TextBox>
                        </div>

                         <!-- Contact Person -->
                        <div class="form-group   col-md-4 col-sm-4">
                            <label for="txtSupplierContactPerson" class="control-label">Contact Person</label>
                            <asp:TextBox ID="txtSupplierContactPerson" type="text"  runat="server" CssClass="form-control" placeholder="Enter Contact Person"></asp:TextBox>
                        </div>

                        <!-- Contact Number -->
                        <div class="form-group   col-md-4 col-sm-4">
                            <label for="txtContactNo" class="control-label">Contact Number</label>
                            <asp:TextBox ID="txtContactNo" type="text"  runat="server" CssClass="form-control" placeholder="Enter Contact Number"></asp:TextBox>
                        </div>
                    </div>
            </div>

            <div class="row">
                <div class="col-centered">
                     <!-- Address -->
                        <div class="form-group   col-md-4 col-sm-4">
                            <label for="txtSupplierAddress" class="control-label">Contact Address</label>
                            <asp:TextBox ID="txtSupplierAddress" type="text"  runat="server" CssClass="form-control" placeholder="Enter Contact Address" TextMode="MultiLine"></asp:TextBox>
                        </div>

                         <!-- Item -->
                        <div class="form-group   col-md-4 col-sm-4">
                            <label for="txtSupplierItem" class="control-label">Item Name</label>
                            <asp:TextBox ID="txtSupplierItem" type="text"  runat="server" CssClass="form-control" placeholder="Enter Item" ></asp:TextBox>
                        </div>

                        <!-- Price -->
                        <div class="form-group   col-md-4 col-sm-4">
                            <label for="txtItemPrice" class="control-label">Price</label>
                            <asp:TextBox ID="txtItemPrice" type="text"  runat="server" CssClass="form-control" placeholder="Enter Price" ></asp:TextBox>
                        </div>
                </div>
            </div>

            <div class="row">
                <div class="col-centered">
                    
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
                </div>
            </div>


                <!-- Buttons -->
                <div class="row">
                    <div class="col-centered">
                        <asp:Button ID="btnSave" cssclass="btn btn-primary" Style="margin-left:15px;" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button ID="btn_Delete" cssclass="btn btn-danger" Style="margin-left:20px;" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                        <asp:Button ID="btn_Clear" cssclass="btn btn-default" Style="margin-left:20px;" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
                    </div>
                </div>

                <br/>
                <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                <asp:TextBox ID="hfSupplierID" runat="server" Visible="false"></asp:TextBox>

            </div>
        </div>
    
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Supplier List</h3>
            </div>
            <div class="panel-body">
                <asp:GridView ID="gridViewSupplier" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" CssClass="table table-striped table-hover">
                    <HeaderStyle CssClass ="GridHeader"/>
                    <AlternatingRowStyle CssClass ="GridAltItem" />

                    <Columns>
                        <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" />
                        <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                        <asp:BoundField DataField="SupplierPerson" HeaderText="Supplier Contact Person" />
                        <asp:BoundField DataField="SupplierContact" HeaderText="Supplier Contact Number" />
                        <asp:BoundField DataField="SupplierAddress" HeaderText="Address" />
                        <asp:BoundField DataField="SupplierItem" HeaderText="Supplier Item" />
                        <asp:BoundField DataField="ItemPrice" HeaderText="Price" />
                        <asp:BoundField DataField="ItemCategory" HeaderText="Category" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%# Eval("SupplierID") %>' OnClick="lnk_Click" CausesValidation="false">View</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </asp:Panel>

</asp:Content>