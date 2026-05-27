public class TrainingSessionProcessor {
    public static Map<String,Integer>countAttendees(Map<String,TrainingSession>inputMap){
        Map<String,Integer>resultMap=new Map<String,Integer>();
        if(inputMap==null){
            return resultMap;
        }
        for(String sessionId:inputMap.keyset()){
            TrainingSession session = inputMap.get(sessionId);
            if(session!=null && session.attendees!=null){
                Integer count=session.attendees.size();
                if(count>=2){
                    resultMap.put(sessionId,count);
                }
            }
        }
        return resultMap;
    }
    
    
    
    public class TrainingSession{
        public String sessionName;
        public List<Attendee_object__c>attendees;
        public TrainingSession(String name, List<Attendee_Object__c> attList){
            this.sessionName = name;
            this.attendees = attList;
        } 
        
    }
    public static void run(){
       Map<String, TrainingSession> sessionMap = new Map<String, TrainingSession>{ 
            'S1' => new TrainingSession('Session 1', new List<Attendee_Object__c>{ 
                new Attendee_Object__c(Name = 'Alice'), 
                new Attendee_Object__c(Name = 'Bob') 
            }), 
            'S2' => new TrainingSession('Session 2', new List<Attendee_Object__c>{ 
                new Attendee_Object__c(Name = 'Charlie') 
            }), 
            'S3' => new TrainingSession('Session 3', new List<Attendee_Object__c>{ 
                new Attendee_Object__c(Name = 'David'), 
                new Attendee_Object__c(Name = 'Eve'), 
                new Attendee_Object__c(Name = 'Frank') 
            }) 
        };
Map<String,Integer>result=countAttendees(sessionMap);
        System.debug('result is '+result);
    }
}