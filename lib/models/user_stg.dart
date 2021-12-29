class STGUser {

  STGUser({required this.email, required this.equityInDollars, required this.uuid, required this.name});

  STGUser.fromMap(Map<String, dynamic> data)
      : uuid = data["uuid"],
        equityInDollars = data["investedDollars"],
        name = data["name"],
        email = data["email"];

  final String uuid;
  final double equityInDollars;
  final double totalDollars = 911.0;
  final String email;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "investedDollars": equityInDollars,
      "email": email,
      "uuid": uuid,
    };
  }
}
