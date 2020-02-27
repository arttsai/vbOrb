package Server;


/**
* Server/CounterPOA.java .
* Generated by the IDL-to-Java compiler (portable), version "3.1"
* from ../server.idl
* Donnerstag, 13. Juni 2002 14.16 Uhr CEST
*/

public abstract class CounterPOA extends org.omg.PortableServer.Servant
 implements Server.CounterOperations, org.omg.CORBA.portable.InvokeHandler
{

  // Constructors

  private static java.util.Hashtable _methods = new java.util.Hashtable ();
  static
  {
    _methods.put ("_get_sum", new java.lang.Integer (0));
    _methods.put ("_set_sum", new java.lang.Integer (1));
    _methods.put ("increment", new java.lang.Integer (2));
  }

  public org.omg.CORBA.portable.OutputStream _invoke (String $method,
                                org.omg.CORBA.portable.InputStream in,
                                org.omg.CORBA.portable.ResponseHandler $rh)
  {
    org.omg.CORBA.portable.OutputStream out = null;
    java.lang.Integer __method = (java.lang.Integer)_methods.get ($method);
    if (__method == null)
      throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);

    switch (__method.intValue ())
    {
       case 0:  // Server/Counter/_get_sum
       {
         int $result = (int)0;
         $result = this.sum ();
         out = $rh.createReply();
         out.write_long ($result);
         break;
       }

       case 1:  // Server/Counter/_set_sum
       {
         int newSum = in.read_long ();
         this.sum (newSum);
         out = $rh.createReply();
         break;
       }

       case 2:  // Server/Counter/increment
       {
         int $result = (int)0;
         $result = this.increment ();
         out = $rh.createReply();
         out.write_long ($result);
         break;
       }

       default:
         throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    }

    return out;
  } // _invoke

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:Server/Counter:1.0"};

  public String[] _all_interfaces (org.omg.PortableServer.POA poa, byte[] objectId)
  {
    return (String[])__ids.clone ();
  }

  public Counter _this() 
  {
    return CounterHelper.narrow(
    super._this_object());
  }

  public Counter _this(org.omg.CORBA.ORB orb) 
  {
    return CounterHelper.narrow(
    super._this_object(orb));
  }


} // class CounterPOA