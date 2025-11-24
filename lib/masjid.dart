// ignore_for_file: non_constant_identifier_names

class Masjid {
  String Fajr;
  String Dhuhur;
  String Asr;
  String Maghrib;
  String Isha;
  String name;
  String city;
  int ratings;
  Masjid(
    this.Fajr,
    this.Dhuhur,
    this.Asr,
    this.Maghrib,
    this.Isha,
    this.name,
    this.city,
    this.ratings,
  );
  String? getSalahTime(String salah) {
    if (salah == 'Fajr') {
      return Fajr;
    }
    if (salah == 'Dhuhur') {
      return Dhuhur;
    }
    if (salah == 'Asr') {
      return Asr;
    }
    if (salah == 'Maghrib') {
      return Maghrib;
    }
    if (salah == 'Isha') {
      return Isha;
    }
    return '';
  }
}

final Map<String, List<Masjid>> Masjids = {
  "Saida": [
    Masjid(
      "04:42",
      "11:24",
      "02:11",
      "04:36",
      "05:56",
      "Al-Rawda",
      "Saida",
      540,
    ),
    Masjid(
      "04:43",
      "11:21",
      "02:12",
      "04:35",
      "05:58",
      "Al-Forqan",
      "Saida",
      715,
    ),
    Masjid(
      "04:42",
      "11:22",
      "02:12",
      "04:34",
      "06:00",
      "Al-Zaatari",
      "Saida",
      338,
    ),
  ],
  "Beirut": [
    Masjid(
      "04:42",
      "11:24",
      "02:11",
      "04:36",
      "05:51",
      "A'mmash",
      "Beirut",
      572,
    ),
    Masjid(
      "04:43",
      "11:21",
      "02:12",
      "04:35",
      "05:58",
      "Al-Fateh",
      "Beirut",
      1142,
    ),
    Masjid(
      "04:44",
      "11:20",
      "02:11",
      "04:33",
      "05:55",
      "Al-Majeedeyyah",
      "Beirut",
      1215,
    ),
    Masjid(
      "04:43",
      "11:21",
      "02:12",
      "04:35",
      "05:58",
      "Al-Imam Ali",
      "Beirut",
      1700,
    ),
  ],
  "Tyre": [
    Masjid(
      "04:42",
      "11:24",
      "02:11",
      "04:36",
      "05:56",
      "Zu-Alnurayn",
      "Tyre",
      415,
    ),
    Masjid("04:43", "11:21", "02:12", "04:35", "05:58", "Al-Badr", "Tyre", 315),
    Masjid("04:42", "11:22", "02:12", "04:34", "06:00", "Hamza", "Tyre", 534),
  ],
  "Tripoli": [
    Masjid(
      "04:42",
      "11:24",
      "02:11",
      "04:36",
      "05:56",
      "Al-Salam",
      "Tripoli",
      184,
    ),
    Masjid(
      "04:43",
      "11:23",
      "02:12",
      "04:35",
      "05:58",
      "Al-Taqwa",
      "Tripoli",
      840,
    ),
    Masjid(
      "04:42",
      "11:22",
      "02:12",
      "04:34",
      "06:00",
      "Al-Mostafa",
      "Tripoli",
      416,
    ),
  ],
};

List cities = ["Saida", "Beirut", "Tyre", "Tripoli"];

// class Masjid {
//   String _name;
//   String _location;
//   String _city;
//   Masjid(this._name, this._location, this._city);
// }
// final Map<String, List<Masjid>> Masjids = {
//   "Saida": [
//     Masjid("Al-Rawda", "Iliyya Cross", "Saida"),
//     Masjid("Al-Forqan", "Al-Hlaleyyeh", "Saida"),
//     Masjid("Al-Zaatari", "Al-Nejmeh Square", "Saida"),
//   ],
//   "Beirut": [
//     Masjid("Imam Ali", "Iliyya Cross", "Saida"),
//     Masjid("Al-Forqan", "Al-Hlaleyyeh", "Saida"),
//     Masjid("Al-Zaatari", "Al-Nejmeh Square", "Saida"),
//   ],
//   "Tyre": [
//     Masjid("Al-Rawda", "Iliyya Cross", "Saida"),
//     Masjid("Al-Forqan", "Al-Hlaleyyeh", "Saida"),
//     Masjid("Al-Zaatari", "Al-Nejmeh Square", "Saida"),
//   ],
//   "Tripoli": [
//     Masjid("Al-Rawda", "Iliyya Cross", "Saida"),
//     Masjid("Al-Forqan", "Al-Hlaleyyeh", "Saida"),
//     Masjid("Al-Zaatari", "Al-Nejmeh Square", "Saida"),
//   ],
// };
