namespace Delegates.Models
{
    public class Methods
    {
        public string Method1(string message)
        {
            return $"Method1: {message}";
        }
        public void Method2(string message)
        {
            Console.WriteLine($"Method2: {message}");
        }   
    }
}
