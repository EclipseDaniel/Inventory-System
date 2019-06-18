<%@ Page Language="C#" Title="Menu Module" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MenuMod.aspx.cs" Inherits="Inventory_System.ProdMod" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid" style="margin-top:50px" >
        <table class="nav-justified">
            <tr>
                <td style="width:40%">
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Menu ID"></asp:Label><br />
                                    <asp:TextBox ID="txtbox_MenuId"  runat="server" Style="justify-content: flex-start; display: flex; align-items: flex-start" ></asp:TextBox><br />
                                    <br />

                            </td>
                        </tr>
                        <tr>
                            
                            <td>
                                <div>
                                    <asp:Label runat="server" Text="Enter Dish Name"></asp:Label><br />
                                    <asp:TextBox ID="txtbox_DishName" placeholder="Enter a Dish Name" runat="server" Style="justify-content: flex-start; display: flex; align-items: flex-start" OnTextChanged="txtbox_DishName_TextChanged"></asp:TextBox><br />
                                    <br />


                                </div>
                                <div class="text-center">
                                    <asp:Button Class="btn btn-dark" ID="btn_Next" Style="  justify-content: center; display: flex; align-items: center" runat="server" Text="Next" Onclick="btn_Next_Click"/>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div>
                                    <br />
                                    <asp:Label runat="server" Text="Enter Ingredient"></asp:Label><br />
                                    <asp:TextBox ID="txtbox_Ingredients" placeholder="Enter Ingredient" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label runat="server" Text="Enter Quantity"></asp:Label><br />
                                    <asp:TextBox ID="txtbox_Quantity" placeholder="Enter Quantity" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <div class="text-center">
                                        <asp:Button ID="btn_Cancel" class="btn btn-dark" runat="server" Text="Cancel" onclick="btn_Cancel_Click"/>
                                        <asp:Button ID="btn_Add" style="margin-left:10px;" class="btn btn-dark" runat="server" Text="Add" OnClick="btn_Add_Click" />
                                    </div>
                                    


                                </div>
                            </td>
                        </tr>
                    </table>
                </td>


                <td class="align-top">
                    <div class="container">
                        <h1>Menu Stock Level</h1>

                        <asp:GridView ID="gridDishMenu" runat="server" AutoGenerateColumns="false" BorderStyle="Solid" Width="750px">
                            <Columns>
                                <asp:BoundField DataField="Dish" HeaderText="Dish" />
                                <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

                            </Columns>
                        </asp:GridView>

                    </div>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
