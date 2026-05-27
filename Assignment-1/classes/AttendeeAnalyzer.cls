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
    public static Result analyzeSessions(List<Attendee>AttendeeList){
        Result res=new Result();
        if(AttendeeList==null || AttendeeList.isEmpty()){
            return res;
        }
        Map<String,Integer>sessioncountmap=new Map<String,Integer>();
        //from this loop we count the number of people who attended a particular session like S1->3,S2->9
        for(Attendee att:AttendeeList){
            for(String session:att.sessionsAttended){
                res.AllSessions.add(session);
                if(sessioncountmap.containsKey(session)){
                  sessioncountmap.put(session,sessioncountmap.get(session)+1)  ;
                }
                else{
                    sessioncountmap.put(session,1);
                }
            }
            
        }
        Integer totalAttendees=attendeeList.size();
        for(String sessionId:sessioncountmap.keySet()){
            Integer countAttendee=sessioncountmap.get(sessionId);
            //this will give us the common sessions which all attendees attended
            if(countAttendee==totalAttendees){
               res.CommonSessions.add(sessionId);
            }
            //this will give us the unique session which is attended by only one attendee
            if(countAttendee==1){
                res.UniqueSessions.add(sessionId);
            }
        }
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