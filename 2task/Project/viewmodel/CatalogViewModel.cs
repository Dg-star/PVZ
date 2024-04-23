using _2task.model;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using _2task.view;
using System.Collections.ObjectModel;
using System.Windows.Input;
using _2task.secret;

namespace _2task.viewmodel
{
    internal class CatalogViewModel : INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;


        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ICommand SaveChangesCommand { get; }
        public ICommand DeleteCommand { get; }
        public ICommand AddCommand { get; set; }

        private ObservableCollection<Product> _product;

        private ObservableCollection<Category> _categories;
        private ObservableCollection<Seller> _sellers;
        public ObservableCollection<Category> Categories
        {
            get { return _categories; }
            set
            {
                if (_categories != value)
                {
                    _categories = value;
                    OnPropertyChanged(nameof(Categories));
                }
            }
        }
        public ObservableCollection<Seller> Sellers
        {
            get { return _sellers; }
            set
            {
                if (_sellers != value)
                {
                    _sellers = value;
                    OnPropertyChanged(nameof(Sellers));
                }
            }
        }
        public ObservableCollection<Product> Products
        {
            get { return _product; }
            set
            {
                if (_product != value)
                {
                    _product = value;
                    OnPropertyChanged(nameof(Products));
                }
            }
        }

        private void LoadProductsFromDatabase()
        {
            string connectionString = Other.request;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT T.Product_Id, PT.category_Id, S.seller_name, S.seller_surname, T.product_name, T.Quantity, T.Price, CT.category_name " +
                    "FROM Товар T " +
                    "JOIN [Категория_товара] PT ON T.category_id = PT.category_id " +
                    "JOIN [Продавцы] S ON T.seller_id = S.seller_id " +
                    "JOIN [Категория_товара] CT ON PT.category_Id = CT.category_Id";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Products.Add(new Product
                    {
                        Product_Id = Convert.ToInt32(reader["Product_Id"]),
                        Product_Name = reader["Product_name"].ToString(),
                        Category_Id = Convert.ToInt32(reader["category_Id"]),
                        Seller_Name = reader["Seller_name"].ToString() + " " + reader["seller_surname"].ToString(),
                        Quantity = reader["Quantity"] != DBNull.Value ? Convert.ToInt32(reader["Quantity"]) : (int?)null,
                        Price = reader["Price"] != DBNull.Value ? Convert.ToInt32(reader["Price"]) : (int?)null,
                        Category_Name = reader["category_name"].ToString()
                    });
                }

                reader.Close();
            }
        }

        private void SaveChanges()
        {
            //if (Employee._employee_tag_id == 1)
            //{
                foreach (var product in Products)
                {
                    using (SqlConnection connection = new SqlConnection(Other.request))
                    {
                    string query = $"UPDATE Товар SET product_name = '{product.Product_Name}', Price = {product.Price}, Quantity = {product.Quantity} WHERE Product_Id = {product.Product_Id}";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                        
                }               
            }
            //}
            //else
            //{
            //    MessageBox.Show("Только админы могут изменять названия товаров.");
            //}
        }

        private void DeleteSelectedProducts()
        {
            //if (Employee._employee_tag_id == 1)
            //{

            var selectedProducts = Products.Where(p => p.IsSelected).ToList();

            foreach (var product in selectedProducts)
            {
                using (SqlConnection connection = new SqlConnection(Other.request))
                {
                    string query = $"DELETE FROM Товар WHERE Product_Id = {product.Product_Id}";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Remove the selected products from the Products collection
            foreach (var product in selectedProducts)
            {
                Products.Remove(product);
            }

            MessageBox.Show("Выбранный товар(ы) был(и) удален(ы).");
            //}
            //else
            //{
            //    MessageBox.Show("Только админы могут удалять товар.");
            //}
        }

        private void AddProducts(Product newProduct)
        {
            try
            {
                string connectionString = Other.request;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Товар (product_name, seller_id, category_id, Quantity, Price) " +
                               "VALUES (@ProductName, @SellerId, @CategoryId, @Quantity, @Price)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ProductName", newProduct.Product_Name);
                    command.Parameters.AddWithValue("@SellerId", newProduct.Seller_Id);
                    command.Parameters.AddWithValue("@CategoryId", newProduct.Category_Id);
                    command.Parameters.AddWithValue("@Quantity", newProduct.Quantity);
                    command.Parameters.AddWithValue("@Price", newProduct.Price);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                MessageBox.Show("Новый продукт добавлен");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadCategoriesFromDatabase()
        {
            Categories = new ObservableCollection<Category>();

            string connectionString = Other.request;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT category_id, category_name FROM Категория_товара";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Categories.Add(new Category
                    {
                        CategoryId = Convert.ToInt32(reader["category_id"]),
                        CategoryName = reader["category_name"].ToString()
                    });
                }

                reader.Close();
            }
        }
        private void LoadSellersFromDatabase()
        {
            Sellers = new ObservableCollection<Seller>();

            string connectionString = Other.request;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT seller_id, seller_name, seller_surname FROM Продавцы";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Sellers.Add(new Seller
                    {
                        SellerId = Convert.ToInt32(reader["seller_id"]),
                        SellerName = reader["seller_name"].ToString() + " " + reader["seller_surname"].ToString()
                    });
                }

                reader.Close();
            }
        }
        private void ExecuteAddProductCommand()
        {
            
            Products.Add(new Product());
            AddProducts(new Product());
        }

        public CatalogViewModel()
        {
            Products = new ObservableCollection<Product>();
            SaveChangesCommand = new RelayCommand(SaveChanges);
            DeleteCommand = new RelayCommand(DeleteSelectedProducts);
            AddCommand = new RelayCommand(ExecuteAddProductCommand);
            LoadSellersFromDatabase();
            LoadCategoriesFromDatabase();
            LoadProductsFromDatabase();
           
        }
    }
}
