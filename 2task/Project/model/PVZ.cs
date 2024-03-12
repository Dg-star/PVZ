using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2task.model
{
    public class PVZ
    {
        public int _point_id;
        public string _pickup_points_location;
        public string _working_hours;

        public bool IsSelected { get; set; }

        public int Point_Id
        {
            get { return _point_id; }
            set
            {
                if (_point_id != value)
                {
                    _point_id = value;
                    OnPropertyChanged(nameof(Point_Id));
                }
            }
        }

        public string Pickup_Points_Location
        {
            get { return _pickup_points_location; }
            set
            {
                if (_pickup_points_location != value)
                {
                    _pickup_points_location = value;
                    OnPropertyChanged(nameof(Pickup_Points_Location));
                }
            }
        }

        public string Working_Hours
        {
            get { return _working_hours; }
            set
            {
                if (_working_hours != value)
                {
                    _working_hours = value;
                    OnPropertyChanged(nameof(Working_Hours));
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
