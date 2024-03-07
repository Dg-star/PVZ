using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2task.model
{
    public class Product : INotifyPropertyChanged
    {
        public int _product_id;
        public int _seller_id;
        public string _product_name;
        public string _seller_name;
        public string _category_name;
        public int? _price;
        public int _category_id;
        public int? _quantity;

        public int Product_Id
        {
            get { return _product_id; }
            set
            {
                if (_product_id != value)
                {
                    _product_id = value;
                    OnPropertyChanged(nameof(Product_Id));
                }
            }
        }

        public int Seller_Id
        {
            get { return _seller_id; }
            set
            {
                if (_seller_id != value)
                {
                    _seller_id = value;
                    OnPropertyChanged(nameof(Seller_Id));
                }
            }
        }

        public string Product_Name
        {
            get { return _product_name; }
            set
            {
                if (_product_name != value)
                {
                    _product_name = value;
                    OnPropertyChanged(nameof(Product_Name));
                }
            }
        }

        public string Seller_Name
        {
            get { return _seller_name; }
            set
            {
                if (_seller_name != value)
                {
                    _seller_name = value;
                    OnPropertyChanged(nameof(Seller_Name));
                }
            }
        }

        public string Category_Name
        {
            get { return _category_name; }
            set
            {
                if (_category_name != value)
                {
                    _category_name = value;
                    OnPropertyChanged(nameof(Category_Name));
                }
            }
        }

        public int? Price
        {
            get { return _price; }
            set
            {
                if (_price != value)
                {
                    _price = value;
                    OnPropertyChanged(nameof(Price));
                }
            }
        }

        public int Category_id
        {
            get { return _category_id; }
            set
            {
                if (_category_id != value)
                {
                    _category_id = value;
                    OnPropertyChanged(nameof(Category_id));
                }
            }
        }

        public int? Quantity
        {
            get { return _quantity; }
            set
            {
                if (_quantity != value)
                {
                    _quantity = value;
                    OnPropertyChanged(nameof(Quantity));
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
