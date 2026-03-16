namespace Delegates.Models
{
    public class DelegatesTesting
    {

        public delegate string MyDelegate(string message);

        public string invoke(string message)
        {
            Methods methods = new Methods();
            DelegatesTesting.MyDelegate myDelegate = methods.Method1;

           string mes = myDelegate(message);

            return mes;
        }

    }
}
