const String readMissions = r'''
query getMission($nLimit: Int!) {
  launches(limit: $nLimit) {
    id
    details
    mission_name
    launch_year
    links {
      flickr_images
    }
  }
}
''';
