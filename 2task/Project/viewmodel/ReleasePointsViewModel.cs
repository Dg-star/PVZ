using _2task.model;
using _2task.secret;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.SqlClient;
using System;

internal class ReleasePointsViewModel : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;

    protected virtual void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    private ObservableCollection<ReleasePoints> _releasepoint;

    public ObservableCollection<ReleasePoints> ReleasePointss
    {
        get { return _releasepoint; }
        set
        {
            if (_releasepoint != value)
            {
                _releasepoint = value;
                OnPropertyChanged(nameof(ReleasePointss));
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
                ReleasePointss.Add(new ReleasePoints
                {
                    Point_Id = Convert.ToInt32(reader["point_id"]),
                    Pickup_Points_Location = reader["pickup_points_location"].ToString(),
                    Working_Hours = reader["working_hours"].ToString(),

                });
            }

            reader.Close();
        }
    }

    public ReleasePointsViewModel()
    {
        ReleasePointss = new ObservableCollection<ReleasePoints>();
        LoadProductsFromDatabase();
    }
}
