class Tweet {
  int id;
  String profile;
  String author;
  String message;
  int created_date;

  Tweet(this.id, this.profile, this.created_date, this.author, this.message);

  static Tweet fromJson(Map<String, dynamic> json){
    return Tweet(json['id'], json['profile'], json['created_date'], json['author'], json['message']);
  }

  String formatDuration() {
    // Convert timestamp to DateTime
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(created_date * 1000);

    // Diff from now and tweet created date
    Duration difference = DateTime.now().difference(dateTime);

    // Should'nt have negative timestamp
    if (difference.isNegative) {
      return '';
    }

    // Format displayed date
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours}h';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    }
    return '${difference.inSeconds}s';
  }
}