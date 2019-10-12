const String readMissions = r'''
query getMission($nLimit: Int!) {
  launches(limit: $nLimit) {
    details
    mission_name
    launch_year
  }
}
''';