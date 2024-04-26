public class accountQueaueable implements Queueable
{
	public void execute(QueueableContext qc)
    {
        account a = new account(name = 'Queue account', numberOfEmployees = 200);
        insert a;
    }
}