<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MenuModule.aspx.cs" Inherits="Inventory_System.ProductionModule" %>

<asp:Content ID="MenuHeaderContent" ContentPlaceHolderID="HeaderContent" runat="server" >

     <link href="css/newStyle.css" rel="stylesheet" type="text/css" media="all" />
</asp:Content>


<asp:Content ID="MenuBodyContent" ContentPlaceHolderID="BodyContent" runat="server">

                <!-- spacing sa taas -->
                <div class="spacer"></div>
                        


                <!-- Menu Details Panel -->
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Menu Details</h3>
                    </div>
                    <div class="panel-body">
                        
                        <!-- first row -->
                        <div class="row">
                            <div class="col-centered">
                                <!-- Item Name -->
                                <div class="form-group   col-md-12 col-sm-12">
                                    <label for="txtbox_DishName" class="control-label">Dish Name</label>
                                    <asp:TextBox ID="txtbox_DishName" type="text"  runat="server" CssClass="form-control" placeholder="Enter Your Dish Name" OnTextChanged="txtbox_DishName_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Cannot be empty" ControlToValidate="txtbox_DishName" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>


                        <!-- Buttons -->
                         <div class="row">
                            <div class="col-centered ">
                                <asp:Button CssClass="btn btn-default" Style="margin-left: 20px;" ID="btn_Next"  runat="server" Text="Lock" OnClick="btn_Next_Click" CausesValidation="false" />
                                <asp:Button CssClass="btn btn-default" Style="margin-left: 20px;" ID="btn_Unlock"  runat="server" Text="Unlock" OnClick="btn_Unlock_Click" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
    
                <!-- Menu Ingredients Panel -->

                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Ingredients Details</h3>
                    </div>
                    <div class="panel-body">


                        <div class="row">
                            <div class="col-centered">

                                <!-- Ingredients -->
                                <div class="form-group  col-md-4 col-sm-4">
                                    <label for="ddlIngredients" class="control-label">Ingredients</label>
                                    <asp:DropDownList  ID="ddlIngredients" runat="server" CssClass="form-control" >
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorIngredient" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="ddlIngredients" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>    


                                 <!-- Quantity -->
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="txtbox_Quantity" class="control-label">Quantity</label>
                                    <asp:TextBox ID="txtbox_Quantity" type="text"  runat="server" CssClass="form-control" placeholder="Enter Quantity"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtbox_Quantity"  ErrorMessage="This field is required" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>


                         <!-- Buttons -->
                        <div class="row">
                            <div class="col-centered">
                                <asp:Button ID="btn_Cancel" Style="margin-left: 10px;" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                                <asp:Button ID="btn_Add" Style="margin-left: 10px;" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click" />
                            </div>
                        </div>

                         <%--Hidden Text box for Menu Id Validation for SQL Script--%>
                            <asp:TextBox ID="txtbox_MenuId" runat="server" required="" Visible="false"></asp:TextBox>

                    </div>
                </div>




                <%-- Menu Form for adding Data in Datagrid--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Production Stock Details</h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-centered">
                            <asp:GridView ID="gridDishMenu" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" HorizontalAlign="Center">
                                <HeaderStyle CssClass="GridHeader" />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <Columns>
                                    <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                    <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                </Columns>
                            </asp:GridView>
                        
                        </div>
                    </div>
                </div>



</asp:Content>
