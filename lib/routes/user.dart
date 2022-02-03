class User {
  final String name, userImage, complaintImage, timestamp, complaintId, title, description;
  final int wardNo;

  User(this.name, this.userImage, this.complaintImage, this.timestamp, this.complaintId, this.title, this.description, this.wardNo);

  static List<User> userList() {
    List<User> list = [];
    list.add(User(
        'Saoud Salih',
        'assets/images/avatar_4.jpg',
        'assets/images/garbage.jpg',
        '2022-02-02 11:05:38',
        '0001xcda1',
        'Garbage overflowed',
        'Vehicle not arrived',
        10,
        )
    );

    list.add(User(
      'Saoud Salih',
      'assets/images/avatar_4.jpg',
      'assets/images/garbage.jpg',
      '2022-02-02 11:05:38',
      '0001xcda1',
      'Garbage overflowed',
      'Vehicle not arrived',
      10,)
    );

    list.add(User(
      'Saoud Salih',
      'assets/images/avatar_4.jpg',
      'assets/images/garbage.jpg',
      '2022-02-02 11:05:38',
      '0001xcda1',
      'Garbage overflowed',
      'Vehicle not arrived',
      10,)
    );

    return list;
  }

  static User getOne() {
    return User(
      'Saoud Salih',
      'assets/images/avatar_4.jpg',
      'assets/images/garbage.jpg',
      '2022-02-02 11:05:38',
      '0001xcda1',
      'Garbage overflowed',
      'Vehicle not arrived',
      10,);
  }
}