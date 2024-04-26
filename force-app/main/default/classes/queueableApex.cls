public class queueableApex implements Queueable
{
	public void execute(QueueableContext context)
    {
		account a  = new account(name = 'queue apex class', phone = '+91-9786956789');
        insert a;
        
    }
}