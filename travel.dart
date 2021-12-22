import 'dart:io';

void main() {
  var trip = Trip();

  void choices() {
    print('Please type number of the following :-');
    print(
        '1 : to add trip.\n2 : to edit trip.\n3 : to delete trip.\n4 : to view trips.\n5 : to serch trips by price.\n6 : to reserve a trip.\n7 : to exit.');
    var inputNumber = int.tryParse(stdin.readLineSync());
    if (inputNumber == 1 ||
        inputNumber == 2 ||
        inputNumber == 3 ||
        inputNumber == 4 ||
        inputNumber == 5 ||
        inputNumber == 6) {
      switch (inputNumber) {
        case 1:
          trip.addTrip();
          break;
        case 2:
          trip.editTrip();
          break;
        case 3:
          trip.deleteTrip();
          break;
        case 4:
          trip.viewTrip();
          break;
        case 5:
          trip.searchByPrice();
          break;
        case 6:
          trip.reserveTrip();
          break;
        default:
          print('please input a valid number');
      }
      choices();
    } else {
      print('Exited successfully');
    }
    ;
  }

  choices();
}

class Trip {
  late String id;
  late String location;
  late int passengerLimit;
  late DateTime date;
  late double price;
  Map<String, List> tripLimit = {};
  List tripList = [
    {
      'id': 'id-1',
      'location': 'Alex',
      'passengerLimit': 2,
      'date': DateTime.parse('2020-01-15 00:00:00.000'),
      'price': 200.0,
    },
    {
      'id': 'id-2',
      'location': 'cairo',
      'passengerLimit': 3,
      'date': DateTime.parse('2021-02-17 00:00:00.000'),
      'price': 300.0,
    },
  ];

  void addTrip() {
    print('please enter trip id :');
    id = stdin.readLineSync();
    print('please enter trip location :');
    location = stdin.readLineSync();
    print('please enter trip passengerLimit :');
    passengerLimit = int.parse(stdin.readLineSync());
    print(
        'please enter trip date in this format Year-Month-Day like 2021-01-01 :');
    date = DateTime.parse(stdin.readLineSync());
    print('please enter trip price :');
    price = double.parse(stdin.readLineSync());
    tripList.add({
      'id': id,
      'location': location,
      'passengerLimit': passengerLimit,
      'date': date,
      'price': price,
    });
    print(tripList);
  }

  void editTrip() {
    print('here is the trips id :');
    for (var trip in tripList) {
      print(trip['id']);
    }
    print('Please input trip id :');
    var tripId = stdin.readLineSync();
    for (Map trip in tripList) {
      if (tripId == trip['id']) {
        print('u entered a valid id');
        print('Please type number of the following to edit :-');
        print(
            '1 : to change Location\n2 : to change the passenger limit\n3 : to change the date\n4 : to change the price\n5 : to Exit.');
        var inputNumber = int.parse(stdin.readLineSync());
        switch (inputNumber) {
          case 1:
            print('you choose location');
            print("the old location is : ${trip['location']}");
            print('please input the new location');
            var updatedLocation = stdin.readLineSync();
            trip['location'] = updatedLocation;
            print('the upadted location is ${trip['location']}');
            print('the trip info is :  $trip');
            break;
          case 2:
            print('you choose passenger limit');
            print("the old passenger limit is : ${trip['passengerLimit']}");
            print('please input the new passenger limit');
            var updatedPassengerLimit = stdin.readLineSync();
            trip['passengerLimit'] = updatedPassengerLimit;
            print(trip['passengerLimit']);
            print('the upadted passenger limit is ${trip['passengerLimit']}');
            print('the trip info is :  $trip');
            break;
          case 3:
            print('you choose date');
            print("the old date is : ${trip['date']}");
            print(
                'please input the new date in this format Year-Month-Day like 2021-01-01 :');
            var updatedDate = DateTime.parse(stdin.readLineSync());
            trip['date'] = updatedDate;
            print('the upadted date is ${trip['date']}');
            print('the trip info is :  $trip');
            break;
          case 4:
            print('you choose price');
            print("the old price is : ${trip['price']}");
            print('please input the new price');
            var updatedPrice = double.parse(stdin.readLineSync());
            trip['price'] = updatedPrice;
            print('the upadted price is ${trip['price']}');
            print('the trip info is :  $trip');
            break;
          case 5:
            print('Exited successfully');
            break;
          default:
            print('please input a valid number');
        }
      }
    }
  }

  void deleteTrip() {
    print('here is the tips id :');
    for (var trip in tripList) {
      print(trip['id']);
    }
    print('Please input trip id :');
    var tripId = stdin.readLineSync();
    for (var trip in tripList) {
      if (tripId == trip['id']) {
        var tripIndex = tripList.indexOf(trip);
        print('u entered a valid id');
        tripList.remove(tripList[tripIndex]);
        print(tripList);
        break;
      } else if (tripId != trip['id']) {
        print('enter valid id');
      }
    }
  }

  void viewTrip() {
    print('The trips orderd by date :');
    var orderdList = List.from(tripList);
    orderdList.sort((first, last) {
      var firstDate = first['date'];
      var lastDate = last['date'];
      return firstDate.compareTo(lastDate);
    });
    orderdList.forEach((trip) {
      print('the trip id is : ${trip['id']}');
      print('the trip location is : ${trip['location']}');
      print('the trip Passenger Limit is : ${trip['passengerLimit']}');
      print('the trip date is : ${trip['date']}');
      print('the trip price is : ${trip['price']}');
      print('');
    });
  }

  void searchByPrice() {
    print('please input price to search :');
    for (var trip in tripList) {
      print('there is a trip available and the price is : ${trip['price']}');
    }
    var inputPrice = double.parse(stdin.readLineSync());
    for (var trip in tripList) {
      if (trip['price'] == inputPrice) {
        print('there is a trip matching!');
        print('the trip Location :${trip['location']}');
        print('the trip price :${trip['price']}');
        print('the trip date :${trip['date']}');
        print('the trip passenger Limit :${trip['passengerLimit']}');
        break;
      } else if (trip['price'] != inputPrice) {
        print('there are no matching trips');
      }
    }
  }

  void reserveTrip() {
    print('here is the available trips:\n');
    for (var trip in tripList) {
      var tripIndex = tripList.indexOf(trip);
      print('trip number ${tripIndex + 1} :\n');
      print('the trip Location :${trip['location']}');
      print('the trip price :${trip['price']}');
      print('the trip date :${trip['date']}');
      print('the trip passenger Limit :${trip['passengerLimit']}\n');
    }
    print('please enter trip number you want to reserve :');
    var inputNumber = int.parse(stdin.readLineSync());
    for (var trip in tripList) {
      var tripIndex = tripList.indexOf(trip);
      if (inputNumber == tripIndex + 1) {
        print(trip);
        print('please enter your name:');
        var coustmerName = stdin.readLineSync();
        if (tripLimit[trip['id']] == null) {
          tripLimit[trip['id']] = [];
        }
        if (trip['passengerLimit'] > tripLimit[trip['id']].length) {
          tripLimit[trip['id']].add(coustmerName);
          print(
              'trip reserved successfully and the remaining seats are : ${trip['passengerLimit'] - tripLimit[trip['id']].length}');
        } else {
          print('sorry... the trip is full!');
        }
        break;
      }
    }
  }
}
