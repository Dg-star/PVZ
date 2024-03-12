using _2task.model;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.SqlClient;
using System;

internal class PVZViewModel : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;

    protected virtual void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    private ObservableCollection<PVZ> _pvz;

    public ObservableCollection<PVZ> PVZS
    {
        get { return _pvz; }
        set
        {
            if (_pvz != value)
            {
                _pvz = value;
                OnPropertyChanged(nameof(PVZS));
            }
        }
    }

    private void LoadProductsFromDatabase()
    {
        string connectionString = Other.request;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT point_id, pickup_points_location, working_hours " +
                "FROM Пункты_выдачи";

            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                PVZS.Add(new PVZ
                {
                    Point_Id = Convert.ToInt32(reader["point_id"]),
                    Pickup_Points_Location = reader["pickup_points_location"].ToString(),
                    Working_Hours = reader["working_hours"].ToString(),

                });
            }

            reader.Close();
        }
    }

    public PVZViewModel()
    {
        PVZS = new ObservableCollection<PVZ>();
        LoadProductsFromDatabase();
    }
}
