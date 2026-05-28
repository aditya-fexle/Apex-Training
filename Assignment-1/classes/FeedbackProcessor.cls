public class FeedbackProcessor {

    public String feedbackId;
    public String sessionId;
    public Integer rating;

    public static List<List<Object>> filterFeedback(List<FeedbackProcessor> feedbackList){

        List<List<Object>> result = new List<List<Object>>();

        for(FeedbackProcessor f : feedbackList){
            if(f.rating != null && f.rating > 4){

                List<Object> single = new List<Object>();

                single.add(f.feedbackId);
                single.add(f.rating);

                result.add(single);
            }
        }
        return result;
    }

   
    public static void process(){

        List<FeedbackProcessor> dummylistFeedback = new List<FeedbackProcessor>();

        FeedbackProcessor f = new FeedbackProcessor();
        f.feedbackId = 'F1';
        f.sessionId = 'S1';
        f.rating = 5;

        FeedbackProcessor f2 = new FeedbackProcessor();
        f2.feedbackId = 'F2';
        f2.sessionId = 'S2';
        f2.rating = 3;

        FeedbackProcessor f3 = new FeedbackProcessor();
        f3.feedbackId = 'F3';
        f3.sessionId = 'S3';
        f3.rating = 9;

        dummylistFeedback.add(f);
        dummylistFeedback.add(f2);
        dummylistFeedback.add(f3);

        List<List<Object>> Output = filterFeedback(dummylistFeedback);

        System.debug(Output);
    }
}