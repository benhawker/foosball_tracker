Match.create!([
  {team_one: "61", team_two: "62", team_one_score: 10, team_two_score: 0, winning_team: "61"},
  {team_one: "62", team_two: "61", team_one_score: 10, team_two_score: 0, winning_team: "62"},
  {team_one: "63", team_two: "61", team_one_score: 0, team_two_score: 10, winning_team: "61"},
  {team_one: "62", team_two: "63", team_one_score: 0, team_two_score: 10, winning_team: "63"},
  {team_one: "68", team_two: "63", team_one_score: 10, team_two_score: 6, winning_team: "68"},
  {team_one: "66", team_two: "63", team_one_score: 4, team_two_score: 10, winning_team: "63"},
  {team_one: "63", team_two: "66", team_one_score: 0, team_two_score: 10, winning_team: "66"},
  {team_one: "62", team_two: "61", team_one_score: 10, team_two_score: 3, winning_team: "62"},
  {team_one: "64", team_two: "61", team_one_score: 0, team_two_score: 10, winning_team: "61"},
  {team_one: "64", team_two: "61", team_one_score: 8, team_two_score: 10, winning_team: "61"},
  {team_one: "68", team_two: "61", team_one_score: 0, team_two_score: 10, winning_team: "61"},
  {team_one: "68", team_two: "64", team_one_score: 8, team_two_score: 10, winning_team: "64"},
  {team_one: "62", team_two: "68", team_one_score: 10, team_two_score: 3, winning_team: "62"},
  {team_one: "63", team_two: "67", team_one_score: 10, team_two_score: 4, winning_team: "63"},
  {team_one: "68", team_two: "65", team_one_score: 2, team_two_score: 10, winning_team: "65"},
  {team_one: "64", team_two: "65", team_one_score: 4, team_two_score: 10, winning_team: "65"},
  {team_one: "66", team_two: "65", team_one_score: 4, team_two_score: 10, winning_team: "65"},
  {team_one: "65", team_two: "68", team_one_score: 10, team_two_score: 0, winning_team: "65"},
  {team_one: "65", team_two: "68", team_one_score: 10, team_two_score: 0, winning_team: "65"}
])
Match::HABTM_Teams.create!([
  {match_id: 150, team_id: 61},
  {match_id: 150, team_id: 62},
  {match_id: 151, team_id: 62},
  {match_id: 151, team_id: 61},
  {match_id: 152, team_id: 63},
  {match_id: 152, team_id: 61},
  {match_id: 153, team_id: 62},
  {match_id: 153, team_id: 63},
  {match_id: 154, team_id: 68},
  {match_id: 154, team_id: 63},
  {match_id: 155, team_id: 66},
  {match_id: 155, team_id: 63},
  {match_id: 156, team_id: 63},
  {match_id: 156, team_id: 66},
  {match_id: 157, team_id: 62},
  {match_id: 157, team_id: 61},
  {match_id: 158, team_id: 64},
  {match_id: 158, team_id: 61},
  {match_id: 159, team_id: 64},
  {match_id: 159, team_id: 61},
  {match_id: 160, team_id: 68},
  {match_id: 160, team_id: 61},
  {match_id: 161, team_id: 68},
  {match_id: 161, team_id: 64},
  {match_id: 162, team_id: 62},
  {match_id: 162, team_id: 68},
  {match_id: 163, team_id: 63},
  {match_id: 163, team_id: 67},
  {match_id: 164, team_id: 68},
  {match_id: 164, team_id: 65},
  {match_id: 165, team_id: 64},
  {match_id: 165, team_id: 65},
  {match_id: 166, team_id: 66},
  {match_id: 166, team_id: 65},
  {match_id: 167, team_id: 65},
  {match_id: 167, team_id: 68},
  {match_id: 168, team_id: 65},
  {match_id: 168, team_id: 68}
])
Team.create!([
  {player_one: "11", player_two: "20", wins: nil, win_percentage: nil},
  {player_one: "16", player_two: "", wins: 1, win_percentage: nil},
  {player_one: "19", player_two: "", wins: 1, win_percentage: nil},
  {player_one: "11", player_two: "12", wins: 5, win_percentage: nil},
  {player_one: "18", player_two: "20", wins: 1, win_percentage: nil},
  {player_one: "17", player_two: "19", wins: 3, win_percentage: nil},
  {player_one: "18", player_two: "17", wins: 3, win_percentage: nil},
  {player_one: "11", player_two: "", wins: 5, win_percentage: nil}
])
Team::HABTM_Users.create!([
  {team_id: 61, user_id: 11},
  {team_id: 61, user_id: 12},
  {team_id: 62, user_id: 17},
  {team_id: 62, user_id: 19},
  {team_id: 63, user_id: 18},
  {team_id: 63, user_id: 17},
  {team_id: 64, user_id: 18},
  {team_id: 64, user_id: 20},
  {team_id: 65, user_id: 11},
  {team_id: 66, user_id: 19},
  {team_id: 67, user_id: 11},
  {team_id: 67, user_id: 20},
  {team_id: 68, user_id: 16}
])
Team::HABTM_Matches.create!([
  {match_id: 150, team_id: 61},
  {match_id: 150, team_id: 62},
  {match_id: 151, team_id: 62},
  {match_id: 151, team_id: 61},
  {match_id: 152, team_id: 63},
  {match_id: 152, team_id: 61},
  {match_id: 153, team_id: 62},
  {match_id: 153, team_id: 63},
  {match_id: 154, team_id: 68},
  {match_id: 154, team_id: 63},
  {match_id: 155, team_id: 66},
  {match_id: 155, team_id: 63},
  {match_id: 156, team_id: 63},
  {match_id: 156, team_id: 66},
  {match_id: 157, team_id: 62},
  {match_id: 157, team_id: 61},
  {match_id: 158, team_id: 64},
  {match_id: 158, team_id: 61},
  {match_id: 159, team_id: 64},
  {match_id: 159, team_id: 61},
  {match_id: 160, team_id: 68},
  {match_id: 160, team_id: 61},
  {match_id: 161, team_id: 68},
  {match_id: 161, team_id: 64},
  {match_id: 162, team_id: 62},
  {match_id: 162, team_id: 68},
  {match_id: 163, team_id: 63},
  {match_id: 163, team_id: 67},
  {match_id: 164, team_id: 68},
  {match_id: 164, team_id: 65},
  {match_id: 165, team_id: 64},
  {match_id: 165, team_id: 65},
  {match_id: 166, team_id: 66},
  {match_id: 166, team_id: 65},
  {match_id: 167, team_id: 65},
  {match_id: 167, team_id: 68},
  {match_id: 168, team_id: 65},
  {match_id: 168, team_id: 68}
])
User.create!([
  {first_name: "Adam", last_name: "Smith", user_name: "adamsmith"},
  {first_name: "Ben", last_name: "Jones", user_name: "benjones"},
  {first_name: "Chris", last_name: "Hawker", user_name: "chrishawker"},
  {first_name: "Dan", last_name: "Irwin", user_name: "danirwin"},
  {first_name: "Emilie", last_name: "Rose", user_name: "emilierose"},
  {first_name: "Freya", last_name: "Jornet", user_name: "freyajornet"},
  {first_name: "George", last_name: "Vai", user_name: "georgevai"},
  {first_name: "Harriet", last_name: "Willow", user_name: "harrietwillow"},
  {first_name: "Isabel", last_name: "Irwin", user_name: "isabelirwin"},
  {first_name: "Jorge", last_name: "Padua", user_name: "jorgepadua"},
  {first_name: "Kevin", last_name: "Milton", user_name: "kevinmilton"}
])
User::HABTM_Teams.create!([
  {team_id: 61, user_id: 11},
  {team_id: 61, user_id: 12},
  {team_id: 62, user_id: 17},
  {team_id: 62, user_id: 19},
  {team_id: 63, user_id: 18},
  {team_id: 63, user_id: 17},
  {team_id: 64, user_id: 18},
  {team_id: 64, user_id: 20},
  {team_id: 65, user_id: 11},
  {team_id: 66, user_id: 19},
  {team_id: 67, user_id: 11},
  {team_id: 67, user_id: 20},
  {team_id: 68, user_id: 16}
])
