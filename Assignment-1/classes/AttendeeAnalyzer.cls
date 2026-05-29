public class AttendeeAnalyzer {

//wrapper class for initialising data   
    public class Attendee{
       public String attendeeId;
       public String name;
       public Set<String>sessionsAttended=new Set<String>();
       // a constructor to initialise the values
        public Attendee(String attendeeId,String name,Set<String>sessionsAttended){
            this.attendeeId=attendeeId;
            this.name=name;
            this.sessionsAttended=sessionsAttended;
        }
        
    }
//result wrapper class
    public class Result{
        public Set<String>CommonSessions;
        public Set<String>UniqueSessions;
        public Set<String>AllSessions;
        
        public Result(){
            CommonSessions=new Set<String>();
            UniqueSessions=new Set<String>();
            AllSessions=new Set<String>();
        }
    }    
   public static Result analyzeSessions(List<Attendee> attendeeList) {
    Result res = new Result();
    if (attendeeList == null || attendeeList.isEmpty()) return res;

    // Initialize common sessions with the first attendee
    res.commonSessions.addAll(attendeeList[0].sessionsAttended);

    // Keep track of any session seen more than once
    Set<String> seenMoreThanOnce = new Set<String>();

    for (Attendee att : attendeeList) {
        Set<String> current = att.sessionsAttended;

        // for all sessions
        res.allSessions.addAll(current);

        // For all Common session
        res.commonSessions.retainAll(current);

        // for unique sessions
        // Finding what we have seen more than once
        Set<String> overlap = new Set<String>(res.uniqueSessions);
        overlap.retainAll(current); // These are now confirmed duplicates
        seenMoreThanOnce.addAll(overlap);

        
        res.uniqueSessions.addAll(current);
    }

    // removing duplicate sessions
    res.uniqueSessions.removeAll(seenMoreThanOnce);

    return res;
}
    
 public static void run(){
    
    List<Attendee> attendees = new List<Attendee>{ 
        new Attendee('A1', 'Alice', new Set<String>{'S1', 'S2', 'S3'}), 
        new Attendee('A2', 'Bob', new Set<String>{'S1', 'S3'}), 
        new Attendee('A3', 'Charlie', new Set<String>{'S1', 'S3', 'S4'}) 
    };

    Result res = analyzeSessions(attendees);

    System.debug('Common Sessions: ' + res.CommonSessions);
    System.debug('Unique Sessions: ' + res.UniqueSessions);
    System.debug('All Sessions: ' + res.AllSessions);
}
 
    }