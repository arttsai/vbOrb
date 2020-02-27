package Server;


/**
* Server/CoordinatorPOA.java .
* Generated by the IDL-to-Java compiler (portable), version "3.1"
* from ../server.idl
* Donnerstag, 13. Juni 2002 14.16 Uhr CEST
*/

public abstract class CoordinatorPOA extends org.omg.PortableServer.Servant
 implements Server.CoordinatorOperations, org.omg.CORBA.portable.InvokeHandler
{

  // Constructors

  private static java.util.Hashtable _methods = new java.util.Hashtable ();
  static
  {
    _methods.put ("register", new java.lang.Integer (0));
    _methods.put ("unregister", new java.lang.Integer (1));
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
       case 0:  // Server/Coordinator/register
       {
         Client.Control clientObjRef = Client.ControlHelper.read (in);
         Server.Counter $result = null;
         $result = this.register (clientObjRef);
         out = $rh.createReply();
         Server.CounterHelper.write (out, $result);
         break;
       }

       case 1:  // Server/Coordinator/unregister
       {
         Client.Control clientObjRef = Client.ControlHelper.read (in);
         this.unregister (clientObjRef);
         out = $rh.createReply();
         break;
       }

       default:
         throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    }

    return out;
  } // _invoke

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:Server/Coordinator:1.0"};

  public String[] _all_interfaces (org.omg.PortableServer.POA poa, byte[] objectId)
  {
    return (String[])__ids.clone ();
  }

  public Coordinator _this() 
  {
    return CoordinatorHelper.narrow(
    super._this_object());
  }

  public Coordinator _this(org.omg.CORBA.ORB orb) 
  {
    return CoordinatorHelper.narrow(
    super._this_object(orb));
  }


} // class CoordinatorPOA