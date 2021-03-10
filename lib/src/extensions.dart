extension OnString on String {
  Duration get readingDuration {
    /// insperd from this tweet
    /// `https://twitter.com/luke_pighetti/status/1363968537631547398/photo/1`
    /// autor `@luke_pighetti`

    ///* required time for user eye to catch the text
    final findingTime = Duration(seconds: 2);
    final readingTime = Duration(milliseconds: length * 40);
    return findingTime + readingTime;
  }
}
