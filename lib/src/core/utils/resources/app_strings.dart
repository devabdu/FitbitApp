class AppStrings {
  static const String emptySpace = ' ';
  static const String trackEasily = 'Track your Training easily';

  //Login Screen
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password';
    static const String resetPassword = 'Reset Password';
  static const String login = 'Login';
  static const String or = 'Or';
  static const String dontHaveAccount = 'Don\'t have an account?';
  static const String register = 'Register';

  //Onboarding Screens
  static const String getStarted = 'Get Started';
  static const String trackYourGoal = 'Track Your Goal';
  static const String dontWarryIfYouHave =
      'Don\'t worry if you have trouble determining your goals, ';
  static const String weCanHelpYou =
      'We can help you determine your goals and track your goals';

  //Register Screens
  static const String heyThere = 'Hey there,';
  static const String createAccount = 'Create an Account';
  static const String firstName = 'First Name';
  static const String acceptOurPrivacyPolicyAndTerms =
      'By continuing you accept our Privacy Policy and Term of Use';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String letsCompleteProfile = 'Let\'s complete your profile';
  static const String itWillhelpUsToKnowAboutYOu =
      'It will help us to know more about you!';
  static const String chooseGender = 'Choose Gender';
  static const String yourWeight = 'Your Weight';
  static const String kg = 'KG';
  static const String yourHeight = 'Your Height';
  static const String cm = 'CM';
  static const String next = 'Next >';
  static const String welcome = 'Welcome, ';
  static const String youAreAllSet =
      'You are all set now, let\'s reach your goals together with us';
  static const String goToHome = 'Go To Home';

  //Workout Screens
  static const String createWorkout = 'Create Workout';
  static const String workoutName = 'Workout Name';
  static const String dayOfTheWeek = 'Day of the week';
  static const String legDay = 'Leg Day';
  static const String addExercies = 'Add Exercises to the ';
  static const String add = 'Add';
  static const String sets = 'Sets';
  static const String reps = 'Reps';
  static const String weights = 'Weights';
  static const String rest = 'Rest';
  static const String done = 'Done';
  static const String exeeciseName = 'Exercise Name';
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String pause = 'Pause';
  static const String start = 'Start';
  static const String reset = 'Reset';
  static const String congratulations = 'Congratulations';
  static const String youHaveFinishedYourWorkouts =
      'you have finished your Workout';

//DashBoard View
  static const String home = 'home';
  static const String notification = 'notification';
  static const String workouts = 'workouts';
  static const String profile = 'profile';

//History Screen
  static const String historyWorkouts = 'History Workouts';

//Home Screen
  static const String welcomeBack = 'Welcome Back,';
  static const String userName = 'Jack';
  static const String workoutProgress = 'Workout Progress';
  static const String lastWeek = 'Last Week';
  static const String thisWeek = 'This Week';
  static const String weekly = 'Weekly';
  static const String latestWorkout = 'Latest Workout';
  static const String seeMore = 'See more';
  static const String fullbodyWorkout = 'Fullbody Workout';
  static const String burnCaloriesInTwentyMins =
      '180 Calories Burn | 20minutes';
  static const String loweBodyWorkout = 'Lowerbody Workout';
  static const String burnCaloriesInThrityMins =
      '180 Calories Burn | 20minutes';
  static const String abWorkout = 'Ab Workout';

  //Notification Screen
  static const String notificationScreen = 'Notification Screen';
  static const String profileScreen = 'Profile Screen';

  //Failures & Errors
  static const String firebaseFailure = 'Firebase Failure';
  static const String internetFailure = 'Internet Failure';
  static const String unexpectedError = 'Unexpected Error';
}

class AppPharses {
  String phraseConstruction(String? firstString, String? secondString) {
    return firstString! + secondString!;
  }

  String phraseConstructionWithFirstStringEmpty(String secondString) {
    return AppStrings.emptySpace + secondString;
  }

  phraseConsphraseConstructionWithFirstStringEmptyruction(secondString) {}
}
