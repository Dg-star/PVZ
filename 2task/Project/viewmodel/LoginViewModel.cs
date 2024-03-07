using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Animation;
using _2task.model;
using System.Security.Cryptography;
using CommunityToolkit.Mvvm.Input;
using _2task.view;

namespace _2task.viewmodel
{
    public class LoginViewModel : INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public int Client_Id
        {
            get { return Users._client_id; }
            set
            {
                Users._client_id = value;
                OnPropertyChanged(nameof(Client_Id));
            }
        }
        public string Client_Login
        {
            get { return Users._client_login; }
            set
            {
                Users._client_login = value;
                OnPropertyChanged(nameof(Client_Login));
            }
        }
        public string Client_Password
        {
            get { return Users._client_password; }
            set
            {
                Users._client_password = value;
                OnPropertyChanged(nameof(Client_Password));
            }
        }

        public int Client_teg_id
        {
            get { return Users._client_teg_id; }
            set
            {
                Users._client_teg_id = value;
                OnPropertyChanged(nameof(Client_teg_id));
            }
        }

        public string HashedPassword
        {
            get { return Other._hashedPassword; }
            set
            {
                Other._hashedPassword = value;
                OnPropertyChanged(nameof(HashedPassword));
            }
        }

        public ICommand LoginCommand { get; }

        public LoginViewModel()
        {
            LoginCommand = new RelayCommand(Login);
        }

        private void Login()
        {
            if (string.IsNullOrEmpty(Client_Login))
            {
                MessageBox.Show("Пожалуйста, введите Логин");
                return;
            }

            if (string.IsNullOrEmpty(Client_Password))
            {
                MessageBox.Show("Пожалуйста, введите Пароль");
                return;
            }


            if (!Regex.IsMatch(Client_Login, @"^[a-zA-Z]+$"))
            {
                MessageBox.Show("Имя пользователя должно содержать только английские символы");
                return;
            }

            string hashedInputPassword = HashPassword(Client_Password);

            using (SqlConnection conn = new SqlConnection(Other.request))
            {
                try
                {
                    conn.Open();
                    if (conn.State == ConnectionState.Open)
                    {
                        using (SqlCommand command = new SqlCommand(@"SELECT Client_Password, CLient_teg_id FROM Клиенты WHERE Client_Login = @Client_Login", conn))
                        {
                            command.Parameters.AddWithValue("@Client_Login", Client_Login);
                            using (SqlDataReader reader = command.ExecuteReader())
                                if (reader.Read())
                                {
                                    
                                    string storedHashedPassword = reader.GetString(0);
                                    int Client_teg_id = reader.GetInt32(1);

                                    reader.Close();

                                    if (storedHashedPassword != null && VerifyPassword(Client_Login, hashedInputPassword))
                                    {
                                        Users._client_teg_id = Client_teg_id;
                                        conn.Close();
                                        MessageBox.Show("Успешый вход в аккаунт: " + Client_Login);
                                    }
                                    else
                                    {
                                        conn.Close();
                                        MessageBox.Show("Неверный Логин или Пароль");
                                    }

                                }
                                else
                                {
                                    conn.Close();
                                    MessageBox.Show("Неверный Логин или Пароль");
                                }
                        }
                    }
                    else
                    {
                        MessageBox.Show("Не удалось подключиться к базе данных");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка при подключении к базе данных: " + ex.Message);
                }
            }
        }

        private string HashPassword(string client_password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(client_password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < hashedBytes.Length; i++)
                {
                    builder.Append(hashedBytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private bool VerifyPassword(string client_login, string inputPassword)
        {
            using (SqlConnection conn = new SqlConnection(Other.request))
            {
                conn.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT Client_Password FROM Клиенты WHERE Client_Login = @Client_Login", conn))
                {
                    command.Parameters.AddWithValue("@Client_Login", client_login);
                    string storedHashedPassword = (string)command.ExecuteScalar();

                    if (storedHashedPassword != null)
                    {

                        if (storedHashedPassword == inputPassword)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }
    }
}
